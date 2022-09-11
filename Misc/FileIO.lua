local IO = { }

local open = io.open

function IO:Write(dir, content)
    local path = './' .. dir
    local file = open(path, 'w')
    if (file) then
        file:write(self.json:encode_pretty(content))
        file:close()
    end
end

function IO:Read(dir)
    local content = ''
    local path = './' .. dir
    local file = open(path, 'r')
    if (file) then
        content = file:read('*all')
        file:close()
    end
    return content
end

return IO