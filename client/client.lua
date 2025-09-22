local LxCore = {}

local LxCore.defaultCashAccount = Config.Accounts['cash'] 
local LxCore.defaultBankAccount = Config.Accounts['bank'] 


RegisterNetEvent('lxcore:client:loaded')
AddEventHandler('lxcore:client:loaded', function(Player) 
	local LxCore.PlayerData = Player or {}

	-- load data, skin, accounts, job

	if LxCore.PlayerData.cash and LxCore.PlayerData.bank and LxCore.PlayerData.job_label and LxCore.PlayerData.grade_label then
		LxCore.UpdateNUI('money_hud', LxCore.PlayerData)
	end

	if LxCore.PlayerData.skin then
		
	end

	-- 
end)

local function LxCore.UpdateNUI(data)
	if not data then return print('[ERROR-05] Couldn\'t load contents of player data table. HUD cannot display.')
		
	SendNUIMessage({
		type = 'update_mhud',
		money = data.money,
		bank = data.bank,
		job = data.job_label,
		grade = data.grade_label
	})
end