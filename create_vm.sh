## Script used to create a Ubuntu 10.04 vm
## Date: 2011.08.18
## Author: Luis Saffie <luis@saffie.ca>
##

HOSTNAME="ehinventory.ehealthinnovation.org"
IP="192.75.165.55"

## Creates Ubuntu 10.04 VM
xen-create-image --hostname=$HOSTNAME --ip=$IP --role pygrub 

echo "swap disks in /etc/xen/$HOSTNAME.cfg"
vi /etc/xen/$HOSTNAME.cfg

xm create /etc/xen/$HOSTNAME.cfg
sleep 10

scp -o UserKnownHostsFile=/dev/null -o StrictHostKeyChecking=no bootstrap.sh root@$IP:
ssh -o UserKnownHostsFile=/dev/null -o StrictHostKeyChecking=no root@$IP exec /root/bootstrap.sh

## Creates Debian vm
#xen-create-image --hostname=$HOSTNAME --ip=$IP --role udev
