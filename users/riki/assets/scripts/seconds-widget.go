package main

import (
	"fmt"
	"math/rand/v2"
	"os/exec"
	"strconv"
	"strings"
)

func main() {

	runners := []string{"", "󰖤", "󰻈", "", "󰍼", "", "󱗆", ""}
	fill := "."

	cmd := exec.Command("date", "+%S")
	c, _ := cmd.Output()
	seconds, _ := strconv.Atoi(strings.TrimSpace(string(c)))

	if seconds == 0 {
		seconds = 60
	}

	env, err := getFishVar("RUNNER_INDEX")

	runner := 0

	if err != nil || strings.TrimSpace(env) == "" || seconds == 1 {
		runner = rand.IntN(len(runners))
		setFishVar("RUNNER_INDEX", fmt.Sprintf("%d", runner))
	} else {
		runner, _ = strconv.Atoi(strings.TrimSpace(env))
	}

	bars := ""

	for i := 0; i < seconds-1; i++ {
		bars += fill
	}

	bars += runners[runner]

	for i := 0; i < 60-seconds; i++ {
		bars += " "
	}

	fmt.Printf("{%s}", bars)
}

func setFishVar(name, value string) error {
	cmd := exec.Command("fish", "-c", "set -Ux "+name+" "+value)
	return cmd.Run()
}

func getFishVar(name string) (string, error) {
	cmd := exec.Command("fish", "-c", "echo $"+name)
	output, err := cmd.Output()
	if err != nil {
		return "", err
	}
	return strings.TrimSpace(string(output)), nil
}
