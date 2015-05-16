#!/bin/bash

#########################################
##        ENVIRONMENTAL CONFIG         ##
#########################################

# Configure user nobody to match unRAID's settings
/sbin/setuser nzbdrone
usermod -u 108 nzbdrone
usermod -g 100 nzbdrone
usermod -d /home nzbdrone
chown -R nzbdrone:users /home

# Disable SSH
rm -rf /etc/service/sshd /etc/my_init.d/00_regen_ssh_host_keys.sh

#########################################
##    REPOSITORIES AND DEPENDENCIES    ##
#########################################

# Repositories
add-apt-repository "deb http://us.archive.ubuntu.com/ubuntu/ trusty universe multiverse"
add-apt-repository "deb http://us.archive.ubuntu.com/ubuntu/ trusty-updates universe multiverse"
add-apt-repository "deb http://apt.sonarr.tv/ master main"
apt-key adv --keyserver keyserver.ubuntu.com --recv-keys FDA5DFFC

# Install Dependencies
apt-get update -qq
apt-get install -qy libgdiplus libmono-cil-dev nzbdrone

#########################################
##             INSTALLATION            ##
#########################################

# Fix permissions
chown -R nzbdrone:users /opt/NzbDrone

#########################################
##                 CLEANUP             ##
#########################################

# Clean APT install files
apt-get clean -y
rm -rf /var/lib/apt/lists/* /var/cache/* /var/tmp/*

