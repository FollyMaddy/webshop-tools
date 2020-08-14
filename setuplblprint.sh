#!/bin/bash

echo "make fresh image ready for labelprinting in 10 steps"
echo "run it only once to prefent double txt in files !"

echo "step 1 : update image"
sudo apt-get update
#sudo apt-get upgrade -y

echo "step 2 : install packages"
sudo apt-get install libcups2-dev libcupsimage2-dev cups cups-client printer-driver-dymo lpr links2

echo "step 3 : add pi user to admin group"
sudo usermod -a -G lpadmin pi

echo "step 4 : you have to add labelprinter manually"

echo "step 5 : Set printer for lp or lpr as default"
echo "Default DYMO_LabelWriter_4XL" > /home/pi/.cups/lpoptions
#or
#echo "Default Zebra...." > /home/pi/.cups/lpoptions

echo "step 6 : labelprinter test is skipped"

echo "step 7 : just a few more steps !"

echo "step 8 : add ramdrive, install labelprinter script, add stuff to .bashrc"
mkdir /home/pi/in
echo "tmpfs /home/pi/in tmpfs nodev,nosuid,size=5M 0 0" | sudo tee -a /etc/fstab
curl https://raw.githubusercontent.com/FollyMaddy/webshop-tools/master/labelprinter.sh /home/pi/labelprinter.sh
#change printernumber to your needs
echo "mount -a" >> /home/pi/.bashrc
echo "printer = 3" >> /home/pi/.bashrc
echo "bash labelprinter.sh \$printer" >> /home/pi/.bashrc

echo "step 9 : the manual stuff, step 4 add printer"
links2 -force-html http://localhost:631/admin

echo "step 10 : the manual stuff, add variables"

echo "all should be done"
