#!/bin/bash

#Create Pacemaker cluster

sudo echo "abc@12345678" | pcs cluster auth node0 node1 -u hacluster
sudo pcs cluster setup --name nw1-azr node0 node1 --token 30000
sudo pcs cluster start --all

sudo pcs quorum expected-votes 2

sudo pcs property set concurrent-fencing=true
