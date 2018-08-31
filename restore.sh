files=(
  .ackrc
  .gitconfig
  .gitconfig-lom
  .gitignore
  .gvimrc
  .irbrc
  .vimrc
  .zshrc
  .zpreztorc
)

for i in "${files[@]}"
do
  cp -v "$i" ~/
done

