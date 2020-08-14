#!/bin/bash

#!/bin/bash

# Program : setuplblprint.sh
# Version : 2
# Use : 
# Setup fresh image for Labelprinting
# How to run :
# bash setuplblprint.sh

# Author : Folkert van der Meulen
# Date   : 14/08/2020 
#
# This program is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program.  If not, see <http://www.gnu.org/licenses/>.


echo "make fresh image ready for labelprinting in 10 steps"
echo "run it only once to prefent double txt in files !"

echo "step 1 : update package list"
sudo apt-get update
#sudo apt-get -y upgrade

echo "step 2 : install packages"
sudo apt-get -y install libcups2-dev libcupsimage2-dev cups cups-client printer-driver-dymo lpr links2

echo "step 3 : add pi user to admin group"
sudo usermod -a -G lpadmin pi

echo "step 4 : you have to add labelprinter manually"

#echo "step 5 : Set printer for lp or lpr as default"
#echo "Default DYMO_LabelWriter_4XL" > /home/pi/.cups/lpoptions
#or
#echo "Default Zebra...." > /home/pi/.cups/lpoptions

echo "step 6 : labelprinter test is skipped"

echo "step 7 : just a few more steps !"

echo "step 8 : add ramdrive, install labelprinter script, add stuff to .bashrc"
mkdir /home/pi/in
echo "tmpfs /home/pi/in tmpfs nodev,nosuid,size=5M 0 0" | sudo tee -a /etc/fstab
curl https://raw.githubusercontent.com/FollyMaddy/webshop-tools/master/labelprinter.sh -o labelprinter.sh
#change printernumber to your needs
echo "sudo mount -a" >> /home/pi/.bashrc
echo "printer=1" >> /home/pi/.bashrc
echo "bash labelprinter.sh \$printer" >> /home/pi/.bashrc

echo "step 9 : the manual stuff, step 4 add printer"
links2 -force-html http://localhost:631/admin

echo "step 10 : the manual stuff, add variables"

echo "all should be done"