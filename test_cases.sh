#!/bin/bash

echo -e " 
 ____   ___  _     ___    ____ _               _            
/ ___| / _ \| |   |_ _|  / ___| |__   ___  ___| | __        
\___ \| | | | |    | |  | |   | '_ \ / _ \/ __| |/ /        
 ___) | |_| | |___ | |  | |___| | | |  __/ (__|   < _ _ _ _ 
|____/ \__\_\_____|___|  \____|_| |_|\___|\___|_|\_(_|_|_|_)

 "

echo "[+]Checking login page if vulnerable to sqli"
sqlmap -r login.req --batch --random-agent
echo "[+]Checking Ragister page if vulnerable to sqli"
sqlmap -r register.req --batch --random-agent

echo -e "
 ____ _____    ____ _               _            
|  _ \_   _|  / ___| |__   ___  ___| | __        
| | | || |   | |   | '_ \ / _ \/ __| |/ /        
| |_| || |   | |___| | | |  __/ (__|   < _ _ _ _ 
|____/ |_|    \____|_| |_|\___|\___|_|\_(_|_|_|_)

  "

ffuf -w ./directory_list -u https://speak2me.ml/FUZZ -mc 200
ffuf -w ./directory_list -u https://speak2me.ml/login/FUZZ -mc 200
ffuf -w ./directory_list -u https://speak2me.ml/register/FUZZ -mc 200
ffuf -w ./directory_list -u https://speak2me.ml/price/FUZZ -mc 200
ffuf -w ./directory_list -u https://speak2me.ml/what-we-do/FUZZ -mc 200
ffuf -w ./directory_list -u https://speak2me.ml/about/FUZZ -mc 200
ffuf -w ./directory_list -u https://speak2me.ml/faq/FUZZ -mc 200

python3 /home/lowerx/Desktop/SADProject/PwnXSS/pwnxss.py -u https://speak2me.ml/
