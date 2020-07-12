#!/bin/bash

# Program : bestand-meulen.sh
# Version : 1
# Use : 
# example script on how to print a pdf file with lpr when file is dragged into "in" directory
# After file is printed it is being moved to "uit" directory
# How to run :
# Make the program executable, dubbleclick and choose open in terminal.
# Or run it from the terminal with : ./bestand-meulen.sh
# Author : Folkert van der Meulen
# Date   : 29/10/2019 
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


workdir=$HOME/Documents/pdf
donedir=$HOME/Documents/done/pdf
while :
do
    sleep 1    
    #if pdf in directory then print output
    listpdf=$(ls $workdir)
    if [ -n "$listpdf" ]
    then
        #wait for files that are still being copied
        sleep 1
        echo $listpdf
        for files in $listpdf
        do
            lp $files
            mv $workdir/$files $donedir
        done    
    fi
done

