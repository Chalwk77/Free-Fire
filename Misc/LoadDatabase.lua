local Database = { }

function Database:LoadData()

    local file = self.database_name
    local content = self:Read(file)
    local data = self.json:decode(content)

    if (not data) then
        self:Write(file, {})
    end

    return data or {}
end

return Database