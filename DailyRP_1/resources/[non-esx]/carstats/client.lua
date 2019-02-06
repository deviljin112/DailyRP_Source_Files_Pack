RegisterNetEvent('carstats');
AddEventHandler('carstats', function()
local ped = PlayerPedId()
	if IsPedInAnyVehicle(ped, false) then
		local veh = GetVehiclePedIsIn(ped, false)
		local model = GetEntityModel(veh, false)
		local hash = GetHashKey(model)
		TriggerEvent('chatMessage', "", {255, 0, 0}, "^3Nazwa:^7 ".. GetDisplayNameFromVehicleModel(model))
		TriggerEvent('chatMessage', "", {255, 0, 0}, "^3Predkosc Maksymalna (MPH):^7 ".. round(GetVehicleMaxSpeed(model) * 2.236936,1))
		TriggerEvent('chatMessage', "", {255, 0, 0}, "^3Przyspieszenie:^7 ".. round(GetVehicleModelAcceleration(model),1))
		TriggerEvent('chatMessage', "", {255, 0, 0}, "^3Ilosc Biegow:^7 ".. GetVehicleHighGear(veh))
		TriggerEvent('chatMessage', "", {255, 0, 0}, "^3Miejsc:^7 ".. GetVehicleMaxNumberOfPassengers(veh) + 1)
	end
end)

--snippet borrowed from http://lua-users.org/wiki/SimpleRound
function round(num, numDecimalPlaces)
  local mult = 100^(numDecimalPlaces or 0)
  return math.floor(num * mult + 0.5) / mult
end