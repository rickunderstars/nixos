package main

import (
	"encoding/gob"
	"fmt"
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
)

type grid [H][W]bool

func main() {
	old, err := LoadGrid()
	if err != nil {
		fmt.Fprintf(os.Stderr, "Loading error: %v\n", err)
		os.Exit(1)
	}

	evol := evolve(old)

	printGrid(evol)

	if err := SaveGrid(evol); err != nil {
		fmt.Fprintf(os.Stderr, "Saving error: %v\n", err)
		os.Exit(1)
	}
}

func randStart(m *grid) {
	clearGrid(m)
	for i := 0; i < len(m); i++ {
		for j := 0; j < len(m[i]); j++ {
			n := rand.IntN(100)
			if n < LIFE_PERCENTAGE {
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

func SaveGrid(m *grid) error {
	dir := filepath.Dir(DATA_PATH)
	if err := os.MkdirAll(dir, 0755); err != nil {
		return fmt.Errorf("Could not create directory: %w", err)
	}

	file, err := os.Create(DATA_PATH)
	if err != nil {
		return fmt.Errorf("Could not create file: %w", err)
	}
	defer file.Close()

	encoder := gob.NewEncoder(file)
	if err := encoder.Encode(m); err != nil {
		return fmt.Errorf("Encoding error: %w", err)
	}

	return nil
}

func LoadGrid() (*grid, error) {
	file, err := os.Open(DATA_PATH)
	if err != nil {
		if os.IsNotExist(err) {
			var r grid
			randStart(&r)
			return &r, nil
		}
		return nil, fmt.Errorf("Opening file error: %w", err)
	}
	defer file.Close()

	fileInfo, err := file.Stat()
	if err != nil {
		return nil, fmt.Errorf("Stat error: %w", err)
	}

	timeSinceLastRun := time.Since(fileInfo.ModTime())

	if timeSinceLastRun > RESET_TIMEOUT {
		var r grid
		randStart(&r)
		return &r, nil
	}

	var m grid
	decoder := gob.NewDecoder(file)
	if err := decoder.Decode(&m); err != nil {
		return nil, fmt.Errorf("Decoding error: %w", err)
	}

	return &m, nil
}
