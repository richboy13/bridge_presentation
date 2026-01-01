#!/bin/bash

# Скрипт для загрузки презентаций в GitHub Pages
# Использование: ./deploy.sh

echo "🚀 Начинаю загрузку презентаций в GitHub Pages..."

# Цвета для вывода
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
RED='\033[0;31m'
NC='\033[0m' # No Color

# Проверка, что мы в правильной папке
if [ ! -f "hub.html" ]; then
    echo -e "${RED}❌ Ошибка: файл hub.html не найден${NC}"
    echo "Убедитесь, что вы находитесь в папке presentation"
    exit 1
fi

# Проверка наличия git
if ! command -v git &> /dev/null; then
    echo -e "${RED}❌ Git не установлен${NC}"
    exit 1
fi

# Проверка, инициализирован ли git
if [ ! -d ".git" ]; then
    echo -e "${YELLOW}⚠️  Git не инициализирован. Инициализирую...${NC}"
    git init
fi

# Проверка удалённого репозитория
if git remote | grep -q "origin"; then
    REMOTE_URL=$(git remote get-url origin)
    echo -e "${YELLOW}⚠️  Найден удалённый репозиторий: ${REMOTE_URL}${NC}"
    read -p "Использовать этот репозиторий? (y/n): " -n 1 -r
    echo
    if [[ ! $REPLY =~ ^[Yy]$ ]]; then
        echo "Удаляю текущий remote..."
        git remote remove origin
        read -p "Введите URL нового репозитория: " NEW_REMOTE
        git remote add origin "$NEW_REMOTE"
    fi
else
    echo -e "${YELLOW}⚠️  Удалённый репозиторий не найден${NC}"
    read -p "Введите URL репозитория (https://github.com/richboy13/bridge_presentation.git): " REMOTE_URL
    if [ -z "$REMOTE_URL" ]; then
        REMOTE_URL="https://github.com/richboy13/bridge_presentation.git"
    fi
    git remote add origin "$REMOTE_URL"
fi

# Добавление файлов
echo -e "${GREEN}📦 Добавляю файлы...${NC}"
git add .

# Проверка изменений
if git diff --staged --quiet; then
    echo -e "${YELLOW}⚠️  Нет изменений для коммита${NC}"
else
    # Создание коммита
    echo -e "${GREEN}💾 Создаю коммит...${NC}"
    git commit -m "Обновлены презентации Bridge - $(date '+%Y-%m-%d %H:%M:%S')"
    
    # Установка ветки main
    git branch -M main
    
    # Загрузка в GitHub
    echo -e "${GREEN}⬆️  Загружаю в GitHub...${NC}"
    git push -u origin main
    
    if [ $? -eq 0 ]; then
        echo -e "${GREEN}✅ Успешно загружено!${NC}"
        echo ""
        echo "Следующие шаги:"
        echo "1. Откройте https://github.com/richboy13/bridge_presentation"
        echo "2. Settings → Pages"
        echo "3. Source: Branch 'main', Folder '/ (root)'"
        echo "4. Save"
        echo ""
        echo "Через 1-2 минуты презентации будут доступны:"
        echo "https://richboy13.github.io/bridge_presentation/"
    else
        echo -e "${RED}❌ Ошибка при загрузке${NC}"
        exit 1
    fi
fi

echo -e "${GREEN}✨ Готово!${NC}"





