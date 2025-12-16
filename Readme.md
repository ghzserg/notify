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

To configure, you need to:
- Add the `url` in `mod_data/notify.txt`
- Call the macro ```UPDATE_NOTIFY```

You can find a list of possible URLs on the [Apprise](https://github.com/caronc/apprise) page.

## Example: Telegram Setup

### Bot Registration

How to register your bot
1. Go to [@BotFather](https://t.me/BotFather)
2. Type `/newbot`
3. Enter any name you like.
4. Enter the bot name, e.g., `ff5msuper_bot` - it must end with `_bot`.
5. You will receive a long ID (token) - you will need to enter it in the bot settings in `mod_data/notify.txt`, replacing `{bottoken}`.

### Get ChatID

1. Go to [@RawDataBot](https://t.me/RawDataBot)
2. Type `/start`
3. Find the parameter `message->chat->id`
4. You will receive a long ID - you need to enter it in the bot settings in `mod_data/notify.txt`, replacing `{ChatID}`.

### Final Step

The `mod_data/notify.txt` file should contain something similar to:
```
[notify]
url: tgram://1234567890:AAAAAAAABBBBBBBBBBCCCCCCCDDDEEEEEEE/123456789
```

In the Fluidd/Moonraker console, **run the macro** ```UPDATE_NOTIFY```.

Wait for the system to reload.
