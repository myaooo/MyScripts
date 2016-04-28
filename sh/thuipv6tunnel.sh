#!/bin/bash
#
# thuipv6tunnel.sh
# Created at: 2016-04-26
#

# 清除IPV6路由表
sudo route delete -inet6 default
sudo ifconfig gif0 destroy
# 运行ifconfig获取ip
EN0_IP=`ifconfig en0 | grep inet | grep -v inet6 | awk '{print $2}'` 
EN1_IP=`ifconfig en1 | grep inet | grep -v inet6 | awk '{print $2}'`  
if [ -n "$EN0_IP" ]; then 
    LOCAL_IP=$EN0_IP 
else 
    LOCAL_IP=$EN1_IP 
fi  
# 开启gif
if [ -n "$LOCAL_IP" ]; then 
    sudo ifconfig gif0 create
    sudo ifconfig gif0 tunnel $LOCAL_IP 166.111.21.1
    sudo ipconfig set gif0 MANUAL-V6 2402:f000:1:1501:200:5efe:$LOCAL_IP 64
    sudo route add -inet6 ::/0 -interface gif0
    if [ $? -eq 0 ]; then
        echo -e "\nIPV6 enabled."
        echo -e "To disable IPV6, use the following command:\n"
        echo -e "sudo ifconfig gif0 destroy\n"
        echo "Enjoy!"
    else
        echo "Unexpected Bug."
    fi
else
    echo "No available local IP."
fi