files=(
  .ackrc
  .gitconfig
  .gitconfig-lom
  .gitconfig-mobility-labs
  .gitignore
  .gvimrc
  .irbrc
  .vimrc
  .zshrc
  .zpreztorc
)

for i in "${files[@]}"
do
  cp -v ~/"$i" .
done
