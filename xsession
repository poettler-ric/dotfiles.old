#!/usr/bin/bash

mail_str() {
    COUNT=$(find ~/.mail/gmail/Inbox/new/ -type f -printf . | wc -c)
    if [ "$COUNT" -gt 0 ]; then
        printf "mails: %d" "$COUNT"
    fi
}

date_str() {
    date "+%Y-%m-%d %H:%M"
}

while true; do
    LINE="$(mail_str) $(date_str)"
    TRIMED="$(echo -e "$LINE" | sed 's/^[[:space:]]//')"
    xsetroot -name "$TRIMED"
    sleep 1m
done &

firefox &

exec dwm-start
