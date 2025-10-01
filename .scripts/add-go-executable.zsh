#!/bin/zsh

# Get the project name from the first argument
appname=$1

go build -o $appname .
chmod +x $appname
sudo mv $appname /usr/local/bin/

echo "app <$appname> added to path"
