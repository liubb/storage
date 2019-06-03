# Version: V1.0
# Author: liubinbin
# Created Time : 2019-5-31 17:21:00
# Environment: Red Hat Enterprise Linux Server release 7.5 (Maipo)
#
#
# DESC: this script display the fibrechannel disk information
#  devname,size,lunid, path

disklist=`multipath -l -v 1`
ip=`ifconfig bond1 | grep netmask | awk '{print $2}'`
echo>/tmp/"$ip"-disk.info
for disk  in $disklist
do
	size=`multipath -ll $disk | grep size | awk '{print $1}' | awk -F"=" '{print $2}'`
	lunid=`multipath -ll $disk | grep HITACHI |awk '{print $2}' | cut -c 31-34`
	
	pathlist=`multipath -ll $disk | grep running | awk '{print $3}'`
	echo "$disk,$size,$lunid" >> /tmp/"$ip"-disk.info
	
	for path in $pathlist
	do
	  wwninfo=`ls -l /dev/disk/by-path/ | grep $path$ | awk '{print $9}' | cut -d - -f 4`
	  echo "--/dev/$path,$wwninfo" >> /tmp/"$ip"-disk.info
	done;	

done;
