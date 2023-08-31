lxCore = {}

exports('SharedObject', function()
	return lxCore
end)

function lxCore.Notify(message)
    SetNotificationTextEntry("STRING")
    AddTextComponentString(message)
    DrawNotification(false, false)
end

exports('Notify', function(message)
	lxCore.Notify(message)
end)
