#!/bin/bash
cd lnmp1.7/tools
sed -i 's#maxretry = 5#maxretry = 2#g' fail2ban.sh
sh fail2ban.sh
