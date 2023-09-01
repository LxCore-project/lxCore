local nextRequestId = 0 
local serverCallbacks = {}
local clientCallbacks = {}

local function generateRequestId()
    nextRequestId = nextRequestId + 1
    return nextRequestId
end

---@param eventName string
---@param callback function
LxCore.RegisterServerCallback = function(eventName, callback)
    serverCallbacks[eventName] = callback
end

---@param eventName string
---@param callback function
---@param ... any
LxCore.TriggerServerCallback = function(eventName, callback, ...)
    local requestId = generateRequestId()
    serverCallbacks[requestId] = callback

    TriggerServerEvent('lxcore:triggerServerCallback', eventName, requestId, GetInvokingResource() or "unknown", ...)
end

RegisterNetEvent('lxcore:serverCallback')
AddEventHandler('lxcore:serverCallback', function(requestId, invoker, ...)
    local callback = serverCallbacks[requestId]
    
    if not callback then
        return print(string.format('[LxCore ERROR] Server Callback with requestId %s was called by %s but does not exist.', requestId, invoker))
    end
    
    callback(...)
    serverCallbacks[requestId] = nil -- Remove completed request
end)

---@param eventName string
---@param callback function
LxCore.RegisterClientCallback = function(eventName, callback)
    clientCallbacks[eventName] = callback
end

RegisterNetEvent('lxcore:triggerClientCallback')
AddEventHandler('lxcore:triggerClientCallback', function(eventName, requestId, invoker, ...)
    local callback = clientCallbacks[eventName]

    if not callback then
        return print(string.format('[LxCore ERROR] Client Callback not registered, name: %s, invoker resource: %s', eventName, invoker))
    end

    callback(function(...)
        TriggerServerEvent('lxcore:clientCallback', requestId, invoker, ...)
    end, ...)
end)
