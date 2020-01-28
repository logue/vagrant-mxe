#!/bin/sh

echo 'Mxe setup.'

# remove exists mxe settings.mk
rm mxe/settings.mk

# fetch latest mxe
git clone https://github.com/mxe/mxe.git

# copy mxe setting.mk
cp share/settings.mk mxe/settings.mk

# build
cd mxe
git pull

# make
chown -R vagrant:vagrant

echo 'Finish. type `vargant ssh`.'
