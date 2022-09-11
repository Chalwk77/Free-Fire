local Member = {}

function Member:HasPermission(member, msg, node)
    if (not member:hasPermission(node)) then
        msg:delete()
        member:send {
            embed = {
                title = 'Perms Error',
                description = 'You need "' .. node .. '" perm to use this command.',
                color = 0x000000
            }
        }
        return false
    end
    return true
end

return Member