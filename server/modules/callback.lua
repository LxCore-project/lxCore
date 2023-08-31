local calls = {}

---@param eventName string
---@param callback function

LxCore.RegisterServerCallback = function(eventName, callback)
    calls[eventName] = callback
end

RegisterNetEvent('lxcore:triggerServerCallback')
AddEventHandler('lxcore:triggerServerCallback', function(eventName, requestId, invoker, ...)
    if not calls[eventName] then
        return print(('[^1LxCore ERROR!!!!^7] Server Callback not registered, name: ^5%s^7, invoker resource: ^5%s^7'):format(eventName, invoker))
    end

    local source = source

    calls[eventName](source, function(...)
        TriggerClientEvent('lxcore:serverCallback', source, requestId, invoker, ...)
    end)
end)
