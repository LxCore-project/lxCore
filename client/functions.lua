lxCore = {}

exports('SharedObject', function()
	return lxCore
end)
-- @param message string The message to display
function lxCore.Notify(message)
	if GetResourceState('lx_notify') == 'missing' then
	    SetNotificationTextEntry("STRING")
	    AddTextComponentString(message)
	    DrawNotification(false, false)
	else
		exports['lx_core']:Notify(message)
	end
end

exports('Notify', function(message)
	lxCore.Notify(message)
end)

function lxCore.GetPlayers()
    local peeps = {}
    for i = 0, 255 do 
        if NetworkIsPlayerActive(i) then
            table.insert(peeps, i)
        end
    end
    return players
end

exports('Players', function()
	lxCore.GetPlayers()
end)
