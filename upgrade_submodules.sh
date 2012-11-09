for dir in `ls bundle`; do
  cd bundle/$dir
  git co master
  cd ../..
done
