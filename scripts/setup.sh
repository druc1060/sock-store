#!/bin/bash

# Установка Docker
sudo apt-get update
sudo apt-get install -y docker.io docker-compose

# Запуск Docker
sudo systemctl start docker
sudo systemctl enable docker
