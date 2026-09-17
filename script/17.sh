# Buka file .pcap ke Wireshark
# Filter
http.request.method == "GET" 

# Pilih packet berisi GET > Cek Packet Details
Alamat IP Server Attacker: 203.0.113.42 # Di IPv4
Domain tempat malware diunduh: wired-update.net\r\n # Di Hypertext Transfer Protocol
# Cari yang berakhiran .exe
Nama file executable malware: navi_agent.exe
# Follow > HTTP Stream pada packet GET
Kode status HTTP yang dikembalikan: 200

nc 10.4.89.250 3404