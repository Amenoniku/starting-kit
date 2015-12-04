# VolWeb Starting Kit
**Набор для старта проектов.**

## Старт проекта

* Установка `gulp` глобально:

npm i -g gulp

* Установка зависимости:

npm i

* Запуск Проекта:

npm start

* Запуск Gulp.js:

gulp

* Открыть в браузере [`http://localhost:9000/`](http://localhost:9000/).

* Запуск проекта и gulp одновременно:

npm run dev

* Установка утилиты `nodemon` глобально для отслеживания изменений:

npm i -g nodemon

* Запуск проекта с отслеживанием изменений в папке `core` перезапуск проекта:

npm run mon

## Команды для запуска с Gulp.js

* Запуск Gulp с отслеживанием изменений:

gulp

* Сборка брать клиентскую часть (без вотчера):

gulp build

* Локальный сервер на другом порте:

gulp --port=Другой порт

* Открыть ссылку в браузерe:

gulp --open

* Собрать архив всего проекта:

gulp zip

## Структура папок и файлов

/
├── content/                    # Клиентская часть \n
│   ├── images/                 # Графика \n
│   │   ├── icons/              # SVG иконки для генерации векторного спрайта \n
│   │   └── sprite/             # PNG иконки для генерации растрового спрайта
│   ├── resources/              # Статические файлы
│   ├── scripts/                # Скрипты
│   │   └── app.js              # Главный скрипт
│   ├── styles/                 # Стили
│   │    ├── base/              # Базовые стили
│   │    │   ├── base.styl      # Базовый стилевой файл
│   │    │   ├── fonts.styl     # Подключение шрифтов
│   │    │   └── optimize.styl  # Сброс стилей и фиксы
│   │    ├── helpers/           # Помощники
│   │    │   ├── mixins.styl    # Примеси
│   │    │   ├── sprite.styl    # Переменные с данными PNG спрайта (автогенерация)
│   │    │   ├── svg.styl       # Переменные с данными SVG иконок (автогенерация)
│   │    │   └── variables.styl # Переменные
│   │    └── app.styl           # Главный стилевой файл
│   └── views/                  # Страницы
│        └── page/              # Страница
│          ├── layout           # Стандартная разметка
│          ├── index.jade       # Разметка страницы
│          ├── page.js          # Скрипт страницы
│          └── page.styl        # Стили страницы
├── core/                       # Серверная часть
├── gulp/                       # Подключаемые скрипты для gulpfile.coffee
│   ├── tasks/                  # Скрипты с задачами для Gulp.js
│   ├── utils/                  # Утилиты в помощь к задачам
│   └── paths.coffee            # Список путей для генерации файлов
├── .gitignore                  # Список исключённых файлов из Git
├── gulpfile.coffee             # Файл для запуска Gulp.js
├── package.json                # Список модулей и прочей информации
└── README.md                   # Документация
