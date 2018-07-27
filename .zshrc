# Path to your oh-my-zsh installation.
export ZSH=/Users/cory/.oh-my-zsh
# oh-my-zsh settings
ZSH_THEME="agnoster"
DISABLE_AUTO_UPDATE="true"
DISABLE_AUTO_TITLE="true"
ENABLE_CORRECTION="true"
COMPLETION_WAITING_DOTS="true"
# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"
HIST_STAMPS="yyyy-mm-dd"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git)
source $ZSH/oh-my-zsh.sh
# Compilation flags
export ARCHFLAGS="-arch x86_64"
# SSH
export SSH_KEY_PATH="~/.ssh/"
# User Settings
DEFAULT_USER='cory'
alias love='/Applications/love.app/Contents/MacOS/love'
alias emacs='emacs -nw'
alias gitpull='sh ~/scripts/git_mergeandff.sh'
figlet "Sol"
echo "Welcome /home, Cory"
export PATH=/opt/local/bin:/opt/local/sbin:$PATH
eval "$(rbenv init -)"
