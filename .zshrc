# powerlevel10k theme
# https://github.com/romkatv/powerlevel10k#manual
#
source ~/.powerlevel10k/powerlevel10k.zsh-theme

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

#
# custom scripts
#
for f in ${HOME}/.scripts/*.sh; do
  source $f
done

#
# Homebrew
#
export HOMEBREW_NO_ANALYTICS=1

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
# History in iex
export ERL_AFLAGS="-kernel shell_history enabled"

#
# asdf-vm
#
. $HOME/.asdf/asdf.sh
. $HOME/.asdf/completions/asdf.bash
export PATH="$(yarn global bin):$PATH"
