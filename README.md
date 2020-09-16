# mysql
MySQL Repository for training

## Homework 1
 - В рамках первого ДЗ была подготовлена виртуальная машина на базе **Ubuntu 20**, на которой был установлен **MySQL 8.0** и проведена его базовая настройка
 - Были установлены на рабочую ОС **Workbench**, **DBeaver** и настроены удаленные подключения к серверу MySQL
 - Скриншоты по результатам работы были добавлены в папку **topic1**

## Homework 2
 - В рамках второго ДЗ был подготовлен файл **.my.cnf**, благодаря которому можно запускать клиент mysql и mysqldump без указания логин/пароля
 - Была создана база данных example, в ней создана таблица users, состоящаю из двух столбцов - числового id и строкового name. Список команд представлен в файле **example.sql**. Результат команд представлен на скриншоте **example.png**
 - Был создан дамп базы данных example из предыдущего задания, содержимое дампа было развернуто в новую базу данных sample. Список команд для восстановления дампа представлен в файле **sample_restore.sql**. Результат выполнения дампа и восстановления представлен на скриншоте **sample.png**
 - Был создан дамп единственной таблицы help_keyword базы данных mysql, который содержит только первые 100 строк таблицы. Для этого необходимо выполнить команду - *mysqldump mysql help_keyword --where="1 limit 100" > mysql_help_keyword_100.sql*

## Homework 3
 - В рамках третьего ДЗ была создана структура БД **vk**. Все команды для ее создания представлены в файле **vk_create.sql**.
 - С использованием сервиса *http://filldb.info* были сгенерированы тестовые данные для всех таблиц. Дамп базы данных представлен в виде файла **vk.sql**. Для его загрузки достаточно создать базу данных с именем **vk** и выполнить команду *mysql vk < vk.sql*.
 - В базовом файле **vk_create.sql** были внесены изменения для колонки *size* в таблице *media*. Был добавлен флаг *UNSIGNED* ввиду того, что отрицательное значение неактуально для размера файла.

## Homework 4
 - В рамках четвертого ДЗ была оптимизирована созданная БД **vk**. Все команды для оптимизации представлены в файле **db_optimization.sql**. Дамп БД представлен в виде файла **vk_optimized.sql**.
 - Для курсовой работы на текущий момент выбрал модель Интернет Магазина. Планирую использовать, например, таблицы для Покупателей, Заказов, Статусов Заказов, Продуктов, Типов Продуктов, Методов Оплаты, Invoice-ов, Отгрузок и т.д. 
 - В файле **create_posts_and_likes.sql** представлены команды для создания таблицы постов а также таблиц лайков для пользователей, сообщений и постов. 

## Homework 5
 - В рамках пятого ДЗ были проведеные практические упражнения с базой данных **shop** по темам *Операторы, фильтрация, сортировка и ограничение* и *Агрегация данных*
 - Все файлы выложены в папке **topic5**: дамп базы данных **shop** - **shop.sql**, первая часть ДЗ - **hw5_part1.sql**, вторая часть ДЗ - **hw5_part2.sql**

## Homework 6
- В рамках шестого ДЗ были созданы и заполнены таблицы **posts** и **likes** для БД **vk**
- Созданы все необходимые внешние ключи и выгружена диаграмма отношений
- В заданиях 3,4,5 были подготовлены SQL запросы для определения кто сделал больше всего лайков (мужчины или женщины), для вывода 10 самых молодых пользователей и количества лайков, которые они получили, а также запросы для определения 10 пользователей, которые проявили наименьшую активность (в качестве критериев были использованы пользователи с наименьшим количество постов + лайков, которые они сами поставили)
- Все файлы выложены в папке **topic6** - **vk_fk.sql**, 1 задание - **task1_likes_and_posts.sql**, 2 задание - **task2_foreign_keys**, 3,4,5 задания - **task3_4_5_queries.sql**, диаграмма отношений - **vk ERDiagram.png**

## Homework 7
 - В рамках седьмого ДЗ были подготовлены SQL запросы с помощью JOIN для составления списка пользователей users, которые осуществили хотя бы один заказ orders в интернет магазине, для вывода списка товаров products и разделов catalogs, который соответствует товару, для вывода списка рейсов с русскими именами
 - Все необходимые таблицы были предварительно созданы при необходимости и заполнены тестовыми данными
 - Все файлы выложены в папке **topic7**

## Homework 8
 - В рамках восьмого ДЗ были подготовлены SQL запросы с помощью JOIN для запросов, которые были рассмотрены для шестого ДЗ
 - Все файлы выложены в папке **topic8** 

## Homework 9
 - В рамках девятого ДЗ были подготовлены SQL запросы для тем *Транзакции, переменные, представления* (файл **transactions.sql**), *Администрирование MySQL* (файл **administration.sql**), *Хранимые процедуры и функции, триггеры* (файл **functions_triggers.sql**)
 - Все файлы выложены в папке **topic9**

## Homework 10
 - В рамках десятого ДЗ был подготовлен запрос на создание индексов для базы данных **vk**, был подготовлен запрос с использованием оконных функций
 - Все файлы выложены в папке **topic10**

