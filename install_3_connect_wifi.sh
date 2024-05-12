#!/bin/bash

# Автозапуск NetworkManager
systemctl start NetworkManager.service
systemctl enable NetworkManager.service

# Подключаем wifi
nmcli device wifi list
nmcli device wifi connect Keenetic-8471 password Q2Wobiko

