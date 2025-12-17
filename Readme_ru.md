# Notify

Плагин позволяет настроить уведомления для [множества сервисов](https://github.com/caronc/apprise).

# Установка

Чтобы использовать этот плагин для вашего Flashforge AD5X/AD5M/AD5M Pro

1. Установите zMod: https://github.com/ghzserg/zmod
2. [Обновите zMod](https://github.com/ghzserg/zmod/wiki/Setup#%D0%BE%D0%B1%D0%BD%D0%BE%D0%B2%D0%BB%D0%B5%D0%BD%D0%B8%D0%B5-%D0%BC%D0%BE%D0%B4%D0%B0)
3. Выполните команду: ```ENABLE_PLUGIN name=notify```

# Удаление

Выполните команду: ```DISABLE_PLUGIN name=notify```

# Настройка 

Для настройки необходимо:
- Прописать `url` в `mod_data/notify.txt`
- Вызывать макрос ```UPDATE_NOTIFY```

Список вариантов url можно получить на странице [Apprise](https://github.com/caronc/apprise)

## Пример настройки Telegram

### Регистрация бота

Как зарегистрировать свой бот
1. Идете к [@BotFather](https://t.me/BotFather)
2. `/newbot`
3. Вводите любое имя, которое  вам нравится
4. Вводите имя бота  ff5msuper_bot - обязательно _bot  в конце.
5. Получаете длинный ID - его нужно будет прописать в `mod_data/notify.txt` заменив `{bottoken}` (например `1234567890:AAAAAAAABBBBBBBBBBCCCCCCCDDDEEEEEEE`)

### Получить ChatID

1. Идете к [@RawDataBot](https://t.me/RawDataBot)
2. `/start`
3. Находите параметр `message->chat->id`
4. Получаете длинный ID - его нужно будет прописать в `mod_data/notify.txt` заменив `{ChatID}` (например `123456789`)

### Финал

1. В файле `mod_data/notify.txt` было:

```
[notify]
url: tgram://{bottoken}/{ChatID}
```

Стало:

```
[notify]
url: tgram://1234567890:AAAAAAAABBBBBBBBBBCCCCCCCDDDEEEEEEE/123456789
```

2. В консоли Fluidd/Moonraker **запустите макрос** ```UPDATE_NOTIFY```

3. Дождитесь перезагрузки

4. Найдите в Telegram бота, которого вы создали и напишите ему любое сообщение

5. **Отправить уведомление можно макросом ```_NOTIFY MSG=Test``` из консоли Fluidd/Mainsail**
