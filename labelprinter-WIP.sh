#!/bin/bash

# Program : labelprinter.sh
# Version : 2
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
# Date   : 13/07/2020 
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
#website=https://www.
#key=

printernr=$1
workdir=$(pwd)/in
 
while :
do
        #check for new labelfiles
        filenames=`curl -s $website/newlabels$printernr.php`
        #split comma separate string to filenames in array
        IFS=',' read -r -a filenames_array <<< "$filenames"
        #download files to directory IN, after download file is removed from webserver
        for filename in "${filenames_array[@]}"
        do
                curl "$website/getlabel$printernr.php?key=$key&filename=$filename" -o "$workdir/$filename.pdf"
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

