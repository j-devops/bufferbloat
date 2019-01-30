
#LAN
a=off
que=10
i=eno2

ethtool -K $i rx $a tx $a
ethtool -K $i tso $a
ethtool -K $i gso $a
ifconfig $i txqueuelen $que

ethtool -k $i
ifconfig $i

#WAN
a=on
que=1000
i=enp5s0

ethtool -K $i rx $a tx $a
ethtool -K $i tso $a
ethtool -K $i gso $a
ifconfig $i txqueuelen $que

ethtool -k $i
ifconfig $i

#sysctl for fq_codel
sysctl -w net.core.default_qdisc=fq_codel

#other tweaks
sysctl -w net.netfilter.nf_conntrack_max=1048576
sysctl -w net.nf_conntrack_max=1048576
sysctl -w vm.swappiness=10
sysctl -w net.core.netdev_budget=1200
sysctl -w net.ipv4.tcp_sack=1
sysctl -w net.ipv4.tcp_ecn=1
sysctl -w net.ipv4.tcp_dsack=1

