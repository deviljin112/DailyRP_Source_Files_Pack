RegisterServerEvent('eden_garage:debug')
RegisterServerEvent('eden_garage:modifystate')
RegisterServerEvent('eden_garage:pay')
RegisterServerEvent('eden_garage:payhealth')
RegisterServerEvent('eden_garage:logging')


ESX                = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)


-- Recover vehicles
ESX.RegisterServerCallback('eden_garage:getVehicles', function(source, cb)
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)
	local vehicules = {}

	MySQL.Async.fetchAll("SELECT * FROM owned_vehicles WHERE owner=@identifier",{['@identifier'] = xPlayer.getIdentifier()}, function(data) 
		for _,v in pairs(data) do
			local vehicle = json.decode(v.vehicle)
			table.insert(vehicules, {vehicle = vehicle, state = v.state})
		end
		cb(vehicules)
	end)
end)
-- End Recover vehicles

-- Stock vehicles
ESX.RegisterServerCallback('eden_garage:stockv',function(source,cb, vehicleProps)
	local isFound = false
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)
	local vehicules = getPlayerVehicles(xPlayer.getIdentifier())
	local plate = vehicleProps.plate
	print(plate)
	
		for _,v in pairs(vehicules) do
			if(plate == v.plate)then
				local idveh = v.id
				local vehprop = json.encode(vehicleProps)
				MySQL.Sync.execute("UPDATE owned_vehicles SET vehicle =@vehprop WHERE id=@id",{['@vehprop'] = vehprop, ['@id'] = v.id})
				isFound = true
				break
			end		
		end
		cb(isFound)
end)


-- End Stock vehicles

-- Change the state of the vehicle

AddEventHandler('eden_garage:modifystate', function(vehicleProps, state)
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)
	local vehicules = getPlayerVehicles(xPlayer.getIdentifier())
	local plate = vehicleProps.plate
	local state = state

	for _,v in pairs(vehicules) do
		if(plate == v.plate)then
			local idveh = v.id
			MySQL.Sync.execute("UPDATE owned_vehicles SET state =@state WHERE id=@id",{['@state'] = state , ['@id'] = v.id})
			break
		end		
	end
end)	

-- Get user properties
ESX.RegisterServerCallback('eden_garage:getOwnedProperties',function(source, cb)	
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)
	local properties = {}

	MySQL.Async.fetchAll("SET @ownedProperties = (SELECT name FROM owned_properties WHERE owner=@identifier);SET @gateways = (SELECT gateway FROM properties WHERE name = @ownedProperties AND gateway IS NOT NULL);SELECT name FROM properties WHERE name = @ownedProperties AND gateway = @gateways OR name = @gateways AND gateway IS NULL OR name = @ownedProperties AND gateway IS NULL;",{['@identifier'] = xPlayer.getIdentifier()}, function(data) 
		for _,v in pairs(data) do
			table.insert(properties, v.name)
		end
		cb(properties)
	end)
end)

-- End Change the state of the vehicle

-- Function that recovers the plates

-- End Function that recovers the plates

ESX.RegisterServerCallback('eden_garage:getOutVehicles',function(source, cb)	
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)
	local vehicules = {}

	MySQL.Async.fetchAll("SELECT * FROM owned_vehicles WHERE owner=@identifier AND state=false",{['@identifier'] = xPlayer.getIdentifier()}, function(data) 
		for _,v in pairs(data) do
			local vehicle = json.decode(v.vehicle)
			table.insert(vehicules, vehicle)
		end
		cb(vehicules)
	end)
end)

-- Functions that check the money
ESX.RegisterServerCallback('eden_garage:checkMoney', function(source, cb)

	local xPlayer = ESX.GetPlayerFromId(source)

	if xPlayer.get('money') >= Config.Price then
		cb(true)
	else
		cb(false)
	end

end)
-- End Functions that check the money

-- Function that withdraws money

AddEventHandler('eden_garage:pay', function()

	local xPlayer = ESX.GetPlayerFromId(source)

	xPlayer.removeMoney(Config.Price)

	TriggerClientEvent('esx:showNotification', source, _U('you_paid')..' ' .. Config.Price)

end)
-- End function that withdraws money

-- Recover vehicles
function getPlayerVehicles(identifier)
	
	local vehicles = {}
	local data = MySQL.Sync.fetchAll("SELECT * FROM owned_vehicles WHERE owner=@identifier",{['@identifier'] = identifier})	
	for _,v in pairs(data) do
		local vehicle = json.decode(v.vehicle)
		table.insert(vehicles, {id = v.id, plate = vehicle.plate})
	end
	return vehicles
end
-- End Recover vehicles

-- Debug
AddEventHandler('eden_garage:debug', function(var)
	print(to_string(var))
end)

function table_print (tt, indent, done)
  done = done or {}
  indent = indent or 0
  if type(tt) == "table" then
    local sb = {}
    for key, value in pairs (tt) do
      table.insert(sb, string.rep (" ", indent)) -- indent it
      if type (value) == "table" and not done [value] then
        done [value] = true
        table.insert(sb, "{\n");
        table.insert(sb, table_print (value, indent + 2, done))
        table.insert(sb, string.rep (" ", indent)) -- indent it
        table.insert(sb, "}\n");
      elseif "number" == type(key) then
        table.insert(sb, string.format("\"%s\"\n", tostring(value)))
      else
        table.insert(sb, string.format(
            "%s = \"%s\"\n", tostring (key), tostring(value)))
       end
    end
    return table.concat(sb)
  else
    return tt .. "\n"
  end
end

function to_string( tbl )
    if  "nil"       == type( tbl ) then
        return tostring(nil)
    elseif  "table" == type( tbl ) then
        return table_print(tbl)
    elseif  "string" == type( tbl ) then
        return tbl
    else
        return tostring(tbl)
    end
end
-- End Debug

-- Function that changes the states released in return during a restart
AddEventHandler('onMySQLReady', function()

	MySQL.Sync.execute("UPDATE owned_vehicles SET state=true WHERE state=false", {})

end)
-- End Function that changes the states released in return during a rest

-- Start of payment for health vehicle
AddEventHandler('eden_garage:payhealth', function(price)

	local xPlayer = ESX.GetPlayerFromId(source)

	xPlayer.removeMoney(price)

	TriggerClientEvent('esx:showNotification', source, _U('you_paid')..' ' .. price)

end)
-- End of payment for health vehicle


-- Start of logger in the console
AddEventHandler('eden_garage:logging', function(logging)
	RconPrint(logging)
end)

-- End of logger in the console
