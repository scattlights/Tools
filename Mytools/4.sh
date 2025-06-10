#!/bin/bash
clear
echo "UFW开放指定端口"
echo

echo "当前已开放的端口"
sudo ufw status
while true; do
    read -rp "请输入需要开放的端口，已开放的端口无需再次输入（用英文逗号分隔，例如 22,80,443）： " ports
    if [[ $ports =~ ^[0-9]+(,[0-9]+)*$ ]]; then
        break
    else
        echo "输入格式错误，请使用英文逗号分隔端口"
    fi
done

for port in $(echo "$ports" | tr ',' ' '); do
    sudo ufw allow "$port"
done

sudo ufw status

