ESX               = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

----

ESX.RegisterServerCallback('esx_lockpick:hasSucceeded', function(source, cb)
	local randomValue = math.random(1, 10)
	if (randomValue  <= 3) then
		cb(true)
	else
		cb(false)
	end
end)


ESX.RegisterUsableItem('dyrkset', function(source)
	local xPlayer = ESX.GetPlayerFromId(source)

	xPlayer.removeInventoryItem('dyrkset', 1)
	TriggerClientEvent('esx_lockpick:startLockpick', source)
end)
