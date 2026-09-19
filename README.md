# Jarkom-Modul-1-2026-K-47

| No | Nama | NRP |
|:---:|---|---|
| 1 | Elisabeth La Satta Sitorus | 5027251039 |
| 2 | Farrel Muhammad Athasyah Enrizy | 5027251100 |

## Pengerjaan Soal
Pengerjaan praktikum ini dilakukan di GNS3 Web Client dan GNS3 Dekstop dengan IP Server yang sudah disediakan oleh Asisten Praktikum.  
1. Masuk ke portal GNS3 Web Client sesuai IP Group Kelompok (Group C): http://10.4.89.250/
2. Masuk ke project sesuai kelompok yang sudah disediakan
3. Mulai pengerjaan soal
   
### Soal 1
1. Persiapkan NAT1 sebagai sumber internet
2. Persiapkan Router tersambung ke NAT1, beri nama dengan *change hostname* -> **Lain**
3. Buat 3 Switch yang tersambung ke **Lain** dengan nama **Switch 1**, **Switch 2**, dan **Switch 3**
4. Di **Switch 1**, sambungkan 2 Server Client (kami menggunakan Alpinet), beri nama dengan *change hostname* -> **Alisa** dan **Mika**
5. Di **Switch 2**, sambungkan 1 Server Client (kami menggunakan Alpinet), beri nama dengan *change hostname* -> **Chisa**
6. Di **Switch 3**, sambungkan 2 Server Client (kami menggunakan Alpinet), beri nama dengan *change hostname* -> **Knights** dan **Eiri**
7. Untuk menjadikan kelima server ini menjadi Client bagi **Lain**, *start configuration* Client menggunakan prefix IP K-47 `10.87.x.x`

#### Router
```
 
```

#### Client Alice
```
auto eth0
iface eth0 inet static
    address 10.87.1.2
    netmask 255.255.255.0
    gateway 10.87.1.1
```

#### Client Mika
```
auto eth0
iface eth0 inet static
    address 10.87.1.3
    netmask 255.255.255.0
    gateway 10.87.1.1
```

#### Client Chisa
```
auto eth0
iface eth0 inet static
    address 10.87.2.2
    netmask 255.255.255.0
    gateway 10.87.2.1
```

#### Client Knights
```
auto eth0
iface eth0 inet static
    address 10.87.3.2
    netmask 255.255.255.0
    gateway 10.87.3.1
```

#### Client Eiri
```
auto eth0
iface eth0 inet static
    address 10.87.3.3
    netmask 255.255.255.0
    gateway 10.87.3.1
```

### Soal 2
Untuk menyambungkan **Lain** ke internet,  


## Kendala
