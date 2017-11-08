files=(
  .ackrc
  .gitconfig
  .gitconfig-lom
  .gitconfig-mobility-labs
  .gitignore
  .gvimrc
  .vimrc
  .zshrc
)

for i in "${files[@]}"
do
  cp -v ~/"$i" .
done
