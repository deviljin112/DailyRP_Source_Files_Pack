ESX = nil

TriggerEvent('esx:getSharedObject', function(obj) 
  ESX = obj
end)


RegisterServerEvent('payforplayer')
AddEventHandler('payforplayer',function(winnings)

	local _source = source
	local xPlayer  = ESX.GetPlayerFromId(_source)

		xPlayer.addMoney(winnings)


end)

RegisterServerEvent('playerpays')
AddEventHandler('playerpays',function(bet)

	local _source = source
	local xPlayer  = ESX.GetPlayerFromId(_source)

	if xPlayer.get('money') >= bet then
		xPlayer.removeMoney(bet)
		TriggerClientEvent('spinit',source)
	else
		TriggerClientEvent('errormessage',source)
	end

end)