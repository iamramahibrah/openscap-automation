#! /bin/bash

function scan {
	clear
	echo -e "checking Oscap ...."
	sleep 2s
	if ! which oscap > /dev/null; then
		echo -e "
[+] OPENSCAP ---- [X]
installing ..."
wget https://security-metadata.canonical.com/oval/com.ubuntu.$(lsb_release -cs).usn.oval.xml.bz2
bunzip2 com.ubuntu.$(lsb_release -cs).usn.oval.xml.bz2
	else
		echo -e "
[+] OPENSCAP ---- [✔]
[==] Scanning ` lsb_release -s -d` "
cd
sudo rm report.html
sudo oscap oval eval --report report.html com.ubuntu.$(lsb_release -cs).usn.oval.xml

	fi
}

scan