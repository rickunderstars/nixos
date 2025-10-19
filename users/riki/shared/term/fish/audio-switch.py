#!/usr/bin/env python3
import subprocess
import re

# --- CONFIGURATION ---

  # List of devices to skip, leave empty for no filtering
SKIP_SINK_NAMES = [
	"GA102 High Definition Audio Controller Pro",
	"GA102 High Definition Audio Controller Pro 9",
	"GA102 High Definition Audio Controller Pro 8"
	]

ENABLE_NOTIFICATIONS = True  # Set to False to disable notifications

# ---

def notify(message):
    """Send a notification if enabled."""
    if ENABLE_NOTIFICATIONS:
        subprocess.run(["dbus-launch", "dunstify", "Audio Switch", message])


def get_sinks():
    """Retrieve available audio sinks."""
    output = subprocess.check_output(["wpctl", "status"], encoding="utf-8")

    # Remove ASCII tree characters
    lines = output.replace("├", "").replace("─", "").replace("│", "").replace("└", "").splitlines()

    # Search for "Sinks:"
    sinks_index = next((i for i, line in enumerate(lines) if "Sinks:" in line), None)
    if sinks_index is None:
        return []

    # Extract sinks
    sinks = []
    for line in lines[sinks_index + 1:]:
        if not line.strip():
            break
        sinks.append(line.strip())

    # Parse sinks
    parsed_sinks = []
    for sink in sinks:
        is_default = sink.startswith("*")  # Detect default sink
        sink = sink.lstrip("*").strip()

        sink_match = re.match(r"^(\d+)\.\s*([^\[]+)", sink)
        if sink_match:
            sink_id, sink_name = sink_match.groups()
            sink_name = sink_name.strip()
            if sink_name not in SKIP_SINK_NAMES:
                parsed_sinks.append({"sink_id": int(sink_id), "sink_name": sink_name, "is_default": is_default})

    return parsed_sinks

def toggle_sink():
    """Switch to the next audio sink."""
    sinks = get_sinks()
    if not sinks:
        return

    # Find current default device
    current_index = next((i for i, sink in enumerate(sinks) if sink["is_default"]), -1)
    if current_index == -1:
        return

    # Calculate next device in list (cyclic)
    next_index = (current_index + 1) % len(sinks)
    next_sink = sinks[next_index]

    # Set default device
    subprocess.run(["wpctl", "set-default", str(next_sink['sink_id'])])

    # Send notification
    notify(f"{next_sink['sink_name']}")

# Execute script
toggle_sink()