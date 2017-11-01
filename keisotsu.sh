#!/bin/sh

OPERATION=$1
KEISOTSU_DIR=~/.keisotsu_bash
UBUNTU_BASH=ubuntu/bashrc
DEBIAN_BASH=debian/bashrc
KEISOTSU=bash_keisotsu
MY_KEISOTSU=~/.bash_keisotsu
TIME=`date '+%Y%m%d-%H%M%S'`

usage () {
	echo "usage: $0 operation"
	echo "Please input as follows."
	echo "$./keisotsu.sh ubuntu\n\tor\n$./keisotsu.sh debian"
	exit 1
}

if [ -z $OPERATION ]
then
	usage;
fi

if [ "${OPERATION}" = "ubuntu" ]; then
	if [ -e ${KEISOTSU_DIR} ]; then
		echo "${KEISOTSU_DIR} found."
	else
		echo "mkdir ${KEISOTSU_DIR}"
		mkdir ${KEISOTSU_DIR}
	fi

	if [ -e ${MY_KEISOTSU} ]; then
		echo "cp ~/.bashrc ${KEISOTSU_DIR}/${TIME}_bashrc"
		cp ~/.bashrc ${KEISOTSU_DIR}/${TIME}_bashrc
	else
		echo "cp ~/.bashrc ${KEISOTSU_DIR}/your_default_bashrc"
		cp ~/.bashrc ${KEISOTSU_DIR}/your_default_bashrc
	fi

	echo "cp ${UBUNTU_BASH} ~/.bashrc"
	cp ${UBUNTU_BASH} ~/.bashrc
	echo "cp  ubuntu/${KEISOTSU} ~/.bash_keisotsu"
	cp ubuntu/${KEISOTSU} ~/.bash_keisotsu
	echo "cp ubuntu/bash_noisy ~/.bash_noisy"
	cp ubuntu/bash_noisy ~/.bash_noisy
	echo "cp ubuntu/bash_sh ~/.bash_ssh"
	cp ubuntu/bash_ssh ~/.bash_ssh

	. ~/.bashrc

elif [ "${OPERATION}" = "debian" ]; then
	if [ -e ${KEISOTSU_DIR} ]; then
		echo "${KEISOTSU_DIR} found."
	else
		echo "mkdir ${KEISOTSU_DIR}"
		mkdir ${KEISOTSU_DIR}
	fi

	if [ -e ${MY_KEISOTSU} ]; then
		echo "cp ~/.bashrc ${KEISOTSU_DIR}/${TIME}_bashrc"
		cp ~/.bashrc ${KEISOTSU_DIR}/${TIME}_bashrc
	else
		echo "cp ~/.bashrc ${KEISOTSU_DIR}/your_default_bashrc"
		cp ~/.bashrc ${KEISOTSU_DIR}/your_default_bashrc
	fi

	echo "cp ${DEBIAN_BASH} ~/.bashrc"
	cp ${DEBIAN_BASH} ~/.bashrc
	echo "cp debian/${KEISOTSU} ~/.bash_keisotsu"
	cp debian/${KEISOTSU} ~/.bash_keisotsu
	echo "cp debian/bash_noisy ~/.bash_noisy"
	cp debian/bash_noisy ~/.bash_noisy
	echo "cp debian/bash_sh ~/.bash_ssh"
	cp debian/bash_ssh ~/.bash_ssh

	. ~/.bashrc

else
	echo 'This operation does not correspond yet.'
	exit 1

fi


