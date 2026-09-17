# Add knights_report.txt di Node Knights
# Knights
nano knights_report.sh
==================================================
  KNIGHTS OF THE EASTERN CALCULUS — STATUS REPORT
  Protocol 7 Surveillance Network
  Classification: LEVEL 7 — EYES ONLY
==================================================

Date: [CLASSIFIED]
Agent: Knights Unit Alpha
Node: Switch 3 — Subnet 10.<PREFIX>.3.0/24

---

SUBJECT: Network Reconnaissance Report

The Wired has been successfully infiltrated through
Protocol 7 channels. Current observations:

1. Router "Lain" has been identified as the central
   gateway node connecting all three subnet segments.

2. Switch 1 (10.<PREFIX>.1.0/24) hosts Alice and Mika.
   Both nodes show standard traffic patterns.

3. Switch 2 (10.<PREFIX>.2.0/24) hosts Chisa alone.
   Isolated subnet — minimal cross-traffic observed.

4. Switch 3 (10.<PREFIX>.3.0/24) — our operational base.
   Knights and Eiri coexist on this segment.

RECOMMENDATION:
Continue monitoring FTP and Telnet sessions for
plaintext credential exposure. SSH tunnels remain
impenetrable without keylog access.

--- END OF REPORT ---
Knights of the Eastern Calculus
"Let's all love Lain."

#Chisa
curl -T knights_report.txt ftp://10.87.2.2/ --user alice:alice # Upload file ke Chisa dengan akun Alice
nano /etc/vsftpd/vsftpd.conf

# Tambahkan 
write_enable=YES
allow_writeable_chroot=YES

# Ke GNS3, Start capture dan Open Wireshark di kabel Lain-Switch 2
curl -T knights_report.txt ftp://10.87.2.2/ --user alice:alice

#Wireshark
ftp # Sebagai filter