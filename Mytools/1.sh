#!/bin/bash
clear
echo "修改 SSH 登录端口 "
echo

read -rp "确定要继续吗？(y/n): " confirm
if [[ "$confirm" != "y" ]]; then
    exit 0
fi

while true; do
  read -r -p "请输入新的 SSH 登录端口号（1024-65535）： " port
  if [[ "$port" =~ ^[0-9]+$ ]] && [ "$port" -ge 1024 ] && [ "$port" -le 65535 ]; then
    break
  else
    echo "端口号无效，请输入 1024 到 65535 之间的数字。"
  fi
done

echo
NEW_PORT=$port

# 修改配置文件
if sudo grep -q "^Port" /etc/ssh/sshd_config; then
  sudo sed -i "s/^Port .*/Port $NEW_PORT/" /etc/ssh/sshd_config
else
  echo "Port $NEW_PORT" | sudo tee -a /etc/ssh/sshd_config > /dev/null
fi

echo "修改成功！！！"

# 重启服务
if sudo systemctl restart sshd; then
  echo "SSH 服务已重启，新端口为 $NEW_PORT"
else
  echo "SSH 服务重启失败，请检查配置！"
fi
