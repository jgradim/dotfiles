files=(
  .ackrc
  .gitconfig
  .gitignore
  .gvimrc
  .irbrc
  .p10k.zsh
  .scripts
  .vim/coc-settings.json
  .vimrc
  .zshrc
)

mkdir .vim

for i in "${files[@]}"
do
  if [[ $i =~ "/" ]]
  then
    cp -vr ~/"$i" ./"$i"
  else
    cp -vr ~/"$i" .
  fi
done
