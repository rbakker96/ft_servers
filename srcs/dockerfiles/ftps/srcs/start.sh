# set variables at runtime
echo "pasv_address=${PASV_ADDRESS}" >> /etc/vsftpd/vsftpd.conf
echo "pasv_max_port=${PASV_MAX_PORT}" >> /etc/vsftpd/vsftpd.conf
echo "pasv_min_port=${PASV_MIN_PORT}" >> /etc/vsftpd/vsftpd.conf

# Create home dir and update vsftpd user db:
mkdir -p "/home/vsftpd/${FTP_USER}"
adduser -h /home/vsftpd/${FTP_USER} -D ${FTP_USER}
echo ${FTP_USER}:${FTP_PASS} | chpasswd

/usr/sbin/vsftpd /etc/vsftpd/vsftpd.conf
