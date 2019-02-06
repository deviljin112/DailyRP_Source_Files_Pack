function OpenAccessMenu(zone, player)

	local elements = {
		{label = "Lägg till rättigheter", value = 'add_access'},
		{label = "Ta bort rättigheter", value = 'remove_access'}
	}
	ESX.UI.Menu.CloseAll()

	ESX.UI.Menu.Open(
	'default', GetCurrentResourceName(), 'access_actions',
	{
		title = "Rättigheter för " .. zone.label,
		elements = elements
	},
    function(data, menu)

		if data.current.value == 'add_access' then	
			OpenAddAccessMenu(zone)
		end

		if data.current.value == 'remove_access' then
			OpenRemoveAccessMenu(zone)
		end
	end,
	function(data, menu)
		menu.close()
	end)
end

function OpenAddAccessMenu(zone)
	ESX.TriggerServerCallback('bubba_zones:getOnlinePlayers', function(players)
		local elements = {}
		for i = 1, #players, 1 do
			local found = false
			for j = 1, #zone.accessPlayers, 1 do
				if zone.accessPlayers[j].identifier == players[i].identifier then
					found = true
				end
			end
			if players[i].identifier ~= PlayerData.identifier and not found then
				table.insert(elements, {label = players[i].name, value = {zone = zone, player = players[i]}})
			end
		end
		ESX.UI.Menu.CloseAll()

		ESX.UI.Menu.Open(
		'default', GetCurrentResourceName(), 'add_access_actions',
		{
			title = "Lägg till rättigheter för " .. zone.label,
			elements = elements
		},
		function(data, menu)
			TriggerServerEvent('bubba_zones:addZoneAccess', data.current.value.zone, data.current.value.player)
			TriggerEvent('esx:showNotification', data.current.value.player.name .. ' har tillgång till ~g~' .. data.current.value.zone.drug)
			menu.close()
		end,
		function(data, menu)
			menu.close()
		end)
	end)
end

function OpenRemoveAccessMenu(zone)
	local elements = {}
	for i = 1, #zone.accessPlayers, 1 do
		if zone.accessPlayers[i].identifier ~= PlayerData.identifier then
			table.insert(elements, {label = zone.accessPlayers[i].name, value = {zone = zone, player = zone.accessPlayers[i]}})
		end
	end
	ESX.UI.Menu.CloseAll()

	ESX.UI.Menu.Open(
	'default', GetCurrentResourceName(), 'remove_access_actions',
	{
		title = "Ta bort rättigheter för " .. zone.label,
		elements = elements
	},
	function(data, menu)
		TriggerServerEvent('bubba_zones:removeZoneAccess', data.current.value.zone, data.current.value.player)
		TriggerEvent('esx:showNotification', data.current.value.player.name .. ' har förlorat tillgång till ~r~' .. data.current.value.zone.drug)
		menu.close()
	end,
	function(data, menu)
		menu.close()
	end)
end