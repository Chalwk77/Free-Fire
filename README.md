# Free-Fire (v1.0)
> Free Fire Bot (requested by {BK}Mark

**COMMANDS:**

| Command          | Description                 |
|------------------|-----------------------------|
| /attach `(ffid)` | Attach a new FF ID entry.   |
| /link `(url)`    | Add a new url entry         |
| /optin           | Opt-in to the FFID system.  |
| /optout          | Opt-out of the FFID system. |


## **Download at bottom of page**
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
