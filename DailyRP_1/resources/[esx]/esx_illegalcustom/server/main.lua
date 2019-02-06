ESX = nil
TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
local Vehicles = nil

RegisterServerEvent('esx_illegalcustom:buyMod')
AddEventHandler('esx_illegalcustom:buyMod', function(price)
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(_source)
	local blackMoney	= xPlayer.getAccount('black_money')	
    price = tonumber(price)

    if price < blackMoney.money then
            TriggerClientEvent('esx_illegalcustom:installMod', _source)
            TriggerClientEvent('esx:showNotification', _source, _U('purchased'))
            xPlayer.removeAccountMoney('black_money',price)
    else
            TriggerClientEvent('esx_illegalcustom:cancelInstallMod', _source)
            TriggerClientEvent('esx:showNotification', _source, _U('not_enough_money'))
    end
end)

RegisterServerEvent('esx_illegalcustom:refreshOwnedVehicle')
AddEventHandler('esx_illegalcustom:refreshOwnedVehicle', function(myCar)

	MySQL.Async.execute(
		'UPDATE `owned_vehicles` SET `vehicle` = @vehicle WHERE `vehicle` LIKE "%' .. myCar['plate'] .. '%"',
		{
			['@vehicle'] = json.encode(myCar)
		}
	)
end)

ESX.RegisterServerCallback('esx_illegalcustom:getVehiclesPrices', function(source, cb)

	if Vehicles == nil then
		MySQL.Async.fetchAll(
			'SELECT * FROM vehicles',
			{},
			function(result)
				local vehicles = {}
				for i=1, #result, 1 do
					table.insert(vehicles,{
						model = result[i].model,
						price = result[i].price
					})
				end
				Vehicles = vehicles
				cb(Vehicles)
			end
		)		
	else
		cb(Vehicles)
	end
end)