# mxe vagrant box

This repository contains everything necessary to build a [Vagrant](https://www.vagrantup.com/) box based on [Debian buster](https://www.debian.org/releases/buster/) with a preinstalled [MinGW Cross Environment (MXE)](http://mxe.cc/) cross-building environment.

Instead of building a base box from scratch an [existing box](https://app.vagrantup.com/debian/boxes/buster64) is modified and repackaged as described by [Nicholas Cerminara](https://scotch.io/tutorials/how-to-create-a-vagrant-base-box-from-an-existing-one).

## Usage

1. Modify `share/mxe/settings.mk`.
2. Run `vagrant up --provision`.
3. Put project directory onto `share`.
4. Enter virtual machine with `vagrant ssh`.
5. Execute the build command in the project directory in the `share` directory.

## Typical build script

Put this file in the project directory where you want to build and execute it with ssh.

```sh
#!/bin/sh

MINGW_ROOT=/home/$USER/mxe
MINGW_PREFIX=$MINGW_ROOT/usr
MINGW_TARGET=x86_64-w64-mingw32.static
MINGW_PATH="$MINGW_PREFIX/$MINGW_TARGET/bin:$MINGW_PREFIX/bin"
STD_PATH="/usr/local/bin:/usr/bin:/bin:/usr/X11/bin"

PATH="$MINGW_PATH:$STD_PATH" \
  ACLOCAL_FLAGS="-I$MINGW_PREFIX/$MINGW_TARGET/share/aclocal" \
  LDFLAGS=-Wl,-S LIBS="-lstdc++ -lws2_32 -liphlpapi" \
  ./autogen.sh \
  --prefix=$MINGW_PREFIX --target=$MINGW_TARGET --host=$MINGW_TARGET \
PATH="$MINGW_PATH:$STD_PATH" make -j`nproc`
```
