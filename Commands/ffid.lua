local Command = {
    name = 'attach',
    description = 'Attach your FF ID to the database.',
    permission_node = 'administrator',
    help = 'Syntax: /$cmd <ffid>'
}

function Command:Run(msg, args)
    local member = msg.member
    if (self:HasPermission(member, msg, self.permission_node)) then
        self:NewFFID(msg, args)
    end
end

return Command