#!/bin/sh

echo 'Update system.'

# Update Repository cache
apt update
# Update packages
apt upgrade -y
# Remove cache
apt autoremove -y

echo 'Finish update system.'
