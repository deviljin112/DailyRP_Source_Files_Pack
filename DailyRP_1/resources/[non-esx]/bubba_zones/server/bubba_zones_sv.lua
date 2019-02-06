ZonesBeingOvertaken = {}
ESX = nil

-- For random numbers
math.randomseed(os.time())

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

function NotifyZoneOwners(zone, event)
	local players = ESX.GetPlayers()
	for i = 1, #players, 1 do
		local xPlayer = ESX.GetPlayerFromId(players[i])
		if IsOwner(zone, xPlayer) then
			TriggerClientEvent(event, players[i], zone)
		end
	end
end

ESX.RegisterServerCallback('bubba_zones:getOnlinePlayers', function(source, cb)
	local players = ESX.GetPlayers()
	local onlinePlayers  = {}

	for i=1, #players, 1 do
		local xPlayer = ESX.GetPlayerFromId(players[i])
		table.insert(onlinePlayers, {
			source     = xPlayer.source,
			identifier = xPlayer.identifier,
			name       = xPlayer.name,
			job        = xPlayer.job
		})
	end
	
	cb(onlinePlayers)
end)

RegisterServerEvent("bubba_zones:addZoneAccess")
AddEventHandler("bubba_zones:addZoneAccess", function(zone, player)
	local canAdd = true
	for j,l in pairs(UnsavedRemoveAccess) do
		if zone.label == l.zone.label then
			canAdd = false
		end
	end
	if canAdd then
		for k,v in pairs(Config.Zones) do
			if v.label == zone.label then
				table.insert(v.accessPlayers, player)
				table.insert(UnsavedAddedAccess, {zone = zone, player = player})
				local id = GetIdFromIdentifier(player)
				TriggerClientEvent('esx:showNotification', id, 'Du har nu tillgång till ~g~' .. v.drug)
				TriggerClientEvent('bubba_zones:receiveZones', id, Config.Zones)
				local players = ESX.GetPlayers()
				for i=1, #players, 1 do
					local xPlayer = ESX.GetPlayerFromId(players[i])
					if IsOwner(v, xPlayer) then
						TriggerClientEvent('bubba_zones:receiveZones', players[i], Config.Zones)
					end
				end
			end
		end
	end
end)

RegisterServerEvent("bubba_zones:removeZoneAccess")
AddEventHandler("bubba_zones:removeZoneAccess", function(zone, player)
	local canRemove = true
	for j,l in pairs(UnsavedAddedAccess) do
		if zone.label == l.zone.label then
			canRemove = false
		end
	end
	if canRemove then
		for k,v in pairs(Config.Zones) do
			if v.label == zone.label then
				for i = 1, #v.accessPlayers, 1 do
					if v.accessPlayers[i].identifier == player.identifier then
						v.accessPlayers[i] = nil
					end
				end
				table.insert(UnsavedRemoveAccess, {zone = zone, player = player})
				local id = GetIdFromIdentifier(player)
				local isOnline = false
				local players = ESX.GetPlayers()
				for i=1, #players, 1 do
					local xPlayer = ESX.GetPlayerFromId(players[i])
					if xPlayer.identifier == player.identifier then
						isOnline = true
					end
					if IsOwner(v, xPlayer) then
						TriggerClientEvent('bubba_zones:receiveZones', players[i], Config.Zones)
					end
				end
				if isOnline then
					TriggerClientEvent('esx:showNotification', id, 'Du har förlorat tillgång till ~r~' .. v.drug)
					TriggerClientEvent('bubba_zones:receiveZones', id, Config.Zones)
				end
			end
		end
	end
end)

RegisterServerEvent("bubba_zones:retrieveZones")
AddEventHandler("bubba_zones:retrieveZones", function()
	local source = source
	TriggerClientEvent('bubba_zones:receiveZones', source, Config.Zones)
end)

