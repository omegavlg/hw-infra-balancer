# Домашнее задание к занятию «`Вычислительные мощности. Балансировщики нагрузки`» - `Дедюрин Денис`

---
## Задание 1. Yandex Cloud

1. Создать бакет Object Storage и разместить в нём файл с картинкой:

 - Создать бакет в Object Storage с произвольным именем (например, _имя_студента_дата_).
 - Положить в бакет файл с картинкой.
 - Сделать файл доступным из интернета.

2. Создать группу ВМ в public подсети фиксированного размера с шаблоном LAMP и веб-страницей, содержащей ссылку на картинку из бакета:

 - Создать Instance Group с тремя ВМ и шаблоном LAMP. Для LAMP рекомендуется использовать `image_id = fd827b91d99psvq5fjit`.
 - Для создания стартовой веб-страницы рекомендуется использовать раздел `user_data` в [meta_data](https://cloud.yandex.ru/docs/compute/concepts/vm-metadata).
 - Разместить в стартовой веб-странице шаблонной ВМ ссылку на картинку из бакета.
 - Настроить проверку состояния ВМ.

3. Подключить группу к сетевому балансировщику:

 - Создать сетевой балансировщик.
 - Проверить работоспособность, удалив одну или несколько ВМ.

4. (дополнительно)* Создать Application Load Balancer с использованием Instance group и проверкой состояния.

### Ответ:

Все исходники лежат в папке **src** текущего репозитория.

1. После создания инфраструктуры, проверяем созданный бакет с загруженной картинкой, группу виртуальных машин и балансировщик:

<img src = "img/00.png" width = 100%> созданный бакет

<img src = "img/01.png" width = 100%> ссылка на изображение

<img src = "img/02.png" width = 100%> картинка =)

<img src = "img/03.png" width = 100%> группа виртуальных машин

<img src = "img/04.png" width = 100%> балансировщик

2. Переходим по адресу, который присвоился балансировщику и пытаемся обновить страницу, чтобы увидеть, что блансировщик переключает нагрузку на разные ВМ.

<img src = "img/05.png" width = 100%>

<img src = "img/06.png" width = 100%>

<img src = "img/07.png" width = 100%>

3. Удаляем одну из ВМ, и пробуем снова обнвлять страницу. Балансировщик стал переключаться между оставшимися ВМ.

<img src = "img/08.png" width = 100%>

<img src = "img/09.png" width = 100%>

4. Через некоторое время в группе ВМ создасться новая ВМ и также подключится к баланисировщику.

<img src = "img/10.png" width = 100%> новая, созданная ВМ. 

5. С ALB не получилось. =(