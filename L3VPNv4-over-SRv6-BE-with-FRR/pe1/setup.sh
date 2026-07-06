#!/bin/bash

# Create VRF and set it up
ip link add vrf-ce type vrf table 10
ip link set dev vrf-ce up

# Attach eth1 to the VRF
ip link set dev eth1 master vrf-ce

# Assign an IP address to eth1
ip addr add 10.1.1.1/24 dev eth1

# Assign dummy interface for dataplane srv6
ip link add sr0 type dummy
ip link set sr0 up
#ip link set sr0 master vrf-ce

#ip link add lo1 type dummy
#ip link set lo1 up
#ip link set lo1 master vrf-ce
#ip addr add 2001:db8:100:: dev lo1


sysctl net.vrf.strict_mode=1
sysctl net.ipv6.seg6_flowlabel=1
sysctl net.ipv6.conf.all.seg6_enabled=1


chmod 777 /var/log/frr
