local input = {["E"] = 38,["DOWN"] = 173,["TOP"] = 27,["NENTER"] =  201}
ESX                           = nil
local PlayerData                = {}



Citizen.CreateThread(function()
  while ESX == nil do
    TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
    Citizen.Wait(1)
  end
end)

RegisterNetEvent('esx:playerLoaded')
AddEventHandler('esx:playerLoaded', function(xPlayer)
  	PlayerData = xPlayer
end)

RegisterNetEvent('esx:setJob')
AddEventHandler('esx:setJob', function(job)
	PlayerData.job = job
end)

RegisterNetEvent('errormessage')
	AddEventHandler('errormessage', function()
	PlaySound(-1, "CHECKPOINT_MISSED", "HUD_MINI_GAME_SOUNDSET", 0, 0, 1)
end)


RegisterNetEvent('spinit')
AddEventHandler('spinit', function()
	PlaySound(-1, "Apt_Style_Purchase", "DLC_APT_Apartment_SoundSet", 0, 0, 1)
	
	SendNUIMessage({
				canspin = true
			})
	Citizen.Wait(100)
	
		SendNUIMessage({
				canspin = false
			})

end)


RegisterNUICallback('close', function(data, cb)

	SetNuiFocus(false, false)
	SendNUIMessage({
		show = false
	})
	cb("ok")
	PlaySound(-1, "Apt_Style_Purchase", "DLC_APT_Apartment_SoundSet", 0, 0, 1)
end)


Citizen.CreateThread(function()

SetNuiFocus(false, false)
end)



RegisterNUICallback('payforplayer', function(winnings, cb)
	PlaySound(-1, "ROBBERY_MONEY_TOTAL", "HUD_FRONTEND_CUSTOM_SOUNDSET", 1)
	TriggerServerEvent('payforplayer',winnings)
end)

RegisterNUICallback('playerpays', function(bet, cb)
	TriggerServerEvent('playerpays',bet)
end)

local moneymachine_slot = {
	{ ['x'] = -1669.9306640625, ['y'] = -1053.84069824219, ['z'] = 13.1539430618286 },
	{ ['x'] = -1688.43811035156, ['y'] = -1073.62536621094, ['z'] = 13.1521873474121 },
}



Citizen.CreateThread(function()
	while true do
		Citizen.Wait(1)
		local pos = GetEntityCoords(GetPlayerPed(-1), false)
		for k,v in ipairs(moneymachine_slot) do
			if(Vdist(v.x, v.y, v.z, pos.x, pos.y, pos.z) < 20.0)then
				DrawMarker(1, v.x, v.y, v.z - 1, 0, 0, 0, 0, 0, 0, 1.0001, 1.0001, 1.5001, 0, 25, 165, 165, 0,0, 0,0)
				if(Vdist(v.x, v.y, v.z, pos.x, pos.y, pos.z) < 1.0)then
						DisplayHelpText("Press ~INPUT_CONTEXT~~y~ to play")
					if IsControlJustPressed(1,input["E"]) then
							SendNUIMessage({
								show = true
							})
								SetNuiFocus(true,true)
								PlaySound(-1, "Apt_Style_Purchase", "DLC_APT_Apartment_SoundSet", 0, 0, 1)
					end
				end
			end
		end
	end
end)

function DisplayHelpText(str)
	SetTextComponentFormat("STRING")
	AddTextComponentString(str)
	DisplayHelpTextFromStringLabel(0, 0, 1, -1)
end


Citizen.CreateThread(function()
  for k,v in ipairs(moneymachine_slot)do
    local blip = AddBlipForCoord(v.x, v.y, v.z)
    SetBlipSprite(blip, 500)
    SetBlipScale(blip, 0.8)
    SetBlipColour(blip, 5)
    SetBlipDisplay(blip, 4)
    SetBlipAsShortRange(blip, true)
    BeginTextCommandSetBlipName("STRING")
    AddTextComponentString("Roulette")
    EndTextCommandSetBlipName(blip)
  end
end)