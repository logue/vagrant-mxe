#!/bin/sh

# remove orphan update files.
apt-get autoremove

# change file owner.
chown -R vagrant:vagrant *

# append mxe path.
export PATH=/home/vagrant/mxe/usr/bin:$PATH

echo 'Finish. Type `vargant ssh` and `cd share` to build own project.'