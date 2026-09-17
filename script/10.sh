#!/bin/bash

# ==============================================================================
# 1. NODE MONITORING (WIRESHARK)
# ==============================================================================

# Filter display pada Wireshark:
# icmp


# ==============================================================================
# 2. NODE KNIGHTS (EKSEKUSI PING & PENGUJIAN)
# ==============================================================================

ping -c 77 -s 128 -i 0.3 <IP_Chisa>


# ==============================================================================
# 3. CATATAN ANALISIS & NILAI ICMP (UNTUK LAPORAN)
# ==============================================================================

# ICMP Echo Request : Type = 8, Code = 0
# ICMP Echo Reply   : Type = 0, Code = 0
# Nilai packet loss & RTT (min/avg/max/mdev) diambil langsung dari ringkasan
# baris terakhir output terminal setelah 77 paket selesai dikirim.
