# Buka file .pcap ke Wireshark
# Filter
smb2

Nama protokol jaringan yang dieksploitasi: SMB2 # Cek kolom Protocol

# Cek packet Create Req atau Write Req
IP pengirim: 10.7.3.100 # IP Source
IP penerima: 10.7.1.50 # IP Dest

# Buka packet Create Req > SMB2 > SMB2 Header > Create Req
Nama file exe malware: wired_trojan_payload.exe
Folder  penyimpanan malware: System32 # Cek path yang ada

nc 10.4.89.250 3405