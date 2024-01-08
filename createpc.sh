#!/bin/bash

#Create Pacemaker cluster
sudo echo "abc@12345678" |pcs host auth node0 node1 -u hacluster
sudo pcs cluster setup nw1-azr node0 node1 totem token=30000
sudo pcs cluster start --all

sudo pcs quorum expected-votes 2

sudo pcs property set concurrent-fencing=true
