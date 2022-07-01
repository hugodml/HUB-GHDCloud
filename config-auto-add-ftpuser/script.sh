#!/bin/bash
if [ -z "$1" ] | [ -z "$2" ]
then
	echo "Not enough args"
else
	echo "username: $1 password: $2" 
	sudo adduser "$1" --no-create-home --gecos "First Last, RoomNumber, WorkPhone, HomePhone" --disabled-password
	echo "$1":"$2" | sudo chpasswd
	sudo mkdir /home/"$1"
	sudo mkdir /home/"$1"/ftp
	sudo chown nobody:nogroup /home/"$1"/ftp
	sudo chmod a-w /home/"$1"/ftp
	sudo mkdir /home/"$1"/ftp/files
	sudo chown "$1":"$1" /home/"$1"/ftp/files
	echo "$1" | sudo tee -a /etc/vsftpd.userlist
fi
