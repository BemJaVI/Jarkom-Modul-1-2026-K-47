# Masuk ke GNS3 Web Client dengan IP Group
http://10.4.89.250/

# Add Router (Lain) > Config pake IP Prefix K-47: 10.87.x.x
auto eth0
iface eth0 inet dhcp

auto eth1
iface eth1 inet static
    address 10.87.1.1
    netmask 255.255.255.0

auto eth2
iface eth2 inet static
    address 10.87.2.1
    netmask 255.255.255.0

auto eth3
iface eth3 inet static
    address 10.87.3.1
    netmask 255.255.255.0

alice
auto eth0
iface eth0 inet static
    address 10.87.1.2
    netmask 255.255.255.0
    gateway 10.87.1.1

# Switch 1
# Client 1: Alice
    address 10.87.1.2
    netmask 255.255.255.0
    gateway 10.87.1.1

# Client 2: Mika
    address 10.87.1.3
    netmask 255.255.255.0
    gateway 10.87.1.1

# Switch 2
# Client 1: Chisa
    address 10.87.2.2
    netmask 255.255.255.0
    gateway 10.87.2.1

# Switch 3
# Client 1: Knights
    address 10.87.3.2
    netmask 255.255.255.0
    gateway 10.87.3.1

# Client 2: Eiri
    address 10.87.3.3
    netmask 255.255.255.0
    gateway 10.87.3.1


