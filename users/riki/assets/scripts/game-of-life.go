package main

import (
	"encoding/gob"
	"fmt"
	"hash/fnv"
	"math/rand/v2"
	"os"
	"path/filepath"
	"strings"
	"time"
)

const (
	L_CELL          = "󱓻 "
	D_CELL          = "  "
	CORNER          = " "
	LIFE_PERCENTAGE = 30
	W               = 80
	H               = 120
	DATA_PATH       = "/run/user/1000/game-of-life-state.gob"
	RESET_TIMEOUT   = 5 * time.Second
	STALL_THRESHOLD = 50
)

type grid [H][W]bool

type GameState struct {
	Grid       grid
	PrevHash   uint64
	StallCount int
}

func main() {
	state, err := LoadState()
	if err != nil {
		fmt.Fprintf(os.Stderr, "Error: %v\n", err)
		os.Exit(1)
	}

	currentHash := hashGrid(&state.Grid)
	evolved := evolve(&state.Grid)
	evolvedHash := hashGrid(evolved)

	isStalled := *evolved == state.Grid || evolvedHash == state.PrevHash || isEmpty(evolved)

	if isStalled {
		state.StallCount++
		if state.StallCount > STALL_THRESHOLD {
			randStart(evolved)
			state.StallCount = 0
			currentHash = 0
		}
	} else {
		state.StallCount = 0
	}

	printGrid(evolved)

	newState := GameState{
		Grid:       *evolved,
		PrevHash:   currentHash,
		StallCount: state.StallCount,
	}

	if err := SaveState(&newState); err != nil {
		fmt.Fprintf(os.Stderr, "Error: %v\n", err)
		os.Exit(1)
	}
}

func hashGrid(m *grid) uint64 {
	h := fnv.New64a()
	for i := 0; i < len(m); i++ {
		for j := 0; j < len(m[i]); j++ {
			if m[i][j] {
				h.Write([]byte{1})
			} else {
				h.Write([]byte{0})
			}
		}
	}
	return h.Sum64()
}

func isEmpty(m *grid) bool {
	for i := 0; i < len(m); i++ {
		for j := 0; j < len(m[i]); j++ {
			if m[i][j] {
				return false
			}
		}
	}
	return true
}

func randStart(m *grid) {
	clearGrid(m)
	for i := 0; i < len(m); i++ {
		for j := 0; j < len(m[i]); j++ {
			if rand.IntN(100) < LIFE_PERCENTAGE {
				m[i][j] = true
			} else {
				m[i][j] = false
			}
		}
	}
}

func evolve(m *grid) *grid {
	var e grid
	clearGrid(&e)
	for i := 0; i < len(m); i++ {
		for j := 0; j < len(m[i]); j++ {
			l := countLiving(m, i, j)
			if m[i][j] && l < 2 {
				e[i][j] = false
			} else if m[i][j] && l > 1 && l < 4 {
				e[i][j] = true
			} else if m[i][j] && l > 3 {
				e[i][j] = false
			} else if !m[i][j] && l == 3 {
				e[i][j] = true
			} else {
				e[i][j] = false
			}
		}
	}
	return &e
}

func clearGrid(m *grid) {
	for i := 0; i < len(m); i++ {
		for j := 0; j < len(m[i]); j++ {
			m[i][j] = false
		}
	}
}

func countLiving(m *grid, row, col int) int {
	living := 0
	for dr := -1; dr <= 1; dr++ {
		for dc := -1; dc <= 1; dc++ {
			r := ((row+dr)%H + H) % H
			c := ((col+dc)%W + W) % W
			if m[r][c] {
				living++
			}
		}
	}
	if m[row][col] {
		living--
	}
	return living
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
				sb.WriteString(L_CELL)
			} else {
				sb.WriteString(D_CELL)
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

func SaveState(s *GameState) error {
	dir := filepath.Dir(DATA_PATH)
	if err := os.MkdirAll(dir, 0755); err != nil {
		return err
	}

	file, err := os.Create(DATA_PATH)
	if err != nil {
		return err
	}
	defer file.Close()

	encoder := gob.NewEncoder(file)
	return encoder.Encode(s)
}

func LoadState() (*GameState, error) {
	file, err := os.Open(DATA_PATH)
	if err != nil {
		if os.IsNotExist(err) {
			var s GameState
			randStart(&s.Grid)
			return &s, nil
		}
		return nil, err
	}
	defer file.Close()

	fileInfo, err := file.Stat()
	if err != nil {
		return nil, err
	}

	if time.Since(fileInfo.ModTime()) > RESET_TIMEOUT {
		var s GameState
		randStart(&s.Grid)
		return &s, nil
	}

	var s GameState
	decoder := gob.NewDecoder(file)
	if err := decoder.Decode(&s); err != nil {
		return nil, err
	}

	return &s, nil
}
