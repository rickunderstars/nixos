package main

import (
	"fmt"
	"os/exec"
	"strconv"
	"strings"
)

const (
	TICK      = ""
	CHAR      = "󱐋"
	WARN      = ""
	BAT_START = "["
	BAT_END   = "]"
)

func main() {
	s_cmd := exec.Command("cat", "/sys/class/power_supply/BAT0/status")
	s, _ := s_cmd.Output()
	status := strings.TrimSpace(string(s))

	c_cmd := exec.Command("cat", "/sys/class/power_supply/BAT0/capacity")
	c, _ := c_cmd.Output()
	capacity, _ := strconv.ParseFloat(strings.TrimSpace(string(c)), 64)

	symbol := TICK

	if status == "Charging" {
		symbol = CHAR
	} else if capacity < 10 {
		symbol = WARN
	}

	nbars := int(capacity/100.0*20.0 + 0.5)

	bars := ""

	for i := 0; i < nbars; i++ {
		bars += symbol
	}
	for i := 0; i < 20-nbars; i++ {
		bars += " "
	}

	fmt.Printf("%s%s%s %d", BAT_START, bars, BAT_END, int(capacity))
}
