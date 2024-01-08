#!/bin/bash

pcs stonith create rsc_st_kdump fence_kdump pcmk_reboot_action="off" pcmk_host_list="node0 node1" timeout=30
pcs stonith create rsc_st_kdump fence_kdump pcmk_reboot_action="off" pcmk_host_list="node0 node1"
pcs stonith level add 1 node0 rsc_st_kdump
pcs stonith level add 1 node1 rsc_st_kdump
pcs stonith level add 2 node0 rsc_st_azure
pcs stonith level add 2 node1 rsc_st_azure
pcs stonith level
