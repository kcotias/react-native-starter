#!/bin/bash
# script to create a react native project structure
# alias rnbootstrap='sh ~/scripts/reactNativeBootstrap.sh $*'
if [ $# -lt 2 ]; then
   echo "Choose an option [init, screen, or component] and a name as parameter!"
   exit 1
fi

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

case "$1" in 
  init)
  bash $DIR/init.sh $2
  ;;
  screen)
  bash $DIR/create.sh screens $2
  ;;
  component)
  bash $DIR/create.sh components $2
  ;;
  *)
  echo "Choose an option [init, screen, or component]"
  exit 1
  ;;
esac
