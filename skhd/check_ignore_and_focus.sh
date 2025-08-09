#!/bin/bash

DIR="$HOME/.config/skhd"
IGNORE_FILE="$DIR/skhd-ignore-apps.txt"
DIRECTION=$1

CURRENT_APP=$(yabai -m query --windows --window | jq -r '.app')

if [ -f "$IGNORE_FILE" ] && grep -Fxq "$CURRENT_APP" "$IGNORE_FILE"; then
  # приложение в игнор-листе — не делать ничего
  exit 0
else
  # переключаемся в нужном направлении
  yabai -m window --focus "$DIRECTION"
fi

