#!/bin/bash

set -xv
# Set this hostname
HOSTNAME=`hostname --short`
 
# Set Graphite host
GRAPHITE=10.64.32.81
GRAPHITE_PORT=2003
 
# Loop forever
while true; do
    # Get epoch
    DATE=`date +%s`
 
    # Collect some random data for
    # this example
    MY_DATA=`ls /tmp | wc -l`
 
    # Send data to Graphite
    echo "stats.${HOSTNAME}.tmp.file.count ${MY_DATA} ${DATE}" | nc $GRAPHITE $GRAPHITE_PORT
 
    sleep 10
done
