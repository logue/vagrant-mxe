#!/bin/sh

echo 'Build mxe.'

cd mxe
git pull
make

echo 'Finish build.'
