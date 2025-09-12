#!/usr/bin/env bash
# pronounce-bemenu.sh
# Requires: curl, jq, mpv (or ffplay/mpg123), bemenu

menu="bemenu --fixed-height -c -p 'Word' -i -l 1 -W 0.3 -H 30 --hp 5 --fn 'JetBrainsMono Nerd Font Mono' -B 2"

WORD=$(echo "" | eval $menu)
if [[ -z "$WORD" ]]; then
    exit 0
fi

API="https://api.dictionaryapi.dev/api/v2/entries/en/$WORD"
RESPONSE=$(curl -s "$API")

# Check if response is valid
if ! echo "$RESPONSE" | jq -e '.[0].word' >/dev/null 2>&1; then
    notify-send "❌ No result for '$WORD'"
    exit 1
fi

PHONETIC=$(echo "$RESPONSE" | jq -r '.[0].phonetic // empty')
AUDIO_URL=$(echo "$RESPONSE" | jq -r '.[0].phonetics[]?.audio' | grep -m1 "https")

# Show phonetic transcription (notification or terminal)
if [[ -n "$PHONETIC" ]]; then
    notify-send $PHONETIC
else
    notify-send "$WORD" "⚠️  No phonetic transcription found."
fi

# Play audio if available
if [[ -n "$AUDIO_URL" ]]; then
    if command -v mpv >/dev/null; then
        mpv --really-quiet "$AUDIO_URL"
    elif command -v ffplay >/dev/null; then
        ffplay -nodisp -autoexit "$AUDIO_URL" >/dev/null 2>&1
    elif command -v mpg123 >/dev/null; then
        mpg123 "$AUDIO_URL"
    else
        notify-send "⚠️ No audio player found" "Install mpv/ffplay/mpg123"
    fi
else
    notify-send "⚠️ No audio available for '$WORD'"
fi
