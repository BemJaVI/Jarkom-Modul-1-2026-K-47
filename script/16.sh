# Buka file .pcap ke Wireshark
# Filter
ftp || ftp-data

# Cari IP Penyerang dengan Target dengan melihat isi packet file yang mencurigakan
IP Server Target: 10.7.3.60
IP Server FTP Attacker: 198.51.100.7 # Mengirim file malware .exe
# Cari yang isi packet: Welcome to...
Banner Software FTP: vsftpd 3.0.5
# Cek kredensial login Attacker dari upaya login
Username: knights_agent
Password: N4v1_s3cur3_2026
# Filter
tcp.port == [port_data_ftp] # Cek size in bytes file malware, ada di packet setelah Request: SIZE
Ukuran file: 524288

nc 10.4.89.250 3403
