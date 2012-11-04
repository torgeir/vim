for dir in `ls`; do
  cd $dir
  git co master
  git reset HEAD --hard
  git pull origin master
  cd ..
done
