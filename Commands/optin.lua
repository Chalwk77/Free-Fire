local Command = {
    name = 'optin',
    description = 'Opt-in to the FFID system.',
    permission_node = 'administrator',
    help = 'Syntax: /$cmd'
}

function Command:Run(msg, args)
    local member = msg.member
    if (self:HasPermission(member, msg, self.permission_node)) then
        self:NewOptin(msg, args)
    end
end

return Command