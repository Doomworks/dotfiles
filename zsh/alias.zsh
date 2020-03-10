# General aliases
alias em='emacs -nw' # Open emacs in terminal
alias üwidget='cd ~/Library/Application\ Support/Übersicht/widgets' # goto to ubersicht widgets folder
alias cm='cmus'
alias om='ncmpcpp'
alias :q='exit' # Kill session with a vim command :)
alias kg='gpgconf --kill gpg-agent && gpg-agent --daemon && echo "GPG daemon restarted"' # Restart gpg-agent in current shell, needed to fix cli passcode entry
alias zp='antibody bundle < ~/dotfiles/zsh/zsh-plugins > ~/.zsh_plugins.sh && source ~/.zsh_plugins.sh' # Update static zsh plugin file

case $( uname -s ) in
    Darwin) alias love='/Applications/love.app/Contents/MacOS/love';;
    *)      alias love='$HOME/.love/love';;
esac

# mpv aliases
mpvStream() {
    mpv --title="Stream Window" "$1" --term-status-msg="" > /tmp/mpv.log &
}
alias mps='mpvStream'

# Youtube-dl aliases
ytdlBest() {
    youtube-dl -o "$HOME/Videos/Youtube/%(uploader)s/%(title)s-%(id)s.%(ext)s"  -f best "$1"
}
ytdlPlaylist() {
    youtube-dl -o "$HOME/Videos/Youtube/%(uploader)s/%(playlist)s/%(playlist_index)s - %(title)s-%(id)s.%(ext)s"  -f best "$1"
}
alias ydb='ytdlBest'     # Download at best quality, doesn't always work
alias ydp='ytdlPlaylist' # Download at 1080, should work for things ydb doesn't

# Tmux aliases
alias txn='tmux new -s'
alias txl='tmux ls'
alias txa='tmux attach -t'
alias txk='tmux kill-session -t'

# Git aliases
alias gis='git status'
alias gia='git add'
alias gimf='sh ~/scripts/git_mergeandff.sh' # Better version of 'git pull'
alias gic='git commit -S -m'
alias gip='git push'

alias gtc='git clone'
alias gts='git status'

# Rust aliases
alias cgn='cargo new'
alias cgr='cargo run'
alias cgb='cargo build'
alias cgt='cargo test'

# Brew aliases
alias bwi='brew install'
alias bwq='brew uninstall'
alias bwu='brew update'
alias bwr='brew reinstall'
alias bwu='brew upgrade'
alias bwl='brew link'
alias bss='brew services start'
alias bsh='brew services stop'
alias bsr='brew services restart'

# SSH aliases
alias naos='ssh naos.local'
alias vega='ssh vega.local'
alias cent='ssh centaurus.local'

# NixOS aliases
alias nrt='sudo nix-rebuild test'
alias nrs='sudo nix-rebuild switch'
alias nrb='sudo nix-rebuild switch --rollback'

# Aria2c aliases
alias a2ct='aria2c -d /Volumes/Sol\ \|\ Orbit/Torrents/ $1' # Download torrent using aria2c

# Plex Media Scanner
alias pms="/Applications/Plex\ Media\ Server.app/Contents/MacOS/Plex\ Media\ Scanner" # Force rescan of plex files

# 32-blit dev aliases
alias bdu="sudo dfu-util -d 0483:df11 -a 0 -s 0x08000000 -D"
alias bdf="mkdir build.stm32 && cd build.stm32"
alias bdm="cmake .. -DCMAKE_TOOLCHAIN_FILE=../../../32blit.toolchain && make"
alias bdr="cmake .. && make"
alias bcf="mkdir build && build"
