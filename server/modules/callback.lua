local calls = {}
local pendingClientRequests = {}

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



local function generateRequestId()
  local newRequestId = #pendingClientRequests + 1
  return newRequestId
end

---@param player number The server ID of the player
---@param eventName string The name of the event to be triggered
---@param callback function The callback function to execute
LxCore.TriggerClientCallback = function(player, eventName, callback, ...)
  if type(player) ~= 'number' or type(eventName) ~= 'string' or type(callback) ~= 'function' then
    return print('LxCore ERROR: Invalid parameters passed to TriggerClientCallback')
  end

  local requestId = generateRequestId()
  pendingClientRequests[requestId] = callback

  TriggerClientEvent('lxcore:triggerClientCallback', player, eventName, requestId, GetInvokingResource() or "unknown", ...)
end

RegisterNetEvent('lxcore:clientCallback')
AddEventHandler('lxcore:clientCallback', function(requestId, invoker, ...)
  local callback = pendingClientRequests[requestId]
  
  if callback then
    callback(...)
    pendingClientRequests[requestId] = nil -- Remove completed request
  else
    print(string.format('[LxCore ERROR!!!!!] Client Callback with requestId %s was called by %s but does not exist.', requestId, invoker))
  end
end)
