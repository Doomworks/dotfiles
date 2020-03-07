convertsecs() {
    m=`expr $1  % 3600 / 60`
    s=`expr $1 % 60`
    printf "%02d:%02d\n" $m $s
}

dur=$(cmus-remote -Q | grep duration | head -n 3 | cut -d ' ' -f 2)
pos=$(cmus-remote -Q | grep position | head -n 3 | cut -d ' ' -f 2)
echo "- "$(convertsecs $pos)"/"$(convertsecs $dur)
