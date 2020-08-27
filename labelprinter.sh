#!/bin/bash

# Program : labelprinter.sh
# Version : 1
# Use : 
# Labelprinter script to print packagelabels with barcode for orderpicking
# How to run :
# bash labelprinter.sh
# or make the program executable :
# - dubbleclick and choose open in terminal
# or
# - run it from the terminal with : ./labelprinter.sh
#
# Author : Folkert van der Meulen
# Date   : 13/06/2020 
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

#add these variables to your needs !
#or put them in the .bashrc if you make the script start at boot !

#---
#!!!seems that strings can not be used, tested in Version 2 (WIP) !!!
#for now, fill in the websitename and key in lines 50 and 56 !
#if no Raspberry Pi is used, make sure u make the "in" directory
#if no Raspberry Pi is used, use "lpr" instead of "lp" in line 70
#---

#add ramdrive on Raspberry Pi 
#checks if it finds an arm cpu, if so, only then it mounts the ramdrive
if [[ $(arch) == arm* ]]; then sudo mount -a; fi

printernr=$1
workdir=$(pwd)/in
 
while :
do
        #check for new labelfiles
        filenames=`curl -s https://www.----------.nl/magazijn/newlabels$printernr.php`
        #split comma separate string to filenames in array
        IFS=',' read -r -a filenames_array <<< "$filenames"
        #download files to directory IN, after download file is removed from webserver
        for filename in "${filenames_array[@]}"
        do
                curl "https://www.----------.nl/magazijn/getlabel$printernr.php?key=--------------------------------&filename=$filename" -o "$workdir/$filename.pdf"
        done
 
        #start checking for files in IN directory, print files and delete file
	sleep 1    
    	#if file in directory then print output
    	listpdf=$(ls $workdir)
    	if [ -n "$listpdf" ]
    	then
        #wait for files that are still being copied
        sleep 1
        echo $listpdf
        for files in $listpdf
        do
            lp $workdir/$files
            rm $workdir/$files
        done    
    fi
done

