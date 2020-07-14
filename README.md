# webshop-tools

Example and working scripts for orderpicking automation :

bestand-meulen.sh (checks in directory, prints file from in directory, put's file to out directory

lapelprinter.sh (only usable for my private use, but can be used as an example script)


# How to add Dymo labelprinter on RPI 1 to 4 on RPI-OS Lite(buster)

# Sources used for this guide (year 2020)

- When cups is installed, go to http://localhost:631/help/

- https://www.hmazter.com/2013/05/raspberry-pi-printer-server-for-labelwriter/

- https://www.cups.org/doc/options.html

- http://www.tldp.org/HOWTO/Printing-HOWTO/index.html

- https://forums.centos.org/viewtopic.php?t=214

- https://argthtjtr.blogspot.com/2019/03/lp-vs-lpr-what-to-use-in-case-of-cups.html

- https://forum.manjaro.org/t/aur-en-trouble-with-dymo-cups-drivers/105440/5

- https://debian.pkgs.org/10/debian-main-armhf/printer-driver-dymo_1.4.0-8_armhf.deb.html


  Possible future work : Is it possible to connect Zebra labelprinter instead of Dymo ? :
  
  - https://www.raspberrypi.org/forums/viewtopic.php?p=724444
  
  - https://pypi.org/project/zebra/0.0.5/#description


# Supported printers for printer-driver-dymo :

CUPS filter driver for various DYMO label printers: LabelManager 400, 450, PC,

PC II and PnP; LabelPoint 350 and LabelWriter 300, 310, 315, 320, 330,

330 Turbo, 400, 400 Turbo, 450, 450 DUO Label, 450 DUO Tape, 450 Turbo,

450 Twin Turbo, 4XL, DUO Label, DUO Tape, DUO Tape 128, SE450 and Twin Turbo.

This package contains the CUPS filter driver and the compressed PPDs for the

supported label printers.


# Related commands for lpr-package :

hostname — Set or print the hostname of system.

lp — Print a file on the System V operating system.

lpc — Control line printers.

lpq — List the status of available printers.

lprm — Remove requests from the print queue.

lpstat — List the status of the LP print services.

mail — Read, compose, and manage mail.


# step 1

Update your fresh img :

sudo apt-get update; sudo apt-get upgrade -y


# step 2

Install cups-printer-server-software, dymo-driver, lpr-commandline-package and links2 terminal-webbrowser :

sudo apt-get install libcups2-dev libcupsimage2-dev cups cups-client printer-driver-dymo lpr links2


# step 3

Add the pi user to the printer admin group to be allow to login to the printer admin :

sudo usermod -a -G lpadmin pi


# step 4

Add printer :

Connect your labelprinter to the USB-port !

Go to the webpage of cups (with a graphic OS you can use a normal webbrowser) :

links2 -force-html http://localhost:631/admin

- Add new printer 

- login with your normal username and password

- Dymo should be installable in about 4 steps

  (use enter to select and see an X)
  
  * select printer then continue
  
  * select driver then continue
  
  * set default settings then continue
  
  * see your added printer in ""Manage Printers"


# step 5

Get printer name :

lpstat -p -d

Set printer for lp or lpr as default :

lpoptions -d DYMO_LabelWriter_4XL

(a text file called lpotions in /home/pi/.cups/ contains the default printer so you can also make a textfile with printername instead.)

Now you can check if default printer is set :

lpstat -p -d


# step 6

Test your setup and printer :

In my setup the "lpr command" did not work, but tests from cups and libreoffice did work.

The command "lp" can also be used, This command worked for me !

Print an empty label :

echo | lp

Create and print a text file :

echo hello world > hello-world.txt

lp hello-world.txt


# step 7

Enjoy !


# more steps for my script

# step 8

Edit boot options with (CLI with autologin):

(perhaps you also want to change your keyboard settings etc)

sudo raspi-config


Edit .bashrc with nano to add your script for startup at boot :

nano .bashrc
 
add stuff at the bottum of t.bashrc :
 
 printer = 1 # printer number variable
 
 bash labelprinter/labelprinter.sh $printer


Add the variables $website and $key in the labelprinter.sh script:

nano labelprinter/labelprinter.sh

We could also put all variable in the .bashrc and read them as "option variables" in the script like we do with $printer



# For possible future work, not recommended to use at this stage !

Variables earlier added in a first script are, without any good solution, not readable in a second script.

We could use something like this :

source labelprinter/labelprinter.sh

or (equivalent)

. labelprinter/labelprinter.sh

This reads and executes the script in the environment of the current shell (or in this case, a script)




