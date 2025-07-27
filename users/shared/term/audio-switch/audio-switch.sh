#!/usr/bin/env bash

CONFIG_FILE="$HOME/.config/audio-outputs.txt"
CURRENT_SINK_FILE="/tmp/current-audio-sink"

if [[ ! -f "$CONFIG_FILE" ]]; then
    echo "No config file found: $CONFIG_FILE"
    exit 1
fi

mapfile -t OUTPUTS < "$CONFIG_FILE"

if [[ ${#OUTPUTS[@]} -eq 0 ]]; then
    echo "No output found in config file"
    exit 1
fi

CURRENT_SINK=$(pactl get-default-sink)

CURRENT_INDEX=-1
for i in "${!OUTPUTS[@]}"; do
    if [[ "${OUTPUTS[$i]}" == "$CURRENT_SINK" ]]; then
        CURRENT_INDEX=$i
        break
    fi
done

if [[ $CURRENT_INDEX -eq -1 ]]; then
    NEXT_INDEX=0
else
    NEXT_INDEX=$(( (CURRENT_INDEX + 1) % ${#OUTPUTS[@]} ))
fi

NEXT_SINK="${OUTPUTS[$NEXT_INDEX]}"

if pactl set-default-sink "$NEXT_SINK"; then
    echo "New output: $NEXT_SINK"

    pactl list short sink-inputs | while read -r stream; do
        STREAM_ID=$(echo "$stream" | cut -f1)
        pactl move-sink-input "$STREAM_ID" "$NEXT_SINK" 2>/dev/null || true
    done
else
    echo "Output switch error"
    exit 1
fi