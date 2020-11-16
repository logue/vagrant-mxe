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
    python \
    ruby \
    sed \
    unzip \
    wget \
    xz-utils

# for build 32bit binary
apt install -y \
    g++-multilib libc6-dev-i386

echo 'Initialize done.'
