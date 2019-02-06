ESX = nil

Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		Citizen.Wait(0)
	end
end)

RegisterNetEvent('esx:playerLoaded')
AddEventHandler('esx:playerLoaded', function(xPlayer)
	PlayerData = xPlayer

	TriggerEvent('esx_gps:removeGPS')

		for i=1, #PlayerData.inventory, 1 do
			if PlayerData.inventory[i].name == 'gps' then
				if PlayerData.inventory[i].count > 0 then
					TriggerEvent('esx_gps:addGPS')
				end
			end
		end
end)


RegisterNetEvent('esx_gps:addGPS')
AddEventHandler('esx_gps:addGPS', function()
	while true do
		Citizen.Wait(0)
		
			local playerPed = GetPlayerPed(-1)
			local playerVeh = GetVehiclePedIsIn(playerPed, false)
			
			if IsPedInAnyVehicle(playerPed, true) then
				DisplayRadar(true)
			else
				DisplayRadar(false)
			end
	end
end)

RegisterNetEvent('esx_gps:removeGPS')
AddEventHandler('esx_gps:removeGPS', function()
	DisplayRadar(false)
end)