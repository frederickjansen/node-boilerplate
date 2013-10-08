#!/bin/sh
echo "Creating necessary folders..."
mkdir ./static
mkdir ./static/images
mkdir ./static/css
mkdir ./static/js
mkdir ./views
mkdir ./views/layouts
mkdir ./models
mkdir ./test

echo "Copying code, markup and CSS boilerplate..."
cp ./templates/app/server.js ./server.js
cp ./templates/app/package.json ./package.json
cp ./templates/app/.gitignore ./.gitignore
cp ./templates/app/config.json ./config.json
cp ./templates/app/Makefile ./Makefile
cp ./templates/test/stub.js ./test/stub.js
curl https://raw.github.com/h5bp/html5-boilerplate/master/css/main.css > ./static/css/style.css
cp ./templates/views/500.handlebars ./views/500.handlebars
cp ./templates/views/404.handlebars ./views/404.handlebars
cp ./templates/views/index.handlebars ./views/index.handlebars
cp ./templates/views/layouts/main.handlebars ./views/layouts/main.handlebars
cp ./templates/js/script.js ./static/js/script.js
# TODO copy over the models

echo "Setting up dependencies from NPM..."
npm install

echo "Removing stuff you don't want..."
rm -rf .git
rm -rf templates
rm README.md
rm LICENSE.md
rm initproject.*

echo "Initializing new git project..."
git init
git add .
git commit -m"Initial Commit"