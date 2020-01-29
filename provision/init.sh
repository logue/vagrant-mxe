#!/bin/sh

echo 'Initilizing...'

# install utility
apt-get install -y zip git

# install mxe dependings
# @see http://mxe.cc/#requirements-debian
apt-get install -y \
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
    sed \
    unzip \
    wget \
    xz-utils

# for build 32bit binary
apt-get install -y \
    g++-multilib libc6-dev-i386

apt-get install -y \
    libtool-bin
