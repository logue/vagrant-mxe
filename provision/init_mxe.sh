#!/bin/sh

echo 'Mxe setup.'

# fetch latest mxe
git clone https://github.com/mxe/mxe.git

cd mxe
git pull

# make symbolic link
ln -s ../share/settings.mk

echo 'Finish Mxe setup.'
