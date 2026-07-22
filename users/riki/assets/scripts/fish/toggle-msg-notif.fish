#!/usr/bin/env fish

set rules block_whatsapp block_telegram block_signal block_discord

for rule in $rules
    dunstctl rule $rule toggle
end

if test (dunstctl rules --json | jq -r '.data[0][] | select(.name.data == "block_whatsapp") | .enabled.data') = "true"
    echo "notifications disabled"
else
    echo "notifications enabled"
end