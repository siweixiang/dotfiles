iptables -F
iptables -X
iptables -Z
 
iptables -P INPUT DROP
iptables -P FORWARD DROP
iptables -P OUTPUT ACCEPT
 
iptables -A INPUT -m conntrack --ctstate ESTABLISHED,RELATED -j ACCEPT
iptables -A INPUT -i lo -j ACCEPT
iptables -A INPUT -p icmp --icmp-type 3 -j ACCEPT
iptables -A INPUT -p icmp --icmp-type 11 -j ACCEPT
iptables -A INPUT -p icmp --icmp-type 12 -j ACCEPT
iptables -A INPUT -p tcp --syn --dport 113 -j REJECT --reject-with tcp-reset
 
# Enabling transmission
iptables -A INPUT -m state --state RELATED,ESTABLISHED -p udp --dport 51413 -j ACCEPT
iptables -A OUTPUT -p udp --sport 51413 -j ACCEPT
iptables -A INPUT -m state --state RELATED,ESTABLISHED -p tcp --dport 51413 -j ACCEPT
iptables -A OUTPUT -p tcp --sport 51413 -j ACCEPT
