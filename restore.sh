files=(
  .ackrc
  .gitconfig
  .gitignore
  .gvimrc
  .irbrc
  .vimrc
  .zshrc
  .zpreztorc
  .scripts
  .vim/coc-settings.json
)

mkdir ~/.vim

for i in "${files[@]}"
do
  if [[ $i =~ "/" ]]
  then
    cp -vr "$i" ~/"$i"
  else
    cp -vr "$i" ~/
  fi
done
