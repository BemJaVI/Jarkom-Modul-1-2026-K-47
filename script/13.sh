#!/bin/bash

# ==============================================================================
# 1. NODE KNIGHTS (SETUP OPENSSH SERVER & AKUN)
# ==============================================================================

apk update
apk add openssh

ssh-keygen -A

adduser -D mika_admin
echo "mika_admin:12345" | chpasswd

sed -i 's/^#PubkeyAuthentication.*/PubkeyAuthentication yes/' /etc/ssh/sshd_config
sed -i 's/^PubkeyAuthentication.*/PubkeyAuthentication yes/' /etc/ssh/sshd_config

/usr/sbin/sshd


# ==============================================================================
# 2. NODE MIKA (GENERATE KUNCI & COPY KE TARGET)
# ==============================================================================

adduser -D mika_admin
echo "mika_admin:12345" | chpasswd

su - mika_admin << 'EOF'
ssh-keygen -t rsa -N "" -f ~/.ssh/id_rsa
ssh-copy-id -o StrictHostKeyChecking=no mika_admin@<IP_KNIGHTS>
EOF


# ==============================================================================
# 3. NODE KNIGHTS (KUNCI AKSES PASSWORD SECARA TOTAL)
# ==============================================================================

sed -i 's/^#PasswordAuthentication.*/PasswordAuthentication no/' /etc/ssh/sshd_config
sed -i 's/^PasswordAuthentication.*/PasswordAuthentication no/' /etc/ssh/sshd_config

killall sshd && /usr/sbin/sshd


# ==============================================================================
# 4. NODE MIKA (UJI KONEKSI TANPA PASSWORD)
# ==============================================================================

su - mika_admin << 'EOF'
ssh -o BatchMode=yes mika_admin@<IP_KNIGHTS> "hostname; id"
EOF


# ==============================================================================
# 5. CATATAN ANALISIS WIRESHARK (UNTUK LAPORAN)
# ==============================================================================

# Filter Wireshark:
# ssh

# Identifikasi Paket:
# 1. Protocol Version Exchange:
#    Paket awal berupa "Client: Protocol (SSH-2.0-...)" dan "Server: Protocol (SSH-2.0-...)"
#    di mana kedua node saling mencocokkan versi protokol SSH yang digunakan.
#
# 2. Key Exchange:
#    Paket bertuliskan "Key Exchange Init" dan pertukaran parameter algoritma 
#    Diffie-Hellman untuk menghasilkan shared symmetric key secara aman.
#
# Mengapa kredensial tidak terlihat dalam teks terbuka (seperti Telnet)?
# Berbeda dengan Telnet yang langsung mengirim kredensial pada layer aplikasi 
# secara terbuka (plain text), protokol SSH menyelesaikan fase Key Exchange 
# terlebih dahulu sebelum proses autentikasi (login) berjalan. Setelah Key Exchange 
# selesai, seluruh saluran komunikasi langsung dienkripsi simetris (terlihat sebagai 
# "Encrypted packet" di Wireshark). Data login user mika_admin dan pembuktian 
# public key dikirimkan di dalam terowongan terenkripsi ini, sehingga pihak ketiga 
# tidak dapat melihat kredensial aslinya.
