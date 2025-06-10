#!/bin/bash

echo "开始系统更新和清理..."

if [ -f /etc/debian_version ]; then
    echo "检测到 Debian/Ubuntu 系统"
    sudo apt update && sudo apt upgrade -y
    echo "开始清理无用包和缓存..."
    sudo apt autoremove -y
    sudo apt clean
elif [ -f /etc/redhat-release ]; then
    echo "检测到 CentOS/RHEL 系统"
    sudo yum update -y
    echo "开始清理无用包和缓存..."
    sudo yum autoremove -y
    sudo yum clean all
else
    echo "不支持的系统类型，退出。"
    exit 1
fi

echo "系统更新和清理完成！"
