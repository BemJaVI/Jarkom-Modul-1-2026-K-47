#!/bin/bash

# ==============================================================================
# 1. NODE CHISA (SETUP FTP SERVER)
# ==============================================================================

apk update
apk add vsftpd

mkdir -p /var/wired/data
chmod 777 /var/wired/data

adduser -D alice && echo "alice:12345" | chpasswd
adduser -D mika && echo "mika:12345" | chpasswd
adduser -D eiri && echo "eiri:12345" | chpasswd

cat << 'CONF' > /etc/vsftpd/vsftpd.conf
listen=YES
local_enable=YES
write_enable=YES
local_root=/var/wired/data
chroot_local_user=YES
allow_writeable_chroot=YES
userlist_enable=YES
userlist_deny=YES
userlist_file=/etc/vsftpd.user_list
userconfig_dir=/etc/vsftpd/user_conf
seccomp_sandbox=NO
CONF

echo "eiri" > /etc/vsftpd.user_list
mkdir -p /etc/vsftpd/user_conf
echo "write_enable=YES" > /etc/vsftpd/user_conf/alice
echo "write_enable=NO" > /etc/vsftpd/user_conf/mika
echo "cmds_allowed=USER,PASS,QUIT,PWD,PORT,PASV,TYPE,MODE,RETR,LIST,NLST,CWD" >> /etc/vsftpd/user_conf/mika

killall vsftpd 2>/dev/null
/usr/sbin/vsftpd /etc/vsftpd/vsftpd.conf &


# ==============================================================================
# 2. NODE CLIENT (UJI COBA ALICE: READ & WRITE)
# ==============================================================================

touch signal_alice.txt
ftp -n <IP_NODE_CHISA> <<EOF
user alice 12345
put signal_alice.txt
quit
EOF


# ==============================================================================
# 3. NODE CLIENT (UJI COBA EIRI: BLACKLIST / DITOLAK)
# ==============================================================================

ftp -n <IP_NODE_CHISA> <<EOF
user eiri 12345
quit
EOF
