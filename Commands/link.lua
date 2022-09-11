local Command = {
    name = 'link',
    description = 'Add link to the database',
    permission_node = 'administrator',
    help = 'Syntax: /$cmd <url>'
}

function Command:Run(msg, args)
    local member = msg.member
    if (self:HasPermission(member, msg, self.permission_node)) then
        self:NewLink(msg, args)
    end
end

return Command