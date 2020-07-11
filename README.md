# webshop-tools
Example and working scripts for orderpicking automation

1)

Install dymo on RPI :

Install cups libraries and other necessary libraries to build

sudo apt-get install libcups2-dev libcupsimage2-dev g++ cups cups-client

2)
Install dymo cups driver (more info on https://debian.pkgs.org/10/debian-main-armhf/printer-driver-dymo_1.4.0-8_armhf.deb.html ):

sudo apt-get install printer-driver-dymo

Supported printers :

CUPS filter driver for various DYMO label printers: LabelManager 400, 450, PC,

PC II and PnP; LabelPoint 350 and LabelWriter 300, 310, 315, 320, 330,

330 Turbo, 400, 400 Turbo, 450, 450 DUO Label, 450 DUO Tape, 450 Turbo,

450 Twin Turbo, 4XL, DUO Label, DUO Tape, DUO Tape 128, SE450 and Twin Turbo.

This package contains the CUPS filter driver and the compressed PPDs for the

supported label printers.

3)

Install terminal webbrowser for "only terminal OS" also usable in graphic OS :

sudo apt-get install links2

4)

Add the pi user to the printer admin group to be allow to login to the printer admin :

sudo usermod -a -G lpadmin pi

5)

Go to the webpage of cups and add printer :

Connect your labelprinter to the USB-port!

links2 -force-html http://localhost:631/admin

-Add new printer

-login with your normal username and password

-Dymo should be installable

6)

Install lpr to send text or picture to the printer

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


