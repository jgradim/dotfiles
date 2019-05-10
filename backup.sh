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
)

for i in "${files[@]}"
do
  cp -vr ~/"$i" .
done
