#!/bin/bash

# ==============================================================================
# 1. NODE CHISA (SETUP TELNET SERVER & AKUN)
# ==============================================================================

# Instalasi paket tambahan (jika telnetd belum tersedia di Alpine)
apk update
apk add busybox-extras

# Buat akun target: phantom_user dengan password: wired_ghost
adduser -D phantom_user && echo "phantom_user:wired_ghost" | chpasswd

# Jalankan daemon telnet
telnetd


# ==============================================================================
# 2. NODE EIRI (EKSEKUSI LOGIN)
# ==============================================================================

# (Pastikan Wireshark sudah menyadap kabel sebelum perintah ini dijalankan)

telnet <IP_NODE_CHISA>
# Name: phantom_user
# Password: wired_ghost

# (Ketik 'exit' setelah berhasil masuk untuk menutup sesi)


# ==============================================================================
# 3. CATATAN ANALISIS WIRESHARK (UNTUK LAPORAN)
# ==============================================================================

# A. Menemukan Kredensial Plain Text:
# - Di Wireshark, gunakan filter: telnet
# - Klik kanan pada salah satu paket Telnet, lalu pilih: Follow -> TCP Stream
# - Kredensial (phantom_user & wired_ghost) akan terlihat jelas tanpa sensor.

# B. Analisis Karakter Terpisah:
# Mengapa setiap karakter terkirim dalam paket TCP terpisah? 
# Karena Telnet beroperasi menggunakan metode interaktif "Character Mode". 
# Setiap kali pengguna menekan satu tombol di keyboard, karakter tersebut 
# langsung dikirimkan di dalam satu paket TCP individu ke server, lalu server 
# mengirimkan balasan (echo) kembali ke layar pengguna. Itulah mengapa di 
# TCP Stream, teksnya sering terlihat ganda (misal: pphhaannttoomm).
