#!/bin/bash
clear
echo "查看或添加需要开放的UFW端口"
echo

read -rp "确定要继续吗？(y/n): " confirm
if [[ "$confirm" != "y" ]]; then
    exit 0
fi

echo "当前已开放的端口"
sudo ufw status

while true; do
    read -rp "请输入需要开放的端口（用英文逗号分隔，例如 22,80,443），已开放的端口无需再次输入，回车退出： " ports

    if [[ -z "$ports" ]]; then
        exit 0
    fi
    
    if [[ $ports =~ ^[0-9]+(,[0-9]+)*$ ]]; then
        break
    else
        echo "输入格式错误，请使用英文逗号分隔端口"
    fi
done

for port in $(echo $ports | tr ',' ' '); do
	sudo ufw allow $port
done

sudo ufw status

