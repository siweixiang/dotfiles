iptables -F
iptables -X
iptables -Z

iptables -P INPUT DROP
iptables -P FORWARD DROP
iptables -P OUTPUT ACCEPT

iptables -A INPUT -m conntrack --ctstate ESTABLISHED,RELATED -j ACCEPT
iptables -A INPUT -i lo -j ACCEPT
iptables -A INPUT -m conntrack --ctstate INVALID -j DROP
iptables -A INPUT -p icmp --icmp-type 8 -m conntrack --ctstate NEW -j ACCEPT


# Enabling transmission
iptables -A INPUT -m conntrack --ctstate RELATED,ESTABLISHED -p udp --dport 51413 -j ACCEPT

# Drop broadcast / multicast packets
iptables -A INPUT -d 255.255.255.255/0.0.0.255 -j DROP
iptables -A INPUT -d 224.0.0.1 -j DROP
