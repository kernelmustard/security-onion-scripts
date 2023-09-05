#!/usr/bin/env bash

# PreEx Checks
[[ ! $UID == 0 ]] && echo "This script must be run as root!" && exit 1
[[ ! -d /opt/splunkforwarder ]] && echo "Configuration directory not found!" && exit 1

# Vars
splunk="/opt/splunkforwarder/bin/splunk"
forward_server="splunk.goldteam.io:9997"

# Install
$splunk enable boot-start
$splunk install --accept-license  # will need to add existing splunk admin as user
$splunk add forward-server $forward_server  # will need to auth as splunk admin