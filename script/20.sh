# Buka file .pcap ke Wireshark
# Edit > Preferences > Protocol > TLS > File keyslog
# Filter
tls.handshake.type == 1 

# Packet Client Hello > Transport Layer Security > TLS Record Layer > Handshake Protocol > Extension: Server Name
Nama domain (SNI) yang diakses: example.com
IP server HTTPS penyerang: 93.184.216.34 # Cek IP Dest

# Hapus filter > Packet Server Hello
Versi protokol TLS yang dinegosiasikan: TLS 1.2 (0x0303)

# Filter
http

# Packet Req HTTP ke IP Penyerang > Follow > HTTP Stream
User-Agent yang digunakan: curl/7.62.0
HTTP request method dan path yang tersembunyi di dalam sesi dekripsi: HEAD /

nc 10.4.89.250 3407