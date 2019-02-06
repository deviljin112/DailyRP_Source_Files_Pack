ESX = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

RegisterServerEvent('esx_fishing:caughtFish')
AddEventHandler('esx_fishing:caughtFish', function()
	local xPlayer = ESX.GetPlayerFromId(source)
	xPlayer.addInventoryItem('fish', 1)
end)

ESX.RegisterUsableItem('fishingrod', function(source)
	local xPlayer  = ESX.GetPlayerFromId(source)
	local baitquantity = xPlayer.getInventoryItem('bait').count
	if baitquantity > 0 then
		TriggerClientEvent('esx_fishing:startFishing', source)
		-- xPlayer.removeInventoryItem('bait', 1)
	else 
		TriggerClientEvent('esx:showNotification', source, "Tu n'as pas assez de appats de poissons.")
	end
end)

ESX.RegisterUsableItem('fish', function(source)

	local xPlayer = ESX.GetPlayerFromId(source)

	xPlayer.removeInventoryItem('fish', 1)

	TriggerClientEvent('esx_status:add', source, 'hunger', 50000)
	TriggerClientEvent('esx_basicneeds:onEat', source)
	TriggerClientEvent('esx_fishing:onEatFish', source)
	TriggerClientEvent('esx:showNotification', source, 'Vous avez utilisé 1x ~b~Poisson~s~')

end)


RegisterServerEvent('esx_fishing:removeInventoryItem')
AddEventHandler('esx_fishing:removeInventoryItem', function(item, quantity)
	local xPlayer = ESX.GetPlayerFromId(source)
	xPlayer.removeInventoryItem(item, quantity)
end)


RegisterServerEvent('esx_fishing:sellFish')
AddEventHandler('esx_fishing:sellFish', function()

    local _source = source
    local xPlayer = ESX.GetPlayerFromId(_source)
	local fishQuantity = xPlayer.getInventoryItem('fish').count
	local randomMoney = math.random(30, 50)
	
	if fishQuantity == 0 then
	sendNotification(_source, 'Nie masz wiecej ryb', 'error', 2500)
	else
	xPlayer.removeInventoryItem('fish', fishQuantity)
	xPlayer.addAccountMoney('bank', fishQuantity * 50)
	sendNotification(_source, 'Sprzedales ' .. fishQuantity .. ' ryb za ' .. fishQuantity * randomMoney .. ' $', 'success', 3500)
	end

end)

--notification
function sendNotification(xSource, message, messageType, messageTimeout)
    TriggerClientEvent("pNotify:SendNotification", xSource, {
        text = message,
        type = messageType,
        queue = "lmao",
        timeout = messageTimeout,
        layout = "bottomCenter"
    })
end