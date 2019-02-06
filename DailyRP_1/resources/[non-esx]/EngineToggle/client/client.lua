-- CLIENTSIDED

-- Registers a network event
RegisterNetEvent('EngineToggle:Engine')
RegisterNetEvent('EngineToggle:RPDamage')



local vehicles = {}; RPWorking = true

Citizen.CreateThread(function()
	while true do
		Citizen.Wait(0)
		if UseKey and ToggleKey then
			if IsControlJustReleased(1, ToggleKey) then
				TriggerEvent('EngineToggle:Engine')
			end
		end
		if GetSeatPedIsTryingToEnter(GetPlayerPed(-1)) == -1 and not table.contains(vehicles, GetVehiclePedIsTryingToEnter(GetPlayerPed(-1))) then
			table.insert(vehicles, {GetVehiclePedIsTryingToEnter(GetPlayerPed(-1)), IsVehicleEngineOn(GetVehiclePedIsTryingToEnter(GetPlayerPed(-1)))})
		elseif IsPedInAnyVehicle(GetPlayerPed(-1), false) and not table.contains(vehicles, GetVehiclePedIsIn(GetPlayerPed(-1), false)) then
			table.insert(vehicles, {GetVehiclePedIsIn(GetPlayerPed(-1), false), IsVehicleEngineOn(GetVehiclePedIsIn(GetPlayerPed(-1), false))})
		end
		for i, vehicle in ipairs(vehicles) do
			if DoesEntityExist(vehicle[1]) then
				if (GetPedInVehicleSeat(vehicle[1], -1) == GetPlayerPed(-1)) or IsVehicleSeatFree(vehicle[1], -1) then
					if RPWorking then
						SetVehicleEngineOn(vehicle[1], vehicle[2], true, false)
						SetVehicleJetEngineOn(vehicle[1], vehicle[2])
						if not IsPedInAnyVehicle(GetPlayerPed(-1), false) or (IsPedInAnyVehicle(GetPlayerPed(-1), false) and vehicle[1]~= GetVehiclePedIsIn(GetPlayerPed(-1), false)) then
							if IsThisModelAHeli(GetEntityModel(vehicle[1])) or IsThisModelAPlane(GetEntityModel(vehicle[1])) then
								if vehicle[2] then
									SetHeliBladesFullSpeed(vehicle[1])
								end
							end
						end
					end
				end
			else
				table.remove(vehicles, i)
			end
		end
	end
end)

AddEventHandler('EngineToggle:Engine', function()
	local	time = 5000
	local 	displaying = true

    Citizen.CreateThread(function()
        Wait(time)
        displaying = false
    end)


	local veh
	local StateIndex
	for i, vehicle in ipairs(vehicles) do
		if vehicle[1] == GetVehiclePedIsIn(GetPlayerPed(-1), false) then
			veh = vehicle[1]
			StateIndex = i
		end
	end
	--Citizen.Wait(1500)
	if IsPedInAnyVehicle(GetPlayerPed(-1), false) then 
		if (GetPedInVehicleSeat(veh, -1) == GetPlayerPed(-1)) then
			vehicles[StateIndex][2] = not GetIsVehicleEngineRunning(veh)
			if vehicles[StateIndex][2] then
				while displaying do
					local	pos = GetEntityCoords(GetPlayerPed(-1))
					local 	heading = GetEntityHeading(GetPlayerPed(-1))
						Wait(0)
						DrawText3D(pos.x, pos.y, pos.z+1, "Silnik WLACZONY", 0, 255, 0)
				end
			elseif not vehicles[StateIndex][2] then
				while displaying do
					local	pos = GetEntityCoords(GetPlayerPed(-1))
					local 	heading = GetEntityHeading(GetPlayerPed(-1))
						Wait(0)
						DrawText3D(pos.x, pos.y, pos.z+1.2, "Silnik WYLACZONY", 255, 0, 0)
				end
			end
		end 
    end 
end)

AddEventHandler('EngineToggle:RPDamage', function(State)
	RPWorking = State
end)

if OnAtEnter then

	local	time = 5000
	local 	displaying = true

    Citizen.CreateThread(function()
        Wait(time)
        displaying = false
    end)


	Citizen.CreateThread(function()
		while true do
			Citizen.Wait(0)
			if GetSeatPedIsTryingToEnter(GetPlayerPed(-1)) == -1 then
				for i, vehicle in ipairs(vehicles) do
					if vehicle[1] == GetVehiclePedIsTryingToEnter(GetPlayerPed(-1)) and not vehicle[2] then
						Citizen.Wait(3500)
						vehicle[2] = true
							while displaying do
								local	pos = GetEntityCoords(GetPlayerPed(-1))
								local 	heading = GetEntityHeading(GetPlayerPed(-1))
									Wait(0)
									DrawText3D(pos.x, pos.y, pos.z+1, "Silnik WLACZONY", 0, 255, 0)
							end
					end
				end
			end
		end
	end)
end

function table.contains(table, element)
  for _, value in pairs(table) do
    if value[1] == element then
      return true
    end
  end
  return false
end

Citizen.CreateThread(function()
    while true do
    	Citizen.Wait(0) 
    	pos = GetEntityCoords(GetPlayerPed(-1))
        heading = GetEntityHeading(GetPlayerPed(-1))
    end
end)

function DrawText3D(x,y,z, text, r, g, b)
    local onScreen,_x,_y=World3dToScreen2d(x,y,z)
    local px,py,pz=table.unpack(GetGameplayCamCoords())
    
    SetTextScale(0.5, 0.5)
    SetTextFont(4)
    SetTextProportional(1)
    SetTextColour(r, g, b, 255)
    SetTextEntry("STRING")
    SetTextCentre(1)
    AddTextComponentString(text)
    DrawText(_x,_y)
    local factor = (string.len(text)) / 370
 end