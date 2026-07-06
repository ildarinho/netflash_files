#!/bin/bash

# Assign dummy interface for dataplane srv6
ip link add sr0 type dummy
ip link set sr0 up

sysctl net.vrf.strict_mode=1
sysctl net.ipv6.seg6_flowlabel=1
sysctl net.ipv6.conf.all.seg6_enabled=1
