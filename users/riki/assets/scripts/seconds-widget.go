package main

import (
	"fmt"
	"os/exec"
	"strconv"
	"strings"
)

func main() {
	cmd := exec.Command("date", "+%S")
	c, _ := cmd.Output()
	seconds, _ := strconv.Atoi(strings.TrimSpace(string(c)))

	if seconds == 0 {
		seconds = 60
	}

	runners := []string{"", "󰖤", "󰻈", "", "󰞠", "󱄟", "󰍼", ""}

	runner := ""

	fill := "_"

	bars := ""

	for i := 0; i < seconds-1; i++ {

		bars += fill
	}

	bars += runner

	for i := 0; i < 60-seconds; i++ {
		bars += " "
	}

	fmt.Printf("|%s|", bars)
}
