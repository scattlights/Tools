#!bin/bash
clear
echo "安装UFW并启用"

read -rp "确定要继续吗？(y/n): " confirm
if [[ "$confirm" != "y" ]]; then
    exit 0
fi

# 更新软件包列表
sudo apt update

# 安装 ufw
sudo apt install -y ufw

# 启用 ufw
sudo ufw enable

# 查看状态，确认启用成功
sudo ufw status verbose

