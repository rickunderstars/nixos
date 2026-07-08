package main

import (
	"fmt"
	"os"
	"os/exec"
	"strings"
)

const (
	DEVICE_NAME = "Razer DeathAdder V3 Pro"
	NO_INFO     = "󰍽"
	CHARGING    = "󱐋󰍽"
	DISCHARGING = "󰍽"
)

func main() {

	get_name_cmd := exec.Command("fish", "-c", "razer-cli -ls | grep 'Razer DeathAdder V3 Pro'")
	gn, _ := get_name_cmd.Output()
	name := strings.TrimSuffix(strings.TrimSpace(string(gn)), ":")
	if len(name) == 0 {
		fmt.Print(NO_INFO + "")
		return
	}

	charge_cmd := exec.Command("fish", "-c", "razer-cli --device '"+name+"' --battery print | grep -oP 'charge: \\K\\d+'")
	c, _ := charge_cmd.Output()
	charge := strings.TrimSpace(string(c))
	if charge != "0" {
		writeBatteryLevel(charge)
	}

	charging_cmd := exec.Command("fish", "-c", "razer-cli --device '"+name+"' --battery print | grep -oP 'charging: \\K\\w+'")
	ci, _ := charging_cmd.Output()
	charging := strings.TrimSpace(string(ci))

	output := ""

	if charge == "0" {
		lvl, err := readBatteryLevel()
		if err != nil {
			writeBatteryLevel("0")
			lvl = "0"
		}
		output += NO_INFO + lvl + ""
	} else if charging == "True" {
		output += CHARGING + charge + ""
	} else if charging == "False" {
		output += DISCHARGING + charge + ""
	}

	fmt.Print(output)
}

func readBatteryLevel() (string, error) {
	uid := os.Getuid()
	path := fmt.Sprintf("/run/user/%d/last-mouse-bat.txt", uid)
	data, err := os.ReadFile(path)
	if err != nil {
		return "", err
	}
	return string(data), nil
}

func writeBatteryLevel(charge string) error {
	uid := os.Getuid()
	path := fmt.Sprintf("/run/user/%d/last-mouse-bat.txt", uid)
	data := []byte(charge)
	return os.WriteFile(path, data, 0644)
}
