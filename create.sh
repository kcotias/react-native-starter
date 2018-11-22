#!/bin/bash

if [ $# -lt 2 ]; then
    echo "Choose what to create [screens, or components] and a name as parameter!"
    exit 1
fi

if [ ! -d "App" ]; then
    echo "Folder 'App' not found. you have to be on root folder!"
    exit 1
fi

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
mkdir App/$1/$2
cd App/$1/$2
if [ "$1" = "components" ]; then
    cp $DIR/templates/template/templateConst.js .
    mv templateConst.js $2.js
else
    cp $DIR/templates/template/template.js .
    mv template.js $2.js
fi
cp $DIR/templates/template/index.js .
cp $DIR/templates/template/styles.js .
sed -i "s/template/$2/g" $2.js 
sed -i "s/template/$2/g" index.js
cd ../
sed -i "1 i\import $2 from './$2';" index.js
sed -i "/\export {/a\    $2," index.js
echo "Success! Job Done! Happy coding :)"