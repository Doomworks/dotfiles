# Path to your oh-my-zsh installation.
export ZSH=~/.oh-my-zsh
# oh-my-zsh settings
ZSH_THEME="agnoster"
DISABLE_AUTO_UPDATE="true"
DISABLE_AUTO_TITLE="true"
ENABLE_CORRECTION="true"
DISABLE_UNTRACKED_FILES_DIRTY="true"
HIST_STAMPS="yyyy-mm-dd"
plugins=(sudo sublime git)
source $ZSH/oh-my-zsh.sh
# Compilation flags
export ARCHFLAGS="-arch x86_64"
# SSH
export SSH_KEY_PATH="~/.ssh/"
# User Settings
DEFAULT_USER='cory'
case $( uname -s ) in
    Darwin) alias love='/Applications/love.app/Contents/MacOS/love';;
    *)      alias love='$HOME/.love/love';;
esac

# General aliases
alias em='emacs -nw'
alias üwidget='cd ~/Library/Application\ Support/Übersicht/widgets'
alias cm='cmus'
alias om='ncmpcpp'
alias :q='exit'
alias kg='gpgconf --kill gpg-agent && gpg-agent --daemon && echo "GPG daemon restarted"'

# Youtube-dl aliases
alias ydb='youtube-dl -f best '$1''

# Tmux aliases
alias txn='tmux new -s'
alias txl='tmux ls'
alias txa='tmux attach -t'
alias txk='tmux kill-session -t'

# Git aliases
alias gis='git status'
alias gia='git add'
alias gimf='sh ~/scripts/git_mergeandff.sh'
alias gic='git commit -S -m'
alias gip='git push'

alias gtc='git clone'

# Rust aliases
alias cgn='cargo new'
alias cgr='cargo run'
alias cgb='cargo build'

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

# Aria2c aliases
alias a2ct='aria2c -d /Volumes/Sol\ \|\ Orbit/Torrents/ $1'

# Plex Media Scanner
alias pms="/Applications/Plex\ Media\ Server.app/Contents/MacOS/Plex\ Media\ Scanner"

# Show correct name on each system
case $( hostname ) in
    Sol.local) figlet 'Sol'
               echo 'Welcome /home,' $USER
               ;;
    Vega)      figlet 'Vega'
               echo 'Greetings Navigator' $USER
               ;;
    Sirius)    figlet 'Sirius'
               echo 'Enjoy the surroundings'
               ;;
    Naos)      figlet 'Naos'
               echo 'Greetings '$USER', this vessel is at your command'
               ;;
    Rigel)     figlet 'Rigel'
               echo $USER'? Its odd to see you this far out...'
               ;;
    Fornax)    figlet 'Fornax'
               echo 'Hello '$USER', what services do you require today?'
               ;;
    Centarus)  figlet 'Centarus'
               echo 'Enjoy your stay at our data archive $USER, we have many interesting files'
               ;;
    *)         figlet 'System Unknown'
               echo '[[Error]] {{No system data}} <<Nav marker dropped, awaiting response>>'
               ;;
esac

# PATH Exports
case $(uname -s) in
    Darwin) export PATH=/Users/cory/Library/Python/3.7/bin:$PATH
            export PATH=/usr/local/opt/ncurses/bin:$PATH
            export PATH=$HOME/adb/platform-tools:$PATH
            export PYTHONPATH=$(brew --prefix)/lib/python2.7/site-packages:$PYTHONPATH
            ;;
    *)      ;;
esac
export DEVKITPRO=/opt/devkitpro
export DEVKITARM=/opt/devkitpro/devkitARM
export DEVKITPPC=/opt/devkitpro/devkitPPC

# Initialize rbenv
eval "$(rbenv init -)"
export PATH=$HOME/.rbenv/bin:/opt/local/bin:/opt/local/sbin:$PATH

# NVM
export NVM_DIR="$HOME/.nvm"
alias loadnvm='. /usr/local/opt/nvm/nvm.sh'
