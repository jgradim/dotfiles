files=(
  .ackrc
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

[ -d .vim ] || mkdir .vim
[ -d .zsh ] || mkdir .zsh
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
