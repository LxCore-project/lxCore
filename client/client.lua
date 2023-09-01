local PlayerData = {}

-- Register the network event and add the data to PlayerData
RegisterNetEvent('lxcore:client:loaded')
AddEventHandler('lxcore:client:loaded', function(Player) 
	LxCore.PlayerData = Player


		end)

-- Function to set player data in PlayerData
function SetPlayerData(Player)
    PlayerData = Player
end

-- Function to get player data
function GetPlayerData()
    return PlayerData
end

-- Export the GetPlayerData function
exports('getplayer', GetPlayerData)           ----local playerData = exports['lxCore']:getplayer()
