#!/bin/bash
#
#******************************************************************************
#Author:               Sunny
#Email:                ghbsunny@sina.com
#Date:                 2017-10-30
#FileName:             notify.sh
#version:              1.0
#Your change info:     
#Description:          For notify someone by mail when vip floating
#Copyright(C):         2017  All rihts reserved
#*****************************************************************************
contact='root@localhost'
notify() {
	mailsubject="$(hostname) to be $1, vip2 172.18.50.90 floating"
	mailbody="$(date +'%F %T'): vrrp transition,vip2  172.18.50.90  floating, $(hostname) changed to be $1"
	echo "$mailbody" | mail -s "$mailsubject" $contact
	}	
case  $1  in
master)
	notify master
;;
backup)
	notify backup
;;
fault)
	notify fault
;;
*)
	echo "Usage: $(basename $0) {master|backup|fault}"
	exit 1
;;
esac

