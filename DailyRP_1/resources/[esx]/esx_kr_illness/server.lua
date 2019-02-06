local ESX = nil
local ill = false

-- ESX
TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

ESX.RegisterUsableItem('anti', function(source)
	local xPlayer = ESX.GetPlayerFromId(source)

	xPlayer.removeInventoryItem('anti', 1)
TriggerClientEvent('esx_kr_ill:frisk', source)
end)
