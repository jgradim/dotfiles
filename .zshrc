#
# Executes commands at the start of an interactive session.
#
# Authors:
#   Sorin Ionescu <sorin.ionescu@gmail.com>
#

#
# prezto.
#
# install:
#   git clone --recursive https://github.com/sorin-ionescu/prezto.git "${ZDOTDIR:-$HOME}/.zprezto"
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

#
# android
#
# install
#   brew cask install android-sdk
export ANDROID_HOME=${HOME}/usr/local/share/android-sdk
export PATH=${PATH}:${ANDROID_HOME}/tools
export PATH=${PATH}:${ANDROID_HOME}/platform-tools

#
# direnv
#
# install
#   brew install direnv
eval "$(direnv hook zsh)"

#
# pass https://www.passwordstore.org/
export PASSWORD_STORE_DIR="$HOME/work/lom/passwords/"

#
# asdf-vm
#
# install
#   git clone https://github.com/asdf-vm/asdf.git ~/.asdf --branch v0.4.2
#
# dependencies:
#   brew install coreutils automake autoconf openssl libyaml readline libxslt libtool unixodbc gpg
. $HOME/.asdf/asdf.sh
. $HOME/.asdf/completions/asdf.bash
