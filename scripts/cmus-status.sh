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
            cmus-remote -Q | grep -m2 -e artist -e title | awk '{$1=""; $2=""; print}' ORS=''
        fi
        ;;
esac
