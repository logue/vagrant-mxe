#!/bin/sh

echo 'Build mxe.'

cp share/settings.mk mxe/settings.mk -f

cd mxe
git pull
make

echo 'Finish build.'