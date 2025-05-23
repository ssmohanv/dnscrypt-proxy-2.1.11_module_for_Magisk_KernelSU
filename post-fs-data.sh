#!/system/bin/sh
# Do NOT assume where your module will be located.
# ALWAYS use $MODDIR if you need to know where this script
# and module is placed.
# This will make sure your module will still work
# if Magisk change its mount point in the future
MODDIR=${0%/*}

# This script will be executed in post-fs-data mode

# Redirect DNS requests to localhost
iptables -t nat -A OUTPUT -p tcp ! -d 45.11.45.11 --dport 53 -j DNAT --to-destination 127.0.0.1:5354
iptables -t nat -A OUTPUT -p udp ! -d 45.11.45.11 --dport 53 -j DNAT --to-destination 127.0.0.1:5354
# ip6tables -t nat -A OUTPUT -p tcp ! -d 45.11.45.11 --dport 53 -j DNAT --to-destination [::1]:5354
# ip6tables -t nat -A OUTPUT -p udp ! -d 45.11.45.11 --dport 53 -j DNAT --to-destination [::1]:5354

# Force disable IPv6 OS connections
resetprop net.ipv6.conf.all.accept_redirects 0
resetprop net.ipv6.conf.all.disable_ipv6 1
resetprop net.ipv6.conf.default.accept_redirects 0
resetprop net.ipv6.conf.default.disable_ipv6 1
