package main

import (
	"fmt"
	"os/exec"
)

func main() {
	cmd := exec.Command("playerctl", "metadata", "--format", " {{ artist }} - {{ title }}")
	info, err := cmd.Output()

	if err != nil {
		fmt.Printf("")
		return
	}

	fmt.Printf("%s", info)
}
