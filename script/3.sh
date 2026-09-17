# Pastikan Lain sudah terhubung ke internet dengan IP Forwarding
#Alice
auto eth0
iface eth0 inet static
    address 10.87.1.2
    netmask 255.255.255.0
    gateway 10.87.1.1

#Mika
auto eth0
iface eth0 inet static
    address 10.87.1.3
    netmask 255.255.255.0
    gateway 10.87.1.1

#Chisa
auto eth0
iface eth0 inet static
    address 10.87.2.2
    netmask 255.255.255.0
    gateway 10.87.2.1

#Knights
auto eth0
iface eth0 inet static
    address 10.87.3.2
    netmask 255.255.255.0
    gateway 10.87.3.1

#Eiri
auto eth0
iface eth0 inet static
    address 10.87.3.3
    netmask 255.255.255.0
    gateway 10.87.3.1

# Tes koneksi ke console Client
#Alice -> Chisa
ping 10.87.2.2
