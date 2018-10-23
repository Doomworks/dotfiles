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
alias emacs='emacs -nw'
alias gitpull='sh ~/scripts/git_mergeandff.sh'
alias üwidget='cd ~/Library/Application\ Support/Übersicht/widgets'
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
               echo 'Enjoy your stay at out data archive $USER, we have many interesting files'
               ;;
    *)         figlet 'System Unknown'
              echo '[Error]{No system data}<Nav marker dropped, awaiting response>'
              ;;
esac
export PATH=$HOME/.rbenv/bin:/opt/local/bin:/opt/local/sbin:$PATH
eval "$(rbenv init -)"
