local Event = { }

function Event:NewOptin(msg, args)

    local member = msg.member
    local username = msg.author.username
    local user_id = msg.author.id
    if not (self.data[username]) then
        self.data[username] = {
            -- Discord ID:
            [self.fields[1]] = user_id,
            -- Free Fire ID:
            [self.fields[2]] = 'Not Specified',
            -- Opt-in status:
            [self.fields[3]] = '✅',
            -- links table:
            [self.fields[4]] = {},
        }

        local embed = self.embed
        embed.description = embed.description:gsub('$username', username)
        embed.fields[1].value = embed.fields[1].value:gsub('$user_id', user_id)
        embed.timestamp = os.date(embed.timestamp)
        member:send({ embed = embed })

    else
        member:send('You are already opted in.')
        return
    end

    self:Write(self.database_name, self.data)
end

return Event