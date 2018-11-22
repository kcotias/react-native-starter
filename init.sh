#!/bin/bash
# script to create a react native project structure

if [ $# -lt 1 ]; then
   echo "Choose your project name as parameter!"
   exit 1
fi

# Setting dependencies
echo "Before you start, we need you to answer some questions."
echo ""
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
PROJECT=$1
project=${PROJECT,,}
adds=""
echo "Choose wich dependencies you want to install."
echo ""

# REDUX
echo "Wish to install Redux [Y/n]?"
read redux
redux=${redux:-"y"}
if [ "$redux" == "y" -o "$redux" == "Y" ]; then
  adds="${adds} redux react-redux redux-logger"

  # REDUX SAUCE  
  echo "Wish to intall ReduxSauce [Y/n]?"
    read reduxSauce
    reduxSauce=${reduxSauce:-"y"}
    if [ "$reduxSauce" == "y" -o "$reduxSauce" == "Y" ]; then
      adds="${adds} reduxsauce seamless-immutable"
    fi
fi

# LODASH
echo "Wish to install Lodash [Y/n]?"
read p
p=${p:-"y"}
if [ "$p" == "y" -o "$p" == "Y" ]; then
  adds="${adds} lodash"
fi

# FIREBASE
echo "Wish to install React Native Firebase [Y/n]?"
read p
p=${p:-"y"}
if [ "$p" == "y" -o "$p" == "Y" ]; then
  adds="${adds} react-native-firebase"
  echo "To finish install visit: https://rnfirebase.io/docs/v3.0.*/installation/initial-setup"
fi

# VECTOR ICONS
echo "Wish to install React Native Vector Icons [Y/n]?"
read p
p=${p:-"y"}
if [ "$p" == "y" -o "$p" == "Y" ]; then
  adds="${adds} react-native-vector-icons"
fi

# KEYBOARD AWARE SCROLLVIEW
echo "Wish to install React Native Keyboard Aware ScrollView [Y/n]?"
read p
p=${p:-"y"}
if [ "$p" == "y" -o "$p" == "Y" ]; then
  adds="${adds} react-native-keyboard-aware-scroll-view"
fi

# VALIDATOR JS
echo "Wish to install Validator JS [Y/n]?"
read p
p=${p:-"y"}
if [ "$p" == "y" -o "$p" == "Y" ]; then
  adds="${adds} validator"
fi

# FASTLANE
echo "Wish to configure Fastlane for this project [Y/n]?"
read fastlane
fastlane=${fastlane:-"y"}

# Coffe animation
echo "-------------------------------------------------------------------"
echo -en "Your installation has started, go grab a ☕ while you wait... [_ ]P" "\r"
sleep 0.5
echo -en "Your installation has started, go grab a ☕ while you wait... [■ ]P" "\r"
sleep 0.5
echo -en "Your installation has started, go grab a ☕ while you wait... [_ ]P" "\r"
sleep 0.5
echo -en "Your installation has started, go grab a ☕ while you wait... [■ ]P" "\r"
sleep 0.5
echo -en "Your installation has started, go grab a ☕ while you wait... [_ ]P" "\r"
sleep 0.5
echo -en "Your installation has started, go grab a ☕ while you wait... [■ ]P" "\r"
sleep 0.5
echo -en "Your installation has started, go grab a ☕ while you wait... [_ ]P" "\r"
sleep 0.5
echo "Your installation has started, go grab a ☕ while you wait... [■ ]P"
sleep 1

# Creating the project
react-native init $PROJECT

# Creating main structure and copying files from template
cd $PROJECT
sed -i "/\"scripts\": {/a\    \"postinstall\": \"rm -rf .git/hooks/pre-push && rm -rf .git/hooks/pre-commit\"," package.json
sed -i "/\"scripts\": {/a\    \"prepush\": \"yarn run lint\"," package.json
sed -i "/\"scripts\": {/a\    \"lint\": \"eslint App/\"," package.json
echo "Creating folders... This should be very quick."
mkdir App
mkdir App/components 
mkdir App/config 
mkdir App/screens 
mkdir App/utils 
mkdir App/assets
mkdir App/assets/img
rm App.js
cp $DIR/templates/App.js App/App.js
cp -R $DIR/templates/config App
cp -R $DIR/templates/screens App
cp -R $DIR/templates/utils App
cp -R $DIR/templates/assets App
cp $DIR/templates/index.js App/index.js
cp $DIR/templates/router.js App/router.js
cp $DIR/templates/.eslintrc.json .
cp $DIR/templates/.editorconfig .


# Copying conditional files based on user choices
if [ "$fastlane" == "y" -o "$fastlane" == "Y" ]; then
  # Copy Fastlane files from Android and iOS
  cp -R $DIR/templates/fastlane/android/fastlane android
  cp -R $DIR/templates/fastlane/android/android-licenses android
  cp -R $DIR/templates/fastlane/ios/fastlane ios
  # Rename bundle name on files
  sed -i "s/template/$project/g" android/fastlane/Appfile
  sed -i "s/template/$project/g" ios/fastlane/Appfile
  sed -i "s/template/$project/g" ios/fastlane/Deliverfile
  sed -i "s/template/$project/g" ios/fastlane/Fastfile
  sed -i "s/template/$project/g" ios/fastlane/Matchfile
  echo "Don't forget to remove the comments from FastLane IOS Scheme. ;)"
fi


if [ "$redux" == "y" -o "$redux" == "Y" ]; then  
  mkdir App/redux
  cp $DIR/templates/redux/index.js App/redux/index.js  
fi

# Installing aditional packages
adds="${adds} react-navigation"
yarn add --dev babel-eslint eslint eslint-config-airbnb eslint-plugin-import eslint-plugin-jsx-a11y eslint-plugin-react eslint-plugin-react-native
yarn add $adds

# Link
react-native link

# Git
git init

echo "Job Done! Happy Coding! Dont forget to leave a Star! :)"