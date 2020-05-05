# PATH Exports
case $(uname -s) in
    Darwin)  #export PATH=/Users/cory/Library/Python/3.7/bin:$PATH
             export PATH=/usr/local/opt/ncurses/bin:$PATH
             export PATH=$HOME/adb/platform-tools:$PATH
#            export PYTHONPATH=$(brew --prefix)/lib/python2.7/site-packages:$PYTHONPATH
#            ;;
    *)      ;;
esac
export DEVKITPRO=/opt/devkitpro
export DEVKITARM=/opt/devkitpro/devkitARM
export DEVKITPPC=/opt/devkitpro/devkitPPC

# Initialize rbenv
#eval "$(rbenv init -)"
#export PATH=$HOME/.rbenv/bin:/opt/local/bin:/opt/local/sbin:$PATH

# NVM
export NVM_DIR="$HOME/.nvm"
alias loadnvm='. /usr/local/opt/nvm/nvm.sh'
