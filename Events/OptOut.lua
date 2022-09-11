local Event = { }

function Event:NewOptin(msg)

    local member = msg.member
    local username = msg.author.username
    if (self.data[username]) then
        self.data[username] = nil
        member:send('You are no longer opted in')
    else
        member:send('You are already opted out.')
        return
    end

    self:Write(self.database_name, self.data)
end

return Event