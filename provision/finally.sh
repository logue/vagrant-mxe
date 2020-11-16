#!/bin/sh

# remove orphan update files.
apt-get autoremove

# change file owner.
chown -R vagrant:vagrant *

# append mxe path.
export PATH=/home/vagrant/mxe/usr/bin:/home/vagrant/mxe/usr/x86_64-w64-mingw32.static/bin:/home/vagrant/mxe/usr/x86_64-w64-mingw32.shared/bin:/home/vagrant/mxe/usr/i686-w64-mingw32.static/bin:/home/vagrant/mxe/usr/i686-w64-mingw32.shared/bin:$PATH

echo 'Finish. Type `vargant ssh` and `cd share` to build own project.'