RegisterServerEvent('bubba_zones:isInsideZone')
AddEventHandler('bubba_zones:isInsideZone', function(player, zone)
	local isGangMember = IsGangMember(player);
	-- Check if player is allowed to overtake zone
	local isOwner = IsOwner(zone, player)
	local allowOvertake = not isOwner
	for k,v in pairs(ZonesBeingOvertaken) do
		if v.zone.label == zone.label then
			if isOwner then
				TriggerClientEvent('esx:showNotification', GetIdFromIdentifier(player), v.zone.label .. ' hindrades från ny ägare')
				for i = 1, #v.players, 1 do
					if v.players[i] ~= nil then
						TriggerClientEvent('esx:showNotification', GetIdFromIdentifier(v.players[i]), v.zone.label .. ' hindrades från ny ägare')
					end
				end
				NotifyZoneOwners(v.zone, 'bubba_zones:ownedZoneTakeoverPause')
				ZonesBeingOvertaken[k] = nil
				allowOvertake = false
			else
				local addToOvertake = false
				for i = 1, #v.players, 1 do
					if v.players[i] ~= nil then
						if isGangMember then
							if v.players[i].job.name == player.job.name then
								allowOvertake = false
								addToOvertake = true
							else
								addToOvertake = false
								allowOvertake = false
							end
						else
							addToOvertake = false
							allowOvertake = false
						end
					end
				end
				if addToOvertake then
					table.insert(v.players, player)
				else
					TriggerClientEvent('esx:showNotification', GetIdFromIdentifier(player), v.zone.label .. ' hindrades från ny ägare')
					for i = 1, #v.players, 1 do
						if v.players[i] ~= nil then
							TriggerClientEvent('esx:showNotification', GetIdFromIdentifier(v.players[i]), v.zone.label .. ' hindrades från ny ägare')
						end
					end
					NotifyZoneOwners(v.zone, 'bubba_zones:ownedZoneTakeoverPause')
					ZonesBeingOvertaken[k] = nil
				end
			end
		end
	end
	-- Just make sure we can't overtake our own zone or a zone with a cooldown
	for k,v in pairs(Config.Zones) do
		if v.label == zone.label then
			table.insert(v.insidePlayers, player)
		end
	end
end)

RegisterServerEvent('bubba_zones:isZoneTakeover')
AddEventHandler('bubba_zones:isZoneTakeover', function(zone)
	local source = source
	for k,v in pairs(ZonesBeingOvertaken) do
		if v.zone.label == zone.label then
			TriggerClientEvent('bubba_zones:ownedZoneTakeover', source, zone)
		end
	end
end)

RegisterServerEvent('bubba_zones:outOfZone')
AddEventHandler('bubba_zones:outOfZone', function(player, zone)
	for k,v in pairs(ZonesBeingOvertaken) do
		if v.zone.label == zone.label then
			if v.players ~= nil then
				for i = 1, #v.players, 1 do
					if v.players[i] ~= nil then
						if v.players[i].identifier == player.identifier then
							v.players[i] = nil
						end
					end
				end
				local firstPlayer = nil
				for i = 1, #v.players, 1 do
					if v.players[i] ~= nil then
						TriggerClientEvent('esx:showNotification', GetIdFromIdentifier(v.players[i]), v.zone.label .. ' hindrades från ny ägare')
					end
				end
				if firstPlayer == nil then
					NotifyZoneOwners(v.zone, 'bubba_zones:ownedZoneTakeoverPause')
					ZonesBeingOvertaken[k] = nil
				end
			else
				NotifyZoneOwners(v.zone, 'bubba_zones:ownedZoneTakeoverPause')
				ZonesBeingOvertaken[k] = nil
			end
		end
	end
	-- Decrement player inside zone
	for k,v in pairs(Config.Zones) do
		if zone.label == v.label then
			for j,l in pairs(v.insidePlayers) do
				if player.identifier == l.identifier then
					v.insidePlayers[j] = nil
				end
			end
		end
	end
end)

