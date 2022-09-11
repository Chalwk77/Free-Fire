--[[
    FOR INSTALLATION INSTRUCTIONS AND UPDATES:
    https://github.com/Chalwk77/Free-Fire/blob/main/README.md
]]

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
        enabled = true,
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