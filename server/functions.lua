LxCore = {}

function LxCore.GetPlayerIdentifier(type, player)
    local id = GetNumPlayerIdentifiers(player)
    for count = 0, id do
        local identifier = GetPlayerIdentifier(player, count)
        if identifier and string.find(identifier, type) then
            return identifier
        end
    end
    return nil
end



exports('SharedObject', function()
	return LxCore
end)
