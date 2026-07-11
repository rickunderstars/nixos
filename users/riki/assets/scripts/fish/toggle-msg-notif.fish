#!/usr/bin/env fish

set rules block_whatsapp block_telegram block_signal block_discord

for rule in $rules
    dunstctl rule $rule toggle
end