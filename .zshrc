#
# Completions
#
autoload -Uz compinit
compinit

fpath=(~/.zsh $fpath)

setopt COMPLETE_IN_WORD    # Complete from both ends of a word.
setopt ALWAYS_TO_END       # Move cursor to the end of a completed word.
setopt PATH_DIRS           # Perform path search even on command names with slashes.
setopt AUTO_MENU           # Show completion menu on a succesive tab press.
setopt AUTO_LIST           # Automatically list choices on ambiguous completion.
setopt AUTO_PARAM_SLASH    # If completed parameter is a directory, add a trailing slash.
setopt NO_CASE_GLOB        # Case Insensitive Globbing

#
# History config
#
setopt BANG_HIST                 # Treat the '!' character specially during expansion.
setopt EXTENDED_HISTORY          # Write the history file in the ":start:elapsed;command" format.
setopt INC_APPEND_HISTORY        # Write to the history file immediately, not when the shell exits.
# setopt SHARE_HISTORY             # Share history between all sessions.
setopt HIST_EXPIRE_DUPS_FIRST    # Expire duplicate entries first when trimming history.
setopt HIST_IGNORE_DUPS          # Don't record an entry that was just recorded again.
setopt HIST_IGNORE_ALL_DUPS      # Delete old recorded entry if new entry is a duplicate.
setopt HIST_FIND_NO_DUPS         # Do not display a line previously found.
setopt HIST_IGNORE_SPACE         # Don't record an entry starting with a space.
setopt HIST_SAVE_NO_DUPS         # Don't write duplicate entries in the history file.
setopt HIST_REDUCE_BLANKS        # Remove superfluous blanks before recording entry.
setopt HIST_VERIFY               # Don't execute immediately upon history expansion.
setopt HIST_BEEP                 # Beep when accessing nonexistent history.

#
# History searching with up / down arrow keys
#
autoload -U up-line-or-beginning-search
autoload -U down-line-or-beginning-search
zle -N up-line-or-beginning-search
zle -N down-line-or-beginning-search
bindkey "^[[A" up-line-or-beginning-search # Up
bindkey "^[[B" down-line-or-beginning-search # Down

#
# Directory navigation
#
setopt AUTO_CD              # Auto cd to a directory without typing cd.
setopt AUTO_PUSHD           # Push the old directory onto the stack on cd.
setopt PUSHD_IGNORE_DUPS    # Don't store duplicates in the stack.
setopt PUSHD_SILENT         # Do not print the directory stack after pushd or popd.
setopt PUSHD_TO_HOME        # Push to home directory when no argument is given.
setopt CDABLE_VARS          # Change directory to a path stored in a variable.
setopt AUTO_NAME_DIRS       # Auto add variable-stored paths to ~ list.
setopt MULTIOS              # Write to multiple descriptors.
setopt EXTENDED_GLOB        # Use extended globbing syntax.
unsetopt CLOBBER            # Don't overwrite existing files with > and >>.
                            # Use >! and >>! to bypass.

# https://github.com/rupa/z
# [[ -f . /usr/local/etc/profile.d/z.sh ]] && source . /usr/local/etc/profile.d/z.sh
source /usr/local/etc/profile.d/z.sh


#
# Editors
#
export EDITOR="vim"
export VISUAL="mvim"
export PAGER="less"

#
# Aliases
#
alias ls="ls -G"
alias ll="ls -lhF"

#
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
#
export ANDROID_HOME=${HOME}/usr/local/share/android-sdk
export PATH=${PATH}:${ANDROID_HOME}/tools
export PATH=${PATH}:${ANDROID_HOME}/platform-tools

#
# direnv
#
# install
#   brew install direnv
#
eval "$(direnv hook zsh)"

#
# History in iex
#
export ERL_AFLAGS="-kernel shell_history enabled"

#
# asdf-vm
#
. $HOME/.asdf/asdf.sh
. $HOME/.asdf/completions/asdf.bash
export PATH="$(yarn global bin):$PATH"

#
# Haxe
#
export HAXE_STD_PATH="/usr/local/lib/haxe/std"

#
# kubectl
#
source <(kubectl completion zsh)

#
# Syntax highlighting for commands
#
# instal
#   brew install zsh-syntax-highlighting
#
source /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
