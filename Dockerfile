# Build environment for LineageOS

FROM ubuntu:16.04
LABEL maintainer "mailsvb@gmail.com"

ENV DEBIAN_FRONTEND noninteractive

RUN sed -i 's/main$/main universe/' /etc/apt/sources.list
RUN apt-get -qq update && apt-get -qqy upgrade

# Install build dependencies
RUN apt-get install -y bison build-essential curl flex git gnupg gperf libesd0-dev liblz4-tool libncurses5-dev libsdl1.2-dev libwxgtk3.0-dev libxml2 libxml2-utils lzop maven openjdk-8-jdk pngcrush schedtool squashfs-tools xsltproc zip zlib1g-dev g++-multilib gcc-multilib lib32ncurses5-dev lib32readline6-dev lib32z1-dev ccache rsync tig sudo imagemagick bc bsdmainutils file screen bash-completion wget nano

# Install additional packages which are useful for building Android
# RUN apt-get install -y android-tools-adb android-tools-fastboot

# Install repo
RUN curl http://commondatastorage.googleapis.com/git-repo-downloads/repo > /bin/repo && chmod +x /bin/repo

# prepare and init directory
RUN mkdir /mnt/android && cd /mnt/android && repo init -u https://github.com/LineageOS/android.git -b cm-14.1

# prepare local manifests directory
RUN mkdir /mnt/android/.repo/local_manifests
ADD ZUKZ1.xml /mnt/android/.repo/local_manifests/ZUKZ1.xml

# set workdir
WORKDIR /mnt/android

CMD /bin/bash
