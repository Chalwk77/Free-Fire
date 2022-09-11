local Event = { }

function Event:NewFFID(msg, args)

    local member = msg.member
    local username = msg.author.username

    if (not self.data[username]) then
        member:send('You need to opt in first.')
        return
    end

    local ffid = (args[2] and args[2]:match('%d+'))
    if (not ffid) then
        member:send('You need to provide an FF ID.')
        member:send(self.help)
        return
    end

    self.data[username][self.fields[2]] = ffid
    self:Write(self.database_name, self.data)

    member:send('Attaching **' .. ffid .. '** to the database.')
end

return Event