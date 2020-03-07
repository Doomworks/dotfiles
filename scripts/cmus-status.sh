#!/bin/sh

case "$1" in
    --toggle)
        if cmus-remote -Q | grep -q 'status playing'; then
            cmus-remote -u
        else
            cmus-remote -p
        fi
        ;;
    *)
        if cmus-remote -Q | grep -q 'status playing'; then
            cmus-remote -Q | grep tag | head -n 3 | cut -d ' ' -f 3- | awk '{print}' ORS=' | ' | sed '$s/..$//' && sh ~/dotfiles/scripts/cmus-pos.sh
        fi
        ;;
esac
