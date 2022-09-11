-- Free Fire Entry point file
-- Copyright (c) 2022, Jericho Crosby <jericho.crosby227@gmail.com>

local Discord = {
    cmds = {},
    data = {},
    json = require('discordia/libs/utils/Json.lua'),
    dependencies = {
        ['./'] = { 'settings' },
        ['./Events/'] = {
            'NewFFID',
            'NewLink',
            'NewOptin',
            'Optout',
            'OnCommand'
        },
        ['./Misc/'] = {
            'FileIO',
            'LoadDatabase',
            'PermissionHandler'
        }
    }
}

local Discordia = require('discordia')
local client = Discordia.Client()

setmetatable(Discord, {
    __index = client
})


function Discord:LoadDependencies()
    local s = self
    for path, t in pairs(self.dependencies) do
        for _, file in pairs(t) do
            local f = loadfile(path .. file .. '.lua')()
            setmetatable(s, { __index = f })
            s = f
        end
    end
end

function Discord:LoadCommands()
    local path = './Commands/'
    for file, enabled in pairs(self.commands) do
        if (enabled) then
            local command = require(path .. file)
            local cmd = command.name
            self.cmds[cmd] = command
            self.cmds[cmd].help = command.help:gsub('$cmd', cmd)
            setmetatable(self.cmds[cmd], { __index = self })
        end
    end
end

function Discord:OnReady()
    self.guild = client:getGuild(self.discord_server_id)
    if (self.guild) then

        client:info('Ready: ' .. client.user.tag .. ' | Bot version: 1.0')
        self.data = self:LoadData()
        self:LoadCommands()
    end
end

function Discord:StartBot()
    self:LoadDependencies()
    client:run('Bot ' .. self.token())
    client:setGame("🔥 FREE FIRE 🔥")
end

Discord:on('ready', function()
    Discord:OnReady()
end)

Discord:on('messageCreate', function(msg)
    Discord:OnCommand(msg)
end)

Discord:StartBot()