ESX               = nil
local playerCars = {}

Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		Citizen.Wait(0)
	end
end)

-- 
function OpenCloseVehicle()
	local playerPed = GetPlayerPed(-1)
	local coords    = GetEntityCoords(playerPed)

	local vehicle = nil

	if IsPedInAnyVehicle(playerPed,  false) then
		vehicle = GetVehiclePedIsIn(playerPed, false)
	else
		vehicle = GetClosestVehicle(coords.x, coords.y, coords.z, 12.0, 0, 90)
	end

	ESX.TriggerServerCallback('esx_vehiclelock:requestPlayerCars', function(isOwnedVehicle)

		if isOwnedVehicle then
			local locked = GetVehicleDoorLockStatus(vehicle)
			if locked == 1 then -- if unlocked
				SetVehicleDoorsLocked(vehicle, 2)
				PlayVehicleDoorCloseSound(vehicle, 1)
				ESX.ShowNotification("pojazd zamkniety.")
			elseif locked == 2 then -- if locked
				SetVehicleDoorsLocked(vehicle, 1)
				PlayVehicleDoorOpenSound(vehicle, 0)
				ESX.ShowNotification("pojazd otwarty.")
			end
		else
			ESX.ShowNotification("~r~Nie masz pojazdu w okolicy.")
		end
	end, GetVehicleNumberPlateText(vehicle))
end

Citizen.CreateThread(function()
	while true do
		Wait(0)
		if IsControlJustReleased(0, 311) then
			OpenCloseVehicle()
		end
	end
end)