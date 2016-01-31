files=(
  .ackrc
  .gitconfig
  .gvimrc
  .vimrc
  .zshrc
)

for i in "${files[@]}"
do
  cp -v ~/"$i" .
done
