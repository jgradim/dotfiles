#
# Completions
#
fpath=(~/.zsh $fpath)
fpath=(${ASDF_DIR}/completions $fpath)

autoload -Uz compinit
compinit

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
unsetopt SHARE_HISTORY           # Share history between all sessions.
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
#
# Editors
#
export EDITOR="nvim"
export VISUAL="neovide --fork"
export PAGER="less"

#
# Aliases
#
alias ls="ls -G"
alias ll="ls -lhF"
alias aseprite=/Applications/Aseprite.app/Contents/MacOS/aseprite
alias pico8=/Applications/PICO-8.app/Contents/MacOS/pico8
alias nv="neovide --fork"
alias nvconf="neovide ~/.config/nvim/ --fork -- --cmd ':cd ~/.config/nvim/'"
alias tf="terraform"
alias k="kubectl"
alias dc="docker compose"

#
# starship.rs prompt
#
# brew install starship
#
eval "$(starship init zsh)"

#
# FZF
#
# brew install fzf
#
source <(fzf --zsh)

#
# Homebrew
#
export HOMEBREW_NO_ANALYTICS=1
export HOMEBREW_NO_AUTO_UPDATE=1
export PATH="$HOME/bin:/opt/homebrew/bin:$PATH"

#
# asdf-vm
#
. /opt/homebrew/opt/asdf/libexec/asdf.sh
