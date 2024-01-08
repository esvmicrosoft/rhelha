#!/bin/bash

#Install RHEL HA Add-On

# Check if the OS is Red Hat 7.x

sudo yum install -y pcs pacemaker fence-agents-azure-arm nmap-ncat

# Check the version of the Azure Fence Agent

sudo yum info fence-agents-azure-arm

#Insert the following lines to /etc/hosts. Change the IP address and hostname to match your environment

echo '# IP address of the first cluster node
10.0.0.6 node0
# IP address of the second cluster node
10.0.0.7 node1' | sudo tee -a /etc/hosts


#Change hacluster password to the same password

echo "abc@12345678" | sudo passwd --stdin hacluster

#Add firewall rules for pacemaker



sudo firewall-cmd --add-service=high-availability --permanent
sudo firewall-cmd --add-service=high-availability


#Enable basic cluster services


sudo systemctl start pcsd.service
sudo systemctl enable pcsd.service
