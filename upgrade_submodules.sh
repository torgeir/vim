for dir in `ls bundle`; do
  cd bundle/$dir
  git co master
  git pull
  cd ../..
done
