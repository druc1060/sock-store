#!/bin/bash

# Проверка наличия Docker Compose
if ! command -v docker-compose &> /dev/null; then
    echo "Docker Compose не установлен. Установите его и повторите попытку."
    exit 1
fi

# Запуск Docker Compose
if docker-compose up -d; then
    echo "Docker Compose успешно запущен."
