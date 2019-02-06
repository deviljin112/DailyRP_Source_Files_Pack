ESX              = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

AddEventHandler('esx:playerLoaded', function(source)

  local xPlayer = ESX.GetPlayerFromId(source)
    
end)


ESX.RegisterServerCallback('esx_hangard:getOwnedVehicles', function (source, cb)
  local xPlayer = ESX.GetPlayerFromId(source)

  MySQL.Async.fetchAll(
    'SELECT * FROM owned_vehicles WHERE owner = @owner',
    { ['@owner'] = xPlayer.identifier },
    function (result)
      local vehicles = {}

      for i=1, #result, 1 do
        local vehicleData = json.decode(result[i].vehicle)
        table.insert(vehicles, vehicleData)
      end

      cb(vehicles)
    end
  )
end)

ESX.RegisterServerCallback('esx_hangard:checkIfVehicleIsOwned', function (source, cb, plate)

  local xPlayer = ESX.GetPlayerFromId(source)
  local found = nil
  local vehicleData = nil

  MySQL.Async.fetchAll(
    'SELECT * FROM owned_vehicles WHERE owner = @owner',
    { ['@owner'] = xPlayer.identifier },
    function (result)
      local vehicles = {}

      for i=1, #result, 1 do
        vehicleData = json.decode(result[i].vehicle)
        if vehicleData.plate == plate then
          found = true
          cb(vehicleData)
          break
        end
      end

      if not found then
        cb(nil)
      end
    end
  )
end)

RegisterServerEvent('esx_hangard:updateOwnedVehicle')
AddEventHandler('esx_hangard:updateOwnedVehicle', function(vehicleProps)
 
 	local _source = source
 	local xPlayer = ESX.GetPlayerFromId(source)
 
 	MySQL.Async.fetchAll(
 		'SELECT * FROM owned_vehicles WHERE owner = @owner',
 		{
 			['@owner'] = xPlayer.identifier
 		},
 		function(result)
 
 			local foundVehicleId = nil
 
 			for i=1, #result, 1 do
 				
 				local vehicle = json.decode(result[i].vehicle)
 				
 				if vehicle.plate == vehicleProps.plate then
 					foundVehicleId = result[i].id
 					break
 				end
 
 			end
 
 			if foundVehicleId ~= nil then

 				MySQL.Async.execute(
 					'UPDATE owned_vehicles SET vehicle = @vehicle WHERE id = @id',
 					{
						['@vehicle'] = json.encode(vehicleProps),
						['@id']      = foundVehicleId
 					}
 				)
 
 			end
 
 		end
 	)
 
 end)


RegisterServerEvent('esx_hangard:addCarToParking')
AddEventHandler('esx_hangard:addCarToParking', function(vehicleProps)

	local xPlayer = ESX.GetPlayerFromId(source)

	if vehicleProps ~= nil then

		MySQL.Async.execute(
			'INSERT INTO `user_hangard` (`identifier`, `plate`, `vehicle`) VALUES (@identifier, @plate, @vehicle)',
			{
				['@identifier']   = xPlayer.identifier,
        ['@plate']        = vehicleProps.plate,
				['@vehicle']      = json.encode(vehicleProps)
			}, function(rowsChanged)
				TriggerClientEvent('esx:showNotification', xPlayer.source, _U('veh_stored'))
			end
		)

	end

end)

RegisterServerEvent('esx_hangard:removeCarFromParking')
AddEventHandler('esx_hangard:removeCarFromParking', function(plate)

	local xPlayer = ESX.GetPlayerFromId(source)

	if plate ~= nil then

		MySQL.Async.execute(
			'DELETE FROM `user_hangard` WHERE `identifier` = @identifier AND `plate` = @plate',
			{
				['@identifier'] = xPlayer.identifier,
        ['@plate'] = plate
			}, function(rowsChanged)
				TriggerClientEvent('esx:showNotification', xPlayer.source, _U('veh_released'))
			end
		)

	end

end)


RegisterServerEvent('esx_hangard:getCustomPlate')
AddEventHandler('esx_hangard:getCustomPlate', function(plate)

	local xPlayer = ESX.GetPlayerFromId(source)

	if plate ~= nil then

    MySQL.Async.fetchAll(
      'SELECT `plate_name` FROM custom_plate WHERE original_plate = @plate',
      {
        ['@plate'] = plate
      },
      function(result)
        return result[1].plate_name
    end)

	end

end)


ESX.RegisterServerCallback('esx_hangard:getVehiclesInGarage', function(source, cb)

	local xPlayer = ESX.GetPlayerFromId(source)

	MySQL.Async.fetchAll(
		'SELECT * FROM `user_hangard` WHERE `identifier` = @identifier',
		{
			['@identifier'] = xPlayer.identifier
		},
		function(result)

			local vehicles = {}

			for i=1, #result, 1 do
        local vehicleData = json.decode(result[i].vehicle)
        table.insert(vehicles, vehicleData)
			end

			cb(vehicles)

		end
	)

end)

--[[ runs everytime the server is restarted]]
--[[ 

  adds all user owned cars into the parking garage table so people can pull their cars out

]]