for dir in `ls bundle`; do
  cd bundle/$dir
  echo "updating bundle/"$dir
  git co master
  git pull
  cd ../..
done
