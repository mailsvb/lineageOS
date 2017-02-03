#!/bin/bash
### creating build environment on Ubuntu 16.04 for LineageOS
SOURCE=/mnt/android

## update system
apt-get update && apt-get -y upgrade

## install dependencies
apt-get install -y bison build-essential curl flex git gnupg gperf libesd0-dev liblz4-tool libncurses5-dev libsdl1.2-dev libwxgtk3.0-dev libxml2 libxml2-utils lzop maven openjdk-8-jdk pngcrush schedtool squashfs-tools xsltproc zip zlib1g-dev g++-multilib gcc-multilib lib32ncurses5-dev lib32readline6-dev lib32z1-dev ccache rsync tig sudo imagemagick bc bsdmainutils file screen bash-completion wget nano

## optional install adb and fastboot
apt-get install -y android-tools-adb android-tools-fastboot

## install repo
curl http://commondatastorage.googleapis.com/git-repo-downloads/repo > /bin/repo && chmod +x /bin/repo

## add git username
git config --global user.name 'root'
git config --global user.email 'root@localhost'

## create directory and change to it
mkdir /mnt/android && cd /mnt/android
repo init -u https://github.com/LineageOS/android.git -b cm-14.1

## create directory for local manifest and copy it
mkdir /mnt/android/.repo/local_manifests
cp ZUKZ1.xml /mnt/android/.repo/local_manifests/ZUKZ1.xml

## sync repo and build
repo sync
source build/envsetup.sh
breakfast ham
croot
brunch ham
