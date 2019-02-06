ESX               = nil

Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		Citizen.Wait(0)
	end
end)

RegisterNetEvent('esx:playerLoaded')
AddEventHandler('esx:playerLoaded', function(xPlayer)
  PlayerData = xPlayer
end)

-----

RegisterNetEvent('esx_lockpick:startLockpick')
AddEventHandler('esx_lockpick:startLockpick', function(source)
	LockPick()
end)

function LockPick()
    local playerPed = GetPlayerPed(-1)
    local coords    = GetEntityCoords(playerPed)
    local vehicle   = GetClosestVehicle(coords.x,  coords.y,  coords.z,  3.0,  0,  71)
	
        if DoesEntityExist(vehicle) then
            local playerPed = GetPlayerPed(-1)
            local coords    = GetEntityCoords(playerPed)

                if IsAnyVehicleNearPoint(coords.x, coords.y, coords.z, 3.0) then
                  local vehicle = GetClosestVehicle(coords.x,  coords.y,  coords.z,  3.0,  0,  71)

                  if DoesEntityExist(vehicle) then
                    Citizen.CreateThread(function()

		      ESX.UI.Menu.CloseAll()
                      TaskStartScenarioInPlace(playerPed, "WORLD_HUMAN_WELDING", 0, true)

                      		Wait(20000) -- 10 seconds, change in milliseconds if wanted
					  
					  ESX.TriggerServerCallback('esx_lockpick:hasSucceeded', function(succeeded)
						if succeeded then
					  
						ClearPedTasksImmediately(playerPed)

						SetVehicleDoorsLocked(vehicle, 1)
						SetVehicleDoorsLockedForAllPlayers(vehicle, false)
						ESX.ShowNotification('~g~ Zamek sforsofany') -- Vehicle Unlocked
						
						
						else
						ClearPedTasksImmediately(playerPed)
						ESX.ShowNotification('~r~Nie udało się otworzyć pojazdu') -- Lockpick broke
						end
					end)
				end)
			end
		end
	end
end
