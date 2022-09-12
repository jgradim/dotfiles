files=(
  .ackrc
  .config/nvim/init.lua
  .config/kitty/kitty.conf
  .config/kitty/current-theme.conf
  .gitconfig
  .gitignore
  .gvimrc
  .irbrc
  .p10k.zsh
  .scripts
  .vimrc
  .zsh/git-completion.zsh
  .zshrc
)

folders=(
  .config/nvim
)

[ -d .vim ] || mkdir .vim
[ -d .zsh ] || mkdir .zsh
[ -d .config/nvim ] || mkdir -p .config/nvim
[ -d .config/kitty ] || mkdir -p .config/kitty

for i in "${files[@]}"
do
  if [[ $i =~ "/" ]]
  then
    cp -vr ~/"$i" ./"$i"
  else
    cp -vr ~/"$i" .
  fi
done

for i in "${folders[@]}"
do
  cp -vr ~/"$i"/ ./"$i"
done