function Update()
	-- Check zones where players are currently trying to overtake
	for k,v in pairs(ZonesBeingOvertaken) do
		local numberOfPlayers = 0
		for i = 1, #v.players, 1 do
			numberOfPlayers = numberOfPlayers + 1
		end
		v.secondsPassed = v.secondsPassed + 1
		local secondsToOvertake = Config.OvertakeTime
		if v.secondsPassed >= secondsToOvertake then
			local firstPlayer = nil
			for i = 1, #v.players, 1 do
				if firstPlayer == nil then
					firstPlayer = v.players[i]
				end
			end
			for j,k in pairs(Config.Zones) do
				if v.zone.label == k.label then
					k.owner = firstPlayer
				end
			end
			for j,l in pairs(Config.Zones) do
				if v.zone.label == l.label then
					local cooldown = math.random(l.minCooldown, l.maxCooldown)
					l.cooldown = cooldown
				end
			end
			for i = 1, #v.zone.accessPlayers, 1 do
				TriggerEvent('bubba_zones:removeZoneAccess', v.zone, v.zone.accessPlayers[i])
			end
			table.insert(UnsavedZones, {zone = v.zone, player = firstPlayer})
			local players = ESX.GetPlayers()
			for i=1, #players, 1 do
				local xPlayer = ESX.GetPlayerFromId(players[i])
				TriggerClientEvent('esx:showNotification', players[i], 'Det finns en ny ägare till ~g~' .. v.zone.label)
				TriggerClientEvent('bubba_zones:receiveZones', players[i], Config.Zones)
			end
			for i = 1, #v.players, 1 do
				if v.players[i] ~= nil then
					TriggerClientEvent('esx:showNotification', GetIdFromIdentifier(v.players[i]), 'Du har nu tillgång till ~g~' .. v.zone.drug)
				end
			end
			ZonesBeingOvertaken[k] = nil
		elseif v.secondsPassed % 15 == 0 then
			for i = 1, #v.players, 1 do
				if v.players[i] ~= nil then
					TriggerClientEvent('esx:showNotification', GetIdFromIdentifier(v.players[i]), "~r~" .. secondsToOvertake - v.secondsPassed .. ' sekunder återstår')
				end
			end
		end
	end
	for k,v in pairs(Config.Zones) do
		local notOvertaken = true
		for j,l in pairs(ZonesBeingOvertaken) do
			if v.label == l.zone.label then
				notOvertaken = false
			end
		end
		if notOvertaken then
			-- Zones with cooldown need to have their cooldown decreased
			if v.cooldown ~= nil then
				v.cooldown = v.cooldown - 1
				if v.cooldown <= 0 then
					v.cooldown = nil
				end
			elseif next(v.insidePlayers) ~= nil then
				local allowOvertake = false
				local owners = {}
				local sameGang = {}
				local others = {}
				for j,l in pairs(v.insidePlayers) do
					if IsOwner(v, l) then
						table.insert(owners, l)
					elseif IsGangMember(l) then
						local isPartOfGang = true
						for a,b in pairs(sameGang) do
							if l.job.name ~= b.job.name then
								isPartOfGang = false
							end
						end
						if isPartOfGang then
							table.insert(sameGang, l)
						else
							table.insert(others, l)
						end
					else
						table.insert(others, l)
					end
				end
				local othersCount = 0
				for t,p in pairs(others) do
					othersCount = othersCount + 1
				end
				allowOvertake = next(owners) == nil and (
					(next(others) == nil and next(sameGang) ~= nil) or
					(othersCount == 1 and next(sameGang) == nil)
				)
				-- Check if zone is being overtaken
				if allowOvertake then
					NotifyZoneOwners(v, 'bubba_zones:ownedZoneTakeover')
					for j,l in pairs(v.insidePlayers) do
						TriggerClientEvent('esx:showNotification', GetIdFromIdentifier(l), 'Tar över ~h~' .. v.label)
					end
					table.insert(ZonesBeingOvertaken, { zone = v, players = v.insidePlayers, secondsPassed = 0 })
				end
			end
		end
	end
	SetTimeout(1000, Update)
end

SetTimeout(1000, Update)
SetTimeout(300000, SaveZones)