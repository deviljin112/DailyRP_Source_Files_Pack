-- CLIENTSIDE >> hypr9stun - Longer stungun.

-- Stun code

local tiempo = 20000 -- in miliseconds >> 1000 ms = 1s

Citizen.CreateThread(function()
	while true do
		Citizen.Wait(0)
		if IsPedBeingStunned(GetPlayerPed(-1)) then
		SetPedMinGroundTimeForStungun(GetPlayerPed(-1), tiempo)
		end
	end
end)