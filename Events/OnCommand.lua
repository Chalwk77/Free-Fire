local Command = {}

local function CmdSplit(s)
    local t = { }
    for arg in s:gmatch('([^%s]+)') do
        t[#t + 1] = arg:lower()
    end
    return t
end

local function DeleteMsg(msg, member, error)
    member:send(error)
    msg:delete()
    return false
end

function Command:Whitelisted(msg)

    local enabled = self.white_list.enabled
    local role = self.white_list.role
    local err = self.white_list.error
    if (enabled) then
        local member = msg.member
        local allow = member:hasRole(role)
        return allow or DeleteMsg(msg, member, err:gsub('$user', member.id))
    end
    return true
end

function Command:OnCommand(msg)

    if (msg.channel.id ~= self.channel_id) then
        return
    end

    local author = msg.author
    local member = msg.member
    local content = msg.content
    local args = CmdSplit(content)

    if (not author or author.bot) then
        return
    elseif (#args > 0 and args[1]:sub(1, 1) == self.prefix) then

        local success, err = pcall(function()
            local cmd = args[1]:gsub(self.prefix, '')
            if (self.cmds[cmd] and self:Whitelisted(msg)) then
                self.cmds[cmd]:Run(msg, args)
            end
        end)

        if (not success) then
            print(err)
            member:send('Something went wrong, please try again later')
        end
    end
end

return Command