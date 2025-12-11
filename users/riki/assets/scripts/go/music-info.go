package main

import (
	"fmt"
	"os/exec"
	"strings"
	"time"
)

func main() {
	cmd := exec.Command("playerctl", "metadata", "--format", " {{ artist }} - {{ title }} ")
	info, err := cmd.Output()

	if err != nil {
		return
	}

	text := strings.TrimSpace(string(info))

	const maxLen = 40
	const speedMs = 500
	const separator = "   ---   "

	runes := []rune(text)

	if len(runes) <= maxLen {
		fmt.Print(string(runes))
		return
	}

	fullText := []rune(text + separator)
	totalLen := int64(len(fullText))

	currentIdx := (time.Now().UnixMilli() / speedMs) % totalLen

	rotated := append(fullText[currentIdx:], fullText[:currentIdx]...)

	fmt.Print(string(rotated[:maxLen]))
}
