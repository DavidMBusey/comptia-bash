#!/bin/bash

####
# Portmap 
####

declare -A PORTMAP
PORTMAP[21]="FTP (TCP/UDP)"
PORTMAP[22]="SSH, SCP, SFTP (TCP/UDP)"
PORTMAP[23]="Telnet (TCP/UDP)"
PORTMAP[25]="SMTP (TCP)"
PORTMAP[53]="DNS (TCP/UDP)"
PORTMAP[69]="TFTP (UDP)"
PORTMAP[80]="HTTP (TCP)"
PORTMAP[88]="Kerberos (TCP/UDP)"
PORTMAP[110]="POP3 (TCP)"
PORTMAP[119]="NNTP (TCP)"
PORTMAP[135]="RPC/DCOM-scm (TCP/UDP)"
PORTMAP[137]="NetBIOS [7]"
PORTMAP[138]="NetBIOS [8]"
PORTMAP[139]="NetBIOS [9]"
PORTMAP[143]="IMAP (TCP)"
PORTMAP[161]="SNMP (TCP/UDP)"
PORTMAP[162]="SNMPTRAP (TCP/UDP)"
PORTMAP[389]="LDAP (TCP/UDP)"
PORTMAP[443]="HTTPS (TCP)"
PORTMAP[445]="SMB (TCP)"
PORTMAP[465]="SMTP with SSL/TLS (TCP) [5]"
PORTMAP[587]="SMTP with SSL/TLS (TCP) [7]"
PORTMAP[514]="Syslog (UDP)"
PORTMAP[636]="LDAP with SSL/TLS"
PORTMAP[860]="iSCSI (TCP)" # Used for linking data storage facilities over IP
PORTMAP[989]="FTPS [9] (TCP)"
PORTMAP[990]="FTPS [0] (TCP)"
PORTMAP[993]="IMAP4 with SSL/TLS (TCP)"
PORTMAP[995]="POP3 with SSL/TLS (TCP)"
PORTMAP[1433]="Ms-Sql-Server (TCP)"
PORTMAP[1645]="RADIUS - alternative port [45](UDP)"
PORTMAP[1646]="RAIDUS - alternative port [46] (UDP)"
PORTMAP[1701]="L2TP (UDP)"
PORTMAP[1723]="PPTP (TCP/UDP)"
PORTMAP[1812]="RADIUS - default [12] (UDP)"
PORTMAP[1813]="RADIUS - default [13] (UDP)"
PORTMAP[3225]="FCIP (TCP/UDP)"
PORTMAP[3260]="iSCSI Target [listening port] (TCP)"
PORTMAP[3389]="RDP (TCP/UDP)"
PORTMAP[3868]="Diameter (TCP)"
PORTMAP[6514]="Syslog with TLS (TCP)"

echo Type q or :q to exit

while :
do
	echo
	#random=shuf -i 0-${#PORTMAP[@]} -n1 > /dev/null 2>&1
	random=$(( $RANDOM % ${#PORTMAP[@]} + 1))
	start=0
	for port in "${!PORTMAP[@]}"; do
		start="$((start + 1))"
		#echo $random $start
		if [[ $random != $start ]]; then 
			continue
		fi
		echo What port is the following?
		echo ${PORTMAP[$port]}
		read port_guess
		
		if [[ $port_guess == "q" ||  $port_guess == ":q" ]]; then
			exit
		fi
		if [[ $port_guess == $port ]]; then
			echo -e "\e[1;32m Congratulations, that is correct! \e[0m"
		else
			echo -e "\e[1;31m That is incorrect. The port is: $port \e[0m"
			echo "Please type the correct port for ${PORTMAP[$port]}: "
			userAnswer=''
			while [[ $userAnswer != $port ]];
			do
				read userAnswer
			done

		fi
		sleep 0.75
		break
	done
done
