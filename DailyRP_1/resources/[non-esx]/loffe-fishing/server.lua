ESX = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

RegisterServerEvent('loffe-fishing:sellFish')
AddEventHandler('loffe-fishing:sellFish', function()

    local _source = source
    local xPlayer = ESX.GetPlayerFromId(_source)
	local fishQuantity = xPlayer.getInventoryItem('fish').count
	local randomMoney = math.random(30, 50)
	
	if fishQuantity == 0 then
	sendNotification(_source, 'Du har inga fiskar', 'error', 2500)
	else
	xPlayer.removeInventoryItem('fish', fishQuantity)
	xPlayer.addAccountMoney('bank', fishQuantity * 50)
	sendNotification(_source, 'Du sålde ' .. fishQuantity .. ' fiskar för ' .. fishQuantity * randomMoney .. ' SEK', 'success', 3500)
	end

end)

RegisterServerEvent('loffe-fishing:giveFish')
AddEventHandler('loffe-fishing:giveFish', function()

    local _source = source
    local xPlayer = ESX.GetPlayerFromId(_source)
	local fishQuantity = xPlayer.getInventoryItem('fish').count
	local randomWeight = math.random(700, 5000)
	
	if fishQuantity <= 200 then

		xPlayer.addInventoryItem('fish', 1)
		sendNotification(_source, 'Du fångade en fisk som vägde ' .. randomWeight .. ' gram.', 'success', 3500)
	end

end)

RegisterServerEvent('loffe-fishing:buy')
AddEventHandler('loffe-fishing:buy', function(item, price, amount)
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)
	local label = ESX.GetItemLabel(item)
	local itemAmount = xPlayer.getInventoryItem(item).count
	
	if(xPlayer.getMoney() >= price) then
		if item == 'fiskespo' and itemAmount < 1 then 
			xPlayer.removeMoney(price)
			xPlayer.addInventoryItem(item, amount)
			sendNotification(_source, 'Du köpte ' .. amount .. ' ' .. label  .. ' för ' .. price .. ' SEK', 'success', 2500)
		elseif item ~= 'fiskespo' and itemAmount < 200 then
			xPlayer.removeMoney(price)
			xPlayer.addInventoryItem(item, amount)
		else
			sendNotification(_source, 'Du har för många ' .. label .. 'n på dig.', 'error', 2500)
		end
	else
		sendNotification(_source, 'Du har inte tillräckligt med pengar', 'error', 2500)
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