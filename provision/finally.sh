#!/bin/sh

# remove orphan update files.
apt-get autoremove

# change file owner.
chown -R vagrant:vagrant *

echo 'Finish. Type `vargant ssh` and `cd share` to build own project.'