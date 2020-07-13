# webshop-tools
Example and working scripts for orderpicking automation



# How to add Dymo labelprinter on RPI 1 to 4 on RPI-OS Lite(buster)

# websites used for this guide

- https://www.cups.org/doc/options.html

- http://www.tldp.org/HOWTO/Printing-HOWTO/index.html

- https://forums.centos.org/viewtopic.php?t=214

- https://argthtjtr.blogspot.com/2019/03/lp-vs-lpr-what-to-use-in-case-of-cups.html

- https://forum.manjaro.org/t/aur-en-trouble-with-dymo-cups-drivers/105440/5

- https://debian.pkgs.org/10/debian-main-armhf/printer-driver-dymo_1.4.0-8_armhf.deb.html


# Supported printers

CUPS filter driver for various DYMO label printers: LabelManager 400, 450, PC,

PC II and PnP; LabelPoint 350 and LabelWriter 300, 310, 315, 320, 330,

330 Turbo, 400, 400 Turbo, 450, 450 DUO Label, 450 DUO Tape, 450 Turbo,

450 Twin Turbo, 4XL, DUO Label, DUO Tape, DUO Tape 128, SE450 and Twin Turbo.

This package contains the CUPS filter driver and the compressed PPDs for the

supported label printers.


# step 1

Update your fresh img :

sudo apt-get update; sudo apt-get upgrade -y


# step 2

Install cups,Dymo-drive and links2 terminal-webbrowser :

Install cups libraries and other necessary libraries to build

sudo apt-get install libcups2-dev libcupsimage2-dev cups cups-client rinter-driver-dymo links2


# step 3

Add the pi user to the printer admin group to be allow to login to the printer admin :

sudo usermod -a -G lpadmin pi


# step 4

Go to the webpage of cups and add printer :

Connect your labelprinter to the USB-port!

links2 -force-html http://localhost:631/admin

- Add new printer

- login with your normal username and password

- Dymo should be installable


# step 5

Install lpr-package to send text or picture to the printer

More info over lpr : https://www.computerhope.com/unix/ulpr.htm

sudo apt-get install lpr

Related commands :

hostname — Set or print the hostname of system.

lp — Print a file on the System V operating system.

lpc — Control line printers.

lpq — List the status of available printers.

lprm — Remove requests from the print queue.

lpstat — List the status of the LP print services.

mail — Read, compose, and manage mail.


# step 6

Get printer name :

lpstat -p -d

Set printer for lp or lpr as default :

lpoptions -d DYMO_LabelWriter_4XL

(a text file called lpotions in /home/pi/.cups/ contains the default printer so you can also make a textfile with printername instead.)

Now you can check if default printer is set :

lpstat -p -d


# step 7

Test your setup and printer :

In my setup the "lpr command" did not work, but tests from cups and libreoffice did work.

The command "lp" can also be used, This command worked for me !

Print an empty label :

echo | lp

Create and print a text file :

echo hello world > hello-world.txt

lp hello-world.txt

# step 8 

Enjoy !

# more steps for our script

# step 9

Start a script at boot :

Edit boot options with (CLI with autologin):

(perhaps you also want to change your keyboard settings etc)

sudo raspi-config

Edit .bashrc with nano :

nano .bashrc



