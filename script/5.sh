#!/bin/bash

# ==============================================================================
# 1. NODE ROUTER LAIN (KONFIGURASI PERMANEN & PEMBUATAN SCRIPT)
# ==============================================================================

/etc/init.d/iptables save
rc-update add iptables default

cat << 'EOF' > /root/cek_status.sh
#!/bin/sh
ip -br a
iptables -t nat -L -v -n
EOF

chmod +x /root/cek_status.sh

lbu commit -d


# ==============================================================================
# 2. NODE ROUTER LAIN (UJI COBA & VERIFIKASI SETELAH REBOOT)
# ==============================================================================

reboot

/root/cek_status.sh
