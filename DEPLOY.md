# Инструкция по загрузке презентаций в GitHub Pages

## ⚠️ Важно: Отдельный публичный репозиторий

**Да, нужен отдельный публичный репозиторий для презентаций!**

Причины:
- GitHub Pages для приватных репозиториев работает только на платных планах
- Презентации должны быть публичными для удобного доступа
- Логично разделить: код проекта (приватный) и презентации (публичные)

## 🎯 Быстрая инструкция

1. **Создайте публичный репозиторий** `bridge_presentation` на GitHub
2. **Скопируйте файлы** из папки `presentation` в новую папку (или используйте текущую)
3. **Загрузите файлы** в новый репозиторий
4. **Включите GitHub Pages** в настройках репозитория
5. **Готово!** Презентации доступны по ссылке

## 📝 Шаг 1: Создайте публичный репозиторий (если ещё не создан)

1. Перейдите на https://github.com/new
2. Repository name: `bridge_presentation`
3. **Важно:** Выберите **Public** (публичный)
4. НЕ добавляйте README, .gitignore или лицензию (файлы уже есть)
5. Нажмите **Create repository**

## 🚀 Шаг 2: Загрузите файлы

### Вариант 1: Через командную строку (рекомендуется)

```bash
# 1. Перейдите в папку presentation
cd /Users/nv_masters/Documents/Программирование/Artur_Bro/Bridge_Kazakhstan/presentation

# 2. Инициализируйте git (если папка не связана с основным проектом)
git init

# 3. Добавьте удалённый репозиторий
git remote add origin https://github.com/richboy13/bridge_presentation.git

# 4. Добавьте все файлы
git add .

# 5. Создайте коммит
git commit -m "Добавлены все презентации Bridge"

# 6. Загрузите в GitHub
git branch -M main
git push -u origin main
```

**Если папка уже связана с основным проектом:**

**Вариант A: Создать отдельную копию (рекомендуется)**

```bash
# 1. Создайте временную копию папки presentation
cp -r /Users/nv_masters/Documents/Программирование/Artur_Bro/Bridge_Kazakhstan/presentation /tmp/presentation_for_github

# 2. Перейдите в копию
cd /tmp/presentation_for_github

# 3. Удалите .git (если есть), чтобы начать с чистого листа
rm -rf .git

# 4. Инициализируйте новый git
git init

# 5. Добавьте удалённый репозиторий
git remote add origin https://github.com/richboy13/bridge_presentation.git

# 6. Добавьте все файлы
git add .

# 7. Создайте коммит
git commit -m "Добавлены все презентации Bridge"

# 8. Загрузите в GitHub
git branch -M main
git push -u origin main
```

**Вариант B: Использовать git subtree (продвинутый)**

Если хотите синхронизировать изменения из основного проекта:

```bash
# Из корня основного проекта
cd /Users/nv_masters/Documents/Программирование/Artur_Bro/Bridge_Kazakhstan

# Добавьте subtree для презентаций
git subtree push --prefix=presentation origin-presentation main
```

### Вариант 2: Через GitHub Desktop

1. Откройте GitHub Desktop
2. File → Add Local Repository
3. Выберите папку `presentation`
4. Нажмите "Publish repository"
5. Выберите репозиторий `richboy13/bridge_presentation`

### Вариант 3: Через веб-интерфейс GitHub

1. Перейдите на https://github.com/richboy13/bridge_presentation
2. Нажмите "uploading an existing file"
3. Перетащите все файлы из папки `presentation`
4. Нажмите "Commit changes"

## ⚙️ Шаг 3: Проверьте, что репозиторий публичный

Если репозиторий уже создан:

1. Откройте https://github.com/richboy13/bridge_presentation
2. Перейдите в **Settings** → **General**
3. Прокрутите вниз до раздела **Danger Zone**
4. Если видите "Change repository visibility" → репозиторий приватный
5. Нажмите "Change visibility" → выберите **Make public**
6. Подтвердите изменение

## 🌐 Шаг 4: Настройка GitHub Pages

После загрузки файлов:

1. Откройте https://github.com/richboy13/bridge_presentation
2. Перейдите в **Settings** → **Pages**
3. В разделе **Source**:
   - Branch: выберите `main`
   - Folder: выберите `/ (root)`
4. Нажмите **Save**

Через 1-2 минуты ваши презентации будут доступны по адресу:
**https://richboy13.github.io/bridge_presentation/**

✅ **Готово!** Теперь все презентации доступны онлайн.

## Структура ссылок

После настройки GitHub Pages все файлы будут доступны:

- Главная: https://richboy13.github.io/bridge_presentation/hub.html
- Инвестор: https://richboy13.github.io/bridge_presentation/index.html
- Логистика: https://richboy13.github.io/bridge_presentation/logistics_partner.html
- БД: https://richboy13.github.io/bridge_presentation/database_structure.html
- План: https://richboy13.github.io/bridge_presentation/project_plan.html
- Roadmap: https://richboy13.github.io/bridge_presentation/roadmap.html

## Обновление файлов

Когда нужно обновить презентации:

```bash
cd /Users/nv_masters/Documents/Программирование/Artur_Bro/Bridge_Kazakhstan/presentation
git add .
git commit -m "Обновлены презентации"
git push
```

Изменения появятся на сайте через 1-2 минуты.

## Важно

- GitHub Pages работает только со статическими HTML/CSS/JS файлами
- Все файлы должны быть в корне репозитория или в указанной папке
- Максимальный размер репозитория для GitHub Pages: 1 GB
- Изменения публикуются автоматически после каждого push







