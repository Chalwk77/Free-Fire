local Event = { }

function Event:NewLink(msg, args)

    local member = msg.member
    local username = msg.author.username

    if (not self.data[username]) then
        member:send('You need to opt in first.')
        return
    end

    local url = table.concat(args, ' ', 2)
    if (url == '') then
        member:send('You need to provide a link.')
        member:send(self.help)
        return
    end

    table.insert(self.data[username][self.fields[4]], url)
    self:Write(self.database_name, self.data)

    member:send('Added **' .. url .. '** to your list of links.')
end

return Event