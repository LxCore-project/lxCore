-- zaps is a skid alv on top

function LoadCharacterData(source)
  if GetResourceState('oxmysql') ~= 'started' then
    return print('^6[LX-CORE]^0 Could not load player data as oxmysql is not started!')
  end

  if Config.IdentifierType == '' or Config.IdentifierType == nil then
    return print('^6[LX-CORE]^0 Could not load player data as ^2Config.IdentifierType^0 is invalid!')
  end

  if Config.IdentifierType == 'license' then
    local userData = MySQL.Sync.fetchAll('yea i cant be bothered to do this rn ill come back to it later lol')
  elseif Config.IdentifierType == 'discord' then

  elseif Config.IdentifierType == 'steam' then

  end
end

CreateThread(function()
    while true do
        Citizen.Wait(5000) -- Wait 5 sec
        
        local resourceStates = {
            es_extended = GetResourceState('es_extended'),
            qb_core = GetResourceState('qb-core')
        }
        
        for resourceName, state in pairs(resourceStates) do
            if state == 'started' then
                print("Please use IxCore instead of " .. resourceName)
            end
        end
    end
end)
