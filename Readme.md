# Notify

This plugin allows you to configure notifications for [numerous services](https://github.com/caronc/apprise).

# Installation

To use this plugin for your Flashforge AD5X/AD5M/AD5M Pro

1. Install zMod: https://github.com/ghzserg/zmod
2. [Update zMod](https://github.com/ghzserg/zmod/wiki/Setup_en#updating-the-mod)
3. Run the command: ```ENABLE_PLUGIN name=notify```

# Removal

Run the command: ```DISABLE_PLUGIN name=notify```

# Configuration

To configure, you must:
- Add the `url` in `mod_data/notify.txt`
- Add the `name` in `mod_data/notify.txt`
- Call the macro ```UPDATE_NOTIFY```

To trigger a notification in your G-code, you need to use the macro ```_NOTIFY```

It has 2 parameters:
- PHOTO: 1 – take a photo (default), 0 – do not take a photo
- MSG: The message to be sent

Example: ```_NOTIFY MSG="Hello" PHOTO=0```

The message `Hello` will be sent without a photo.

If you want to receive print progress notifications every 5 percent, execute the following macro:

```SAVE_VARIABLE VARIABLE=notify_percent VALUE=5```

The value `5` can be replaced with any integer from 1 to 99.

You can find a list of possible URLs on the [Apprise](https://github.com/caronc/apprise) page.

## Notification Management

The printer sends 2 types of notifications

### Moonraker
To turn them off, you need to override in `mod_data/user.moonraker.conf`

- Print Start

  ```
  [notifier print_start]
  events: none
  ```

- Print Complete

  ```
  [notifier print_complete]
  events: none
  ```

- Print Error

  ```
  [notifier print_error]
  events: none
  ```

- Print Cancelled

  ```
  [notifier print_cancelled]
  events: none
  ```

- Pause

  ```
  [notifier print_paused]
  events: none
  ```

- Print Resumed

  ```
  [notifier print_resumed]
  events: none
  ```

### zmod
To turn them off, you need to:

- When the printer is turned on

  ```SAVE_VARIABLE VARIABLE=notify_on VALUE=0```

- At the end of a print (called from `END_PRINT`)

  ```SAVE_VARIABLE VARIABLE=notify_end VALUE=0```

- When filament sensors are triggered

  ```SAVE_VARIABLE VARIABLE=notify_filament VALUE=0```

## Telegram Setup Example

### Bot Registration

How to register your own bot
1. Go to [@BotFather](https://t.me/BotFather)
2. Send `/newbot`
3. Enter any name you like
4. Enter the bot username: `ff5msuper_bot` - it must end with `_bot`.
5. You will receive a long token - it needs to be inserted into `mod_data/notify.txt`, replacing `{bottoken}` (e.g., `1234567890:AAAAAAAABBBBBBBBBBCCCCCCCDDDEEEEEEE`)
6. **Find the bot you created in Telegram and send it any message**

### Get ChatID

1. Go to [@RawDataBot](https://t.me/RawDataBot)
2. Send `/start`
3. Find the parameter `message->chat->id`
4. You will receive a long ID - it needs to be inserted into `mod_data/notify.txt`, replacing `{ChatID}` (e.g., `123456789`)

### Set the printer name

1. Open the `mod_data/notify.txt` file.
2. Find or add the line `name: `
3. Replace `{printer_name}` or add your printer’s name.

### Final Steps

1. In the file `mod_data/notify.txt`, it was:
   
   ```
   [notify]
   url: tgram://{bottoken}/{ChatID}
   name: {printer_name}
   ```
   
   It becomes:
   
   ```
   [notify]
   url: tgram://1234567890:AAAAAAAABBBBBBBBBBCCCCCCCDDDEEEEEEE/123456789
   name: my_ad5x
   ```

   **Don't remove ```url: ```, even if you're not configuring Telegram. Otherwise, errors will occur.**

2. In the Fluidd/Moonraker console, **run the macro** ```UPDATE_NOTIFY```

3. Wait for the reboot

4. **You can send a notification using the macro ```_NOTIFY MSG=Test``` from the Fluidd/Mainsail console**

## Matrix Setup Example

### Bot Creation

You need to create a bot for your printer via [**Synapse Admin**](https://github.com/Awesome-Technologies/synapse-admin) or it fork for from [**etke.cc**](https://github.com/etkecc/synapse-admin). If your Matrix server is not Synapse, you need find out for yoursef 🙃

### Room Creation

1. You need to create room from your or bot account and join (accept invitation), you both must be in same chat.

2. You need to get a room ID, usually it is in the end of URL of your web client (ex. `https://example.org/#/rooms/!opaque_id:example.org`) or you can look it up in `Synapse Admin` from step before. \
   Room ID should look like `!opaque_id:example.org`

### From now we have several options

We can use **login/password path** or **access token** (useful for OIDC setup)

### Getting access token (optional)

You need to use this command in your terminal:

```
curl -XPOST -d '{"type":"m.login.password", "user":"your_username", "password":"your_password"}' "https://your-matrix-server.com/_matrix/client/r0/login"
```

It returns your **access code**

### Final Steps

1. In the file `mod_data/notify.txt`, it must be like that if you are using **login/password**:
   
   ```
   [notify]
   url: matrixs://user:pass@example.org/{your room ID here}
   name: my_ad5x
   ```
   or if you are using **access token**:

   ```
   [notify]
   url: matrixs://token@example.org/{your room ID here}
   name: my_ad5x
   ```

2. In the Fluidd/Moonraker console, **run the macro** ```UPDATE_NOTIFY```

3. Wait for the reboot, if you do all right, you will get the message that printer is turned on.

4. **You can send a notification using the macro ```_NOTIFY MSG=Test``` from the Fluidd/Mainsail console**
