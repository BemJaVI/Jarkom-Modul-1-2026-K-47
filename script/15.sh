# Buka file .pcap ke Wireshark
# Filter
usb

# Cari packet berjenis GET DESCRIPTOR > USB Device Decriptor
Vendor ID: Logitech, Inc. (0x046d)
Product ID device USB: Keyboard K120 (0xc31c)
Alamat nomor device USB: 7 # Lihat packet jenis URB
Secret Message: 1a 0c 15 08 07 2d 13 15 12 17 12 06 12 0f 2d 24 2d 0c 16 2d 04 0f 0c 19 08 2d 1f 27 1f 23 (Wired_Protocol_7_is_alive_2026)

# Validasi 
nc 10.4.89.250 3402