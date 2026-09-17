#!/bin/bash

# ==============================================================================
# 1. NODE KNIGHTS (MEMASTIKAN STATUS PORT SESUAI SKENARIO)
# ==============================================================================

# Pastikan port 22 (SSH) aktif
/usr/sbin/sshd 2>/dev/null

# Pastikan port 80 (HTTP) aktif (menggunakan HTTPd bawaan BusyBox)
mkdir -p /var/www/localhost/htdocs
httpd -p 80

# Pastikan port 7777 tidak digunakan / tertutup
# (Port 7777 secara default tertutup jika tidak ada service yang me-listen)


# ==============================================================================
# 2. NODE ALICE (PEMINDAIAN PORT DENGAN NETCAT)
# ==============================================================================

# Pemindaian port terbuka (22 & 80)
nc -zv -w 2 <IP_NODE_KNIGHTS> 22
nc -zv -w 2 <IP_NODE_KNIGHTS> 80

# Pemindaian port tertutup (7777)
nc -zv -w 2 <IP_NODE_KNIGHTS> 7777


# ==============================================================================
# 3. CATATAN ANALISIS WIRESHARK (UNTUK LAPORAN)
# ==============================================================================

# Filter Wireshark:
# ip.addr == <IP_NODE_KNIGHTS> && (tcp.port == 22 || tcp.port == 80 || tcp.port == 7777)

# Analisis TCP Flags:
# 1. Port Terbuka (Port 22 & 80):
#    - Alice mengirimkan paket dengan flag [SYN] ke target.
#    - Karena port aktif dan menerima koneksi, Knights membalas dengan flag [SYN, ACK].
#    - Setelah itu, Alice mengirimkan [RST] atau [RST, ACK] untuk langsung memutuskan 
#      koneksi karena Netcat hanya melakukan pengecekan ketersediaan (port scan).

# 2. Port Tertutup (Port 7777):
#    - Alice mengirimkan paket dengan flag [SYN] ke target.
#    - Karena tidak ada layanan/daemon yang berjalan pada port 7777, kernel TCP/IP Knights 
#      langsung menolak koneksi dengan mengirimkan balasan berflag [RST, ACK] (Reset/Acknowledge).
