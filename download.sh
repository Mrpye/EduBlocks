#!/bin/bash

echo "Installing deps"

sudo apt-get install git curl

echo "Downloading the package"

REPOSRC=https://github.com/AllAboutCode/edublocks
LOCALREPO=~/edublocks

# We do it this way so that we can abstract if from just git later on
LOCALREPO_VC_DIR=$LOCALREPO/.git

if [ ! -d $LOCALREPO_VC_DIR ]
then
    git clone $REPOSRC $LOCALREPO
else
    cd $LOCALREPO
    git reset --hard HEAD
    git pull --force $REPOSRC
fi

cd $LOCALREPO
git checkout master

bash ./install.sh

