#!/bin/sh

echo 'Initilizing...'

# install utility
apt install -y zip git tofrodos

# Make alias for dos2unix and unix2dos
alias dos2unix='fromdos'
alias unix2dos='todos'

echo 'Install mxe dependings...'
# @see http://mxe.cc/#requirements-debian
apt install -y \
    autoconf \
    automake \
    autopoint \
    bash \
    bison \
    bzip2 \
    flex \
    g++ \
    g++-multilib \
    gettext \
    git \
    gperf \
    intltool \
    libc6-dev-i386 \
    libgdk-pixbuf2.0-dev \
    libltdl-dev \
    libssl-dev \
    libtool-bin \
    libxml-parser-perl \
    lzip \
    make \
    openssl \
    p7zip-full \
    patch \
    perl \
    pkg-config \
    python \
    ruby \
    scons \
    sed \
    unzip \
    wget \
    xz-utils

# mount virtual box
sudo apt install build-essential dkms linux-headers-$(uname -r)

echo 'Initialize done.'
