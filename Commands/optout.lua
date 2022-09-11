local Command = {
    name = 'optout',
    description = 'Opt-out of the database.',
    permission_node = 'administrator',
    help = 'Syntax: /$cmd'
}

function Command:Run(msg, args)
    local member = msg.member
    if (self:HasPermission(member, msg, self.permission_node)) then
        self:OptOut(msg, args)
    end
end

return Command