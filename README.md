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


7)

Set printer for lp or lpr as default or get printer name :

Test met HP laserjet p2015 :

lpr werkte steeds niet terwijl een test uit cups en libreoffice wel werkte daarom doorgezocht.

Hier zag ik hoe ik de printer kan toevoegen in de commandline of hoe ik de printer default kan maken :

https://www.cups.org/doc/options.html

pi@raspberrypi:~ $ lpstat -p -d

printer HP_LaserJet_P2015_Series is idle.  enabled since za 11 jul 2020 21:38:25 CEST

no system default destination

pi@raspberrypi:~ $ lpoptions -d HP_LaserJet_P2015_Series

copies=1 device-uri=usb://HP/LaserJet%20P2015%20Series?serial=00CNBW7CX7D3 finishings=3 job-cancel-after=10800 job-hold-until=no-hold job-priority=50 job-sheets=none,none marker-change-time=0 number-up=1 printer-commands=none printer-info='HP LaserJet P2015 Series' printer-is-accepting-jobs=true printer-is-shared=false printer-is-temporary=false printer-location=Kantoor22 printer-make-and-model='HP LaserJet p2015 Series pcl3, hpcups 3.18.12' printer-state=3 printer-state-change-time=1594496305 printer-state-reasons=none printer-type=2134044 printer-uri-supported=ipp://localhost/printers/HP_LaserJet_P2015_Series

pi@raspberrypi:~ $ lpstat -p -d

printer HP_LaserJet_P2015_Series is idle.  enabled since za 11 jul 2020 21:38:25 CEST

system default destination: HP_LaserJet_P2015_Series

Oplossing :

lp werkt :)

!!!! lpr werkt niet !!!!

pi@raspberrypi:~ $ lpr scan2label.php

pi@raspberrypi:~ $ lpr -P HP_LaserJet_P2015_Series scan2label.php

lpr: HP_LaserJet_P2015_Series: unknown printer

pi@raspberrypi:~ $ lp scan2label.php

request id is HP_LaserJet_P2015_Series-5 (1 file(s))


