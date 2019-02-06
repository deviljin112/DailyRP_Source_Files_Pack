UnsavedZones = {}
UnsavedAddedAccess = {}
UnsavedRemoveAccess = {}

MySQL.ready(function()
	-- Load zones from database
	local resultZones = MySQL.Sync.fetchAll('SELECT * FROM `zoneowners`')
	for i=1, #resultZones, 1 do
		for k,v in pairs(Config.Zones) do
			if resultZones[i].label == v.label then
				local xPlayer = GetAnyPlayerFromIdentifier(resultZones[i].identifier)
				v.owner = xPlayer
				v.cooldown = resultZones[i].cooldown
				local resultAccess = MySQL.Sync.fetchAll('SELECT * FROM `zoneaccess` WHERE `label` = @label', {
					['@label'] = v.label
				})
				for j=1, #resultAccess, 1 do
					local xPlayer = GetAnyPlayerFromIdentifier(resultAccess[j].identifier)
					table.insert(v.accessPlayers, xPlayer)
				end
			end
		end
	end
end)

function GetAnyPlayerFromIdentifier(identifier)
	local player = ESX.GetPlayerFromIdentifier(identifier)
	if player == nil then
		local newPlayer = {}
		newPlayer['identifier'] = identifier
		local resultPlayer = MySQL.Sync.fetchAll('SELECT * FROM `users` WHERE `identifier`=@playerIdentifier', {
			['@playerIdentifier'] = identifier
		})
		if next(resultPlayer) then
			for k,v in pairs(resultPlayer) do
				if IsGangMember(v) then
					local resultJob = MySQL.Sync.fetchAll('SELECT * FROM `jobs` WHERE `name` = @name', {
						['@name'] = v.job
					})
					for j,l in pairs(resultJob) do
						v.job = l
					end
				end
				player = CreateWrappedPlayer(identifier, v.job, v.name, v.loadout, v.position)
			end
		end
	end
	return player
end

function SaveZones()
	for k,v in pairs(UnsavedZones) do
		local resultZones = MySQL.Sync.fetchAll('SELECT * FROM `zoneowners` WHERE `label`=@zoneLabel', {
			['@zoneLabel'] =  v.zone.label
		})
		if next(resultZones) ~= nil then
			MySQL.Sync.execute("UPDATE `zoneowners` SET `identifier`=@zoneOwner, `cooldown`=@zoneCooldown WHERE `label`=@zoneLabel", {
				['@zoneOwner'] = v.player.identifier,
				['@zoneLabel'] = v.zone.label,
				['@zoneCooldown'] = v.zone.cooldown
			})
		else
			MySQL.Sync.execute("INSERT INTO `zoneowners`(`label`, `identifier`, `cooldown`) VALUES (@zoneLabel, @zoneOwner, @zoneCooldown)", {
				['@zoneOwner'] = v.player.identifier,
				['@zoneLabel'] = v.zone.label,
				['@zoneCooldown'] = v.zone.cooldown
			})
		end
		print("Saved zone: " .. v.zone.label)
		UnsavedZones[k] = nil
	end
	for k,v in pairs(UnsavedAddedAccess) do
		MySQL.Sync.execute("INSERT INTO `zoneaccess`(`label`, `identifier`) VALUES (@zoneLabel, @player)", {
			['@player'] = v.player.identifier,
			['@zoneLabel'] = v.zone.label
		})
		print("Saved zone access: " .. v.zone.label)
		UnsavedAddedAccess[k] = nil
	end
	for k,v in pairs(UnsavedRemoveAccess) do
		MySQL.Sync.execute("DELETE FROM `zoneaccess` WHERE `label` = @zoneLabel AND `identifier` = @player", {
			['@player'] = v.player.identifier,
			['@zoneLabel'] = v.zone.label
		})
		print("Removed zone access: " .. v.zone.label)
		UnsavedRemoveAccess[k] = nil
	end
	for k,v in pairs(Config.Zones) do
		if v.cooldown ~= nil and v.cooldown > 0 then
			MySQL.Sync.execute("UPDATE `zoneowners` SET `cooldown`=@zoneCooldown WHERE `label`=@zoneLabel", {
				['@zoneLabel'] = v.label,
				['@zoneCooldown'] = v.cooldown
			})
			print("Saved zone cooldown: " .. v.label)
		end
	end
	SetTimeout(300000, SaveZones)
end
