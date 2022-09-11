# Free-Fire (v1.0)
> Free Fire Bot requested by {BK}Mark

**COMMANDS:**

| Command          | Description                 |
|------------------|-----------------------------|
| /attach `(ffid)` | Attach a new FF ID entry.   |
| /link `(url)`    | Add a new url entry         |
| /optin           | Opt-in to the FFID system.  |
| /optout          | Opt-out of the FFID system. |

## **SETTINGS**
```lua
return {
    -- =================================================--
    -- CONFIGURATION STARTS ...

    --------------------------------------
    -- DISCORD SERVER ID --
    -- Paste your Discord server numerical ID (NOT NAME):
    -- 1). Right click the Discord server icon and click "Copy ID".
    -- 2). Replace "xxxxxxxxxxxxxxxxxx" below with the id you copied.
    discord_server_id = 'xxxxxxxxxxxxxxxxxx',


    -- Table of commands.
    -- Set to false to disable a command.
    --
    commands = {
        -- Command to attach an FF ID to a users database entry:
        ['ffid'] = true,

        -- Command to link a new url entry:
        ['link'] = true,

        -- Command to opt-in:
        ['optin'] = true,

        -- Command to opt-out:
        ['optout'] = true,
    },


    -- File name of the database:
    database_name = 'free_fire.json',


    -- Database field names:
    fields = {
        -- Field name containing this users Discord ID:
        [1] = 'Discord ID',

        -- Field name for the user's Free Fire ID:
        [2] = 'FF ID',

        -- Field name for the user's opt-in status:
        [3] = 'Opt-in',

        -- Field name for the user's links:
        [4] = 'URLs'
    },


    -- Command prefix:
    -- This is the character that will be used to identify a command.
    -- For example, if you set this to "!", then you would type "!help" to get a list of commands.
    --
    prefix = '/',


    -- Id of the channel where the bot will listen for commands:
    -- 1). Right click the channel and click "Copy ID".
    -- 2). Replace "xxxxxxxxxxxxxxxxxx" below with the id you copied.
    --
    channel_id = 'xxxxxxxxxxxxxxxxxx',


    -- Embed message sent to the user when they opt-in:
    --
    embed = {
        title = 'New Opt-in',
        description = 'New opt-in from **$username**',
        fields = {
            {
                name = 'Discord ID',
                value = '$user_id',
                inline = true
            },
            {
                name = 'Free Fire ID',
                value = 'Not Specified', -- FF ID will be 'not specified' until they attach one with /attach <ffid>
                inline = true
            },
            {
                name = 'Opt-in',
                value = '✅', -- Opt-in status will be '✅' until they opt-out with /optout
                inline = true
            },
        },
        color = 0x00ff00,
        timestamp = '!%Y-%m-%dT%H:%M:%S',
        footer = {
            text = 'Free Fire Bot'
        }
    },

    --------------------------------------
    -- WHITE LIST --
    -- Only people with the whitelist role can opt-in:
    -- Replace "xxxxxxxxxxxxxxxxxx" below with the role id.
    white_list = {
        enabled = false,
        role = "xxxxxxxxxxxxxxxxxx",
        error = "<@$user>**, you do not have permission to opt-in.**"
    },

    -- =================================================--
    -- CONFIGURATION ENDS
    -- =================================================--

    -- do not touch --
    token = function()
        local token = ''
        local file = io.open('./auth.data')
        if (file) then
            token = file:read()
            file:close()
        end
        return token
    end
}
```


## [DOWNLOAD LINK](https://github.com/Chalwk77/Free-Fire/releases)
___

# Installation:

Prerequisites:
**Setup requires that you have Administrative or _Manage Server_ permissions on the Discord server.**

A quick note for Linux users:
You will be required to install the **Luvit Runtime Environment**. Follow [these instructions](https://luvit.io/install.html) to learn how.

-----

1. Register an application on the [Discord Developer Portal](https://Discordapp.com/developers/applications/) and obtain a **bot token**.
   A Discord bot token is a short phrase (represented as a jumble of letters and numbers) that acts as a key to controlling a Discord Bot.

2. Put your bot token inside the *./Free-Fire/auth.data* file and **never** share your Discord bot token with anyone.

There are many tutorials online to help you learn how to create a Discord Application, however, as a general guide, follow these steps:

1. Click **New Application**
- Provide a name for your bot and click create.
- Click the **Bot** tab then click the blue *Add Bot* button (click "*yes, do it!*", when prompted).
- Copy your token and paste it into the aforementioned auth.data file located inside the Discord Bot folder.
- On the same page, under the Privileged Gateway Intents section, enable PRESENCE INTENT, SERVER MEMBERS INTENT and MESSAGE CONTENT INTENT. 

2. Now click the OAuth2 tab, click URL Generator -> check the BOT scope.
   Under bot permissions check Administrator.

Copy and paste the URL that gets generated into a web browser and hit enter.

3. You will be prompted to add the bot to a Discord server, select one, click continue and authorize.

**You have now successfully added the Discord Application to your Discord server.**

____

### **IMPORTANT**

**Further configuration is required.**<br/>
This bot is NOT plug-and-play. See *Free-Fire/settings.lua* for full configuration.

**Launching the Discord Bot**<br/>
Open Command Prompt/Terminal and CD into the Free-Fire root directory. Type *luvit main*, and the bot will launch.

If you need help installing on Linux (or Windows, for that matter), DM me on Discord:<br/>
_Chalwk#9284_

____
