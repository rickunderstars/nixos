package main

import (
	"time"
	"os"
	"fmt"
	"path/filepath"
	"encoding/gob"
	"math/rand"
	"strings"

)

const (
	WHITE             = "󱓻 "
	BLACK             = "  "
	CORNER            = " "
	W                 = 80
	H                 = 120
	UPDATE_THRESHOLD  = 32 * time.Millisecond
	RESET_THRESHOLD   = 8 * time.Second
	EVOLVE_STEPS      = 8
)

type grid [H][W]bool

type Position struct {
	X int
	Y int
}

type State struct {
	Grid       grid
	Pos        Position
	Dir        int
	LastUpdate time.Time
	LastRun    time.Time
}

func main() {
	state, err := LoadState()
	if err != nil {
		fmt.Fprintf(os.Stderr, "Error: %v\n", err)
		os.Exit(1)
	}

	if !state.LastRun.IsZero() && time.Since(state.LastRun) > RESET_THRESHOLD {
		state = freshState()
	}

	if time.Since(state.LastUpdate) >= UPDATE_THRESHOLD {
		for i := 0; i < EVOLVE_STEPS; i++ {
			evolve(state)
		}
		state.LastUpdate = time.Now()
	}

	state.LastRun = time.Now()

	if err := SaveState(state); err != nil {
		fmt.Fprintf(os.Stderr, "Error: %v\n", err)
		os.Exit(1)
	}

	printGrid(&state.Grid)
}

func printGrid(m *grid) {
	var sb strings.Builder
	sb.Grow((W * 2) * (H + 2))
	sb.WriteString(CORNER)
	for j := 0; j < len(m[0]); j++ {
		sb.WriteString("  ")
	}
	sb.WriteString(CORNER)
	sb.WriteString("\n")
	for i := 0; i < len(m); i++ {
		sb.WriteString("  ")
		for j := 0; j < len(m[i]); j++ {
			if m[i][j] {
				sb.WriteString(WHITE)
			} else {
				sb.WriteString(BLACK)
			}
		}
		sb.WriteString("  \n")
	}
	sb.WriteString(CORNER)
	for j := 0; j < len(m[0]); j++ {
		sb.WriteString("  ")
	}
	sb.WriteString(CORNER)
	fmt.Println(sb.String())
}

func evolve(s *State) {
	x, y := s.Pos.X, s.Pos.Y

	if s.Grid[y][x] {
		s.Dir = (s.Dir + 1) % 4
	} else {
		s.Dir = (s.Dir + 3) % 4
	}

	s.Grid[y][x] = !s.Grid[y][x]

	switch s.Dir {
	case 0:
		y = (y - 1 + H) % H
	case 1:
		x = (x + 1) % W
	case 2:
		y = (y + 1) % H
	case 3:
		x = (x - 1 + W) % W
	}

	s.Pos = Position{X: x, Y: y}
}


func resetState(s *State) {
	s.Grid = grid{}
	s.Pos = Position{}
	s.Dir = 0
}

func freshState() *State {
	s := &State{}

	s.Pos = Position{
		X: rand.Intn(W),
		Y: rand.Intn(H),
	}
	s.Dir = rand.Intn(4)
	s.Grid[s.Pos.Y][s.Pos.X] = true

	return s
}

func statePath() string {
	return fmt.Sprintf("/run/user/%d/langton-ant-state.gob", os.Getuid())
}

func SaveState(s *State) error {
	path := statePath()
	if err := os.MkdirAll(filepath.Dir(path), 0755); err != nil {
		return err
	}

	tmp, err := os.CreateTemp(filepath.Dir(path), "langton-ant-state-*.tmp")
	if err != nil {
		return err
	}
	defer os.Remove(tmp.Name())

	if err := gob.NewEncoder(tmp).Encode(s); err != nil {
		tmp.Close()
		return err
	}
	if err := tmp.Close(); err != nil {
		return err
	}

	return os.Rename(tmp.Name(), path)
}

func LoadState() (*State, error) {
	file, err := os.Open(statePath())
	if err != nil {
		if os.IsNotExist(err) {
			return freshState(), nil
		}
		return nil, err
	}
	defer file.Close()

	var s State
	if err := gob.NewDecoder(file).Decode(&s); err != nil {
		return nil, err
	}

	return &s, nil
}