#!/bin/bash

# ==============================================================================
# 1. NODE ROUTER LAIN (IP FORWARDING & NAT MASQUERADE KE INTERNET)
# ==============================================================================

# Aktifkan IP Forwarding pada kernel
echo "net.ipv4.ip_forward=1" >> /etc/sysctl.conf
sysctl -p

# Konfigurasi iptables: NAT Masquerade pada interface internet (eth0)
# serta izinkan forward lalu lintas data antar interface lokal dan internet
iptables -t nat -A POSTROUTING -o eth0 -j MASQUERADE
iptables -A FORWARD -i eth1 -o eth0 -j ACCEPT
iptables -A FORWARD -i eth2 -o eth0 -j ACCEPT
iptables -A FORWARD -i eth3 -o eth0 -j ACCEPT
iptables -A FORWARD -i eth0 -m state --state ESTABLISHED,RELATED -j ACCEPT

# Simpan konfigurasi iptables agar permanen
/etc/init.d/iptables save
rc-update add iptables default
lbu commit -d


# ==============================================================================
# 2. SETIAP NODE CLIENT (ALICE, MIKA, KNIGHTS, CHISA, EIRI)
# ==============================================================================

# Konfigurasi default gateway menuju IP interface router Lain yang bersesuaian
# (Contoh: ip route add default via 10.87.x.1)
# ip route add default via <IP_GATEWAY_LAIN>

# Konfigurasi DNS Resolver ke Google Public DNS / Cloudflare
cat << 'EOF' > /etc/resolv.conf
nameserver 8.8.8.8
nameserver 1.1.1.1
EOF


# ==============================================================================
# 3. PENGUJIAN & VERIFIKASI KONEKSI DARI CLIENT
# ==============================================================================

# Verifikasi konektivitas IP dasar (ping IP address)
ping -c 4 8.8.8.8

# Verifikasi konektivitas DNS & resolusi domain (ping domain web)
ping -c 4 google.com

# Verifikasi akses web HTTP/HTTPS menggunakan curl
curl -I https://google.com
