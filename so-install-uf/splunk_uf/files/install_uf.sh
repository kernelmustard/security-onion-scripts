#!/usr/bin/env bash

# PreEx Checks
[[ ! $UID == 0 ]] && echo "This script must be run as root!" && exit 1                          # root
[[ ! -d /opt/splunkforwarder ]] && echo "Configuration directory not found!" && exit 1          # config dir
cat /etc/passwd | grep splunkfwd &>/dev/null; if (( $? != 0 )); then echo "User not found!"; fi # user check

# Vars
splunk="/opt/splunkforwarder/bin/splunk"
forward_server="127.0.0.1:9997"

# Install
$splunk enable boot-start -user admin
$splunk install --accept-license --answer-yes   # will need to add existing splunk admin as user
$splunk add forward-server $forward_server      # will need to auth as splunk admin
