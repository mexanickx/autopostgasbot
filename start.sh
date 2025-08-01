#!/bin/bash

# Проверяем наличие .env файла
if [ ! -f ".env" ]; then
  echo "❌ Ошибка: файл .env не найден!"
  echo "Создайте файл .env с переменной TELEGRAM_BOT_TOKEN"
  exit 1
fi

# Проверяем установлен ли Python
if ! command -v python3 &> /dev/null; then
  echo "❌ Ошибка: Python3 не установлен!"
  exit 1
fi

# Проверяем зависимости
if [ ! -f "requirements.txt" ]; then
  echo "❌ Ошибка: файл requirements.txt не найден!"
  exit 1
fi

# Проверяем наличие основного файла
if [ ! -f "main.py" ]; then
  echo "❌ Ошибка: основной файл main.py не найден!"
  exit 1
fi

echo "🐍 Устанавливаем зависимости..."
python3 -m pip install -r requirements.txt

echo "🤖 Запускаем Telegram бота..."
python3 main.py
