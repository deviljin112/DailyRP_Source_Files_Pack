ESX              = nil
local lSpeed	 = 1.49

Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		Citizen.Wait(0)
	end
end)

RegisterNetEvent('esx:playerLoaded')
AddEventHandler('esx:playerLoaded', function(xPlayer)
  if Config.userSpeed == true then
  	TriggerServerEvent("esx_advanced_inventory:initSpeed")
  end
end)

RegisterNetEvent("esx_advanced_inventory:speed")
AddEventHandler("esx_advanced_inventory:speed", function(speed)
  if Config.userSpeed == true then
  	lSpeed = speed
  end
end)


--Citizen.CreateThread(function()
	--while true do
	--	Citizen.Wait(0)
	--	SetEntityMaxSpeed(GetPlayerPed(-1), speed)
	--end
--end)
