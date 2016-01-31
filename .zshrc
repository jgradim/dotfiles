#
# Executes commands at the start of an interactive session.
#
# Authors:
#   Sorin Ionescu <sorin.ionescu@gmail.com>
#

# Source Prezto.
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

# Customize to your needs...
source /usr/local/opt/nvm/nvm.sh

export PYTHONPATH=$PYTHONPATH:/usr/local/lib/python2.7/site-packages
export ANDROID_HOME="$HOME/work/android-sdk-macosx"
export MOAI_BIN="$HOME/libs/moaisdk-osx-1.7.4/bin/osx"
export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting

# Aliases
alias moai=/Users/jgradim/libs/moaisdk-osx-1.7.4/bin/osx/moai
