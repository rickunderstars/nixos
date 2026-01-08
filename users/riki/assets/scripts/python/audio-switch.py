#!/usr/bin/env python3
import subprocess

# --- CONFIGURATION ---

# List of devices to skip, leave empty for no filtering. Device names can be found by running the command "pactl list sinks short".
SKIP_SINK_NAMES = [
    "easyeffects_sink",
    "alsa_output.pci-0000_07_00.1.pro-output-3",
    "alsa_output.pci-0000_07_00.1.pro-output-8",
    "alsa_output.pci-0000_07_00.1.pro-output-9",
]

ENABLE_NOTIFICATIONS = True  # Set to False to disable notifications

# ---


def notify(message):
    if ENABLE_NOTIFICATIONS:
        try:
            subprocess.run(
                ["dbus-launch", "dunstify", "Audio Switch", message], check=False
            )
        except FileNotFoundError:
            pass


def get_sinks():
    try:
        sinks_string = subprocess.check_output(
            ["pactl", "list", "sinks", "short"], encoding="utf-8"
        )
        default_sink = subprocess.check_output(
            ["pactl", "get-default-sink"], encoding="utf-8"
        )
    except FileNotFoundError:
        print("Error: pactl (pulseaudio) not found.")
        return []

    # splits output in lines
    sinks_lines = sinks_string.strip().splitlines()

    # default (active) sink
    active = default_sink.strip()

    # Parse sinks
    parsed_sinks = []
    for sink_line in sinks_lines:
        sink = sink_line.split()
        sink_name = sink[1]

        if sink_name not in SKIP_SINK_NAMES:
            is_default = sink_name == active
            parsed_sinks.append(
                {
                    "sink_id": int(sink[0]),
                    "sink_name": sink_name,
                    "is_default": is_default,
                }
            )

    return parsed_sinks


def toggle_sink():
    sinks = get_sinks()
    if not sinks:
        return

    # find current device index
    current_index = next((i for i, sink in enumerate(sinks) if sink["is_default"]), -1)

    # calculate next device in list (cyclic)
    # if no default is found, start from 0
    if current_index == -1:
        next_index = 0
    else:
        next_index = (current_index + 1) % len(sinks)

    next_sink = sinks[next_index]

    # set default device
    subprocess.run(["pactl", "set-default-sink", str(next_sink["sink_name"])])

    # Send notification
    notify(f"{next_sink['sink_name']}")


# execute
if __name__ == "__main__":
    toggle_sink()
