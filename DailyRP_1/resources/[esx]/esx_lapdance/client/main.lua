local Keys = {
  ["ESC"] = 322, ["F1"] = 288, ["F2"] = 289, ["F3"] = 170, ["F5"] = 166, ["F6"] = 167, ["F7"] = 168, ["F8"] = 169, ["F9"] = 56, ["F10"] = 57,
  ["~"] = 243, ["1"] = 157, ["2"] = 158, ["3"] = 160, ["4"] = 164, ["5"] = 165, ["6"] = 159, ["7"] = 161, ["8"] = 162, ["9"] = 163, ["-"] = 84, ["="] = 83, ["BACKSPACE"] = 177,
  ["TAB"] = 37, ["Q"] = 44, ["W"] = 32, ["E"] = 38, ["R"] = 45, ["T"] = 245, ["Y"] = 246, ["U"] = 303, ["P"] = 199, ["["] = 39, ["]"] = 40, ["ENTER"] = 18,
  ["CAPS"] = 137, ["A"] = 34, ["S"] = 8, ["D"] = 9, ["F"] = 23, ["G"] = 47, ["H"] = 74, ["K"] = 311, ["L"] = 182,
  ["LEFTSHIFT"] = 21, ["Z"] = 20, ["X"] = 73, ["C"] = 26, ["V"] = 0, ["B"] = 29, ["N"] = 249, ["M"] = 244, [","] = 82, ["."] = 81,
  ["LEFTCTRL"] = 36, ["LEFTALT"] = 19, ["SPACE"] = 22, ["RIGHTCTRL"] = 70,
  ["HOME"] = 213, ["PAGEUP"] = 10, ["PAGEDOWN"] = 11, ["DELETE"] = 178,
  ["LEFT"] = 174, ["RIGHT"] = 175, ["TOP"] = 27, ["DOWN"] = 173,
}
local isInLapdance = false
local isThisTrue = false

local blips = {
    
     {title="Striptease", colour=7, id=121, x = 128.87, y = -1298.93, z = 4.0};


}
 
--[[
Citizen.CreateThread(function()

    for _, info in pairs(blips) do
      info.blip = AddBlipForCoord(info.x, info.y, info.z)
      SetBlipSprite(info.blip, info.id)
      SetBlipDisplay(info.blip, 4)
      SetBlipScale(info.blip, 1.35)
      SetBlipColour(info.blip, info.colour)
      SetBlipAsShortRange(info.blip, true)
      BeginTextCommandSetBlipName("STRING")
      AddTextComponentString(info.title)
      EndTextCommandSetBlipName(info.blip)
    end
end)
]]--

Citizen.CreateThread(function()
    while true do
    
    Citizen.Wait(0)
	
		local coords = GetEntityCoords(GetPlayerPed(-1))
        if GetDistanceBetweenCoords(coords, 117.19, -1294.86, 28.42, true) < 100 then
            DrawMarker(27, 117.19, -1294.86, 28.42, 0.0, 0.0, 0.0, 0, 0.0, 0.0, 2.0, 2.0, 2.0, 100, 255, 0, 100, false, true, 2, false, false, false, false)
            if GetDistanceBetweenCoords(coords, 117.19, -1294.86, 28.42, true) < 1.5 then
            Draw3DText(117.19, -1294.86, 29.63, tostring("Wcisnij ~r~[E]~w~ aby zaplacic za taniec [1250$]"))
            if IsControlPressed(0,  Keys['E']) then
			TriggerServerEvent('esx_lapdance:Buy')
			Citizen.Wait(3000)
            end
        end
    end
    end
end) 

RegisterNetEvent('esx_lapdance:lapdance')
AddEventHandler('esx_lapdance:lapdance', function()
			RequestModel(695248020)
			while not HasModelLoaded(695248020) do
				Wait(0)
			end
			TriggerEvent("malte-cinema:activate")
			SetEntityHeading(GetPlayerPed(-1), 120.18)
			local SpawnObject = CreatePed(4, 695248020, 116.59, -1301.04, 28.17)
			RequestAnimDict("mini@strip_club@idles@stripper")
				while not HasAnimDictLoaded("mini@strip_club@idles@stripper") do
					Citizen.Wait(100)
				end
			TaskPlayAnim(SpawnObject, "mini@strip_club@idles@stripper", "stripper_idle_02", 8.0, -8.0, -1, 0, 0, false, false, false)
			isInLapdance = true
			SetEntityCoords(GetPlayerPed(-1), 116.88, -1295.04, 28.42)
			SetEntityHeading(SpawnObject, 303.19)
			FreezeEntityPosition(SpawnObject, true)
			TaskGoToCoordAnyMeans(GetPlayerPed(-1), 118.29, -1301.43, 28.42, 1.0, 0, 0, 786603, 1.0)
			Citizen.Wait(5000)
			FreezeEntityPosition(SpawnObject, false)
			TaskGoToCoordAnyMeans(SpawnObject, 118.0, -1300.3, 28.17, 174.93, 0, 0, 0, 0xbf800000)
			Citizen.Wait(2050)
			TaskGoToCoordAnyMeans(SpawnObject, 118.36, -1301.19, 28.42, 174.93, 0, 0, 0, 0xbf800000)
			Citizen.Wait(1750)
			FreezeEntityPosition(SpawnObject, true)
			SetEntityHeading(SpawnObject, 216.6)
			RequestAnimDict("mini@strip_club@private_dance@part2")
				while not HasAnimDictLoaded("mini@strip_club@private_dance@part2") do
					Citizen.Wait(100)
				end
			TaskPlayAnim(SpawnObject, "mini@strip_club@private_dance@part2", "priv_dance_p2", 8.0, -8.0, -1, 0, 0, false, false, false)
			Citizen.Wait(25000)
			Citizen.Wait(5000)
			RequestAnimDict("mini@strip_club@backroom@")
				while not HasAnimDictLoaded("mini@strip_club@backroom@") do
					Citizen.Wait(100)
				end
			TaskPlayAnim(SpawnObject, "mini@strip_club@backroom@", "stripper_b_backroom_idle_b", 8.0, -8.0, -1, 0, 0, false, false, false)
			Citizen.Wait(5000)
			FreezeEntityPosition(SpawnObject, false)
			TaskGoToCoordAnyMeans(SpawnObject, 116.59, -1301.04, 28.17, 174.93, 0, 0, 0, 0xbf800000)
			Citizen.Wait(2000)
			RequestAnimDict("mini@strip_club@idles@stripper")
				while not HasAnimDictLoaded("mini@strip_club@idles@stripper") do
					Citizen.Wait(100)
				end
			TaskPlayAnim(SpawnObject, "mini@strip_club@idles@stripper", "stripper_idle_02", 8.0, -8.0, -1, 0, 0, false, false, false)
			SetEntityHeading(SpawnObject, 308.6)
			isInLapdance = false
			Citizen.Wait(10000)
			DeleteEntity(SpawnObject)
end)

Citizen.CreateThread(function()

	while true do

	Citizen.Wait(0)
	
		if isInLapdance then
			SetFollowPedCamViewMode(4)
		else
		-- nothing
		end
	end
end)

Citizen.CreateThread(function()

	while true do

	Citizen.Wait(0)
	
		local coords = GetEntityCoords(GetPlayerPed(-1))
		if GetDistanceBetweenCoords(coords, 118.75, -1301.97, 28.42, true) < 1.5 and isInLapdance then
		
			local dict = "mini@strip_club@lap_dance_2g@ld_2g_reach"
			RequestAnimDict(dict)
				while not HasAnimDictLoaded(dict) do
					Citizen.Wait(100)
				end
			SetEntityCoords(GetPlayerPed(-1), 118.92, -1302.55, 27.87)
			FreezeEntityPosition(GetPlayerPed(-1), true)
			SetEntityHeading(GetPlayerPed(-1), 39.0)
			TaskPlayAnim(GetPlayerPed(-1), dict, "ld_2g_sit_idle", 8.0, -8.0, -1, 0, 0, false, false, false)
			repeat
			TaskPlayAnim(GetPlayerPed(-1), dict, "ld_2g_sit_idle", 8.0, -8.0, -1, 0, 0, false, false, false)
			Citizen.Wait(550)
			until(isInLapdance == false)
			FreezeEntityPosition(GetPlayerPed(-1), false)
			SetEntityCoords(GetPlayerPed(-1), 118.75, -1301.99, 28.42)
			Citizen.Wait(200)
			TaskGoToCoordAnyMeans(GetPlayerPed(-1), 117.48, -1294.82, 28.43, 1.0, 0, 0, 786603, 1.0)
			Citizen.Wait(5800)
			TriggerEvent("malte-cinema:activate")
			else
		-- nothing
		end
	end
end)

Citizen.CreateThread(function()
	while true do
		Citizen.Wait(0)
		if isInLapdance then
			DisableControlAction(2, 24, true) -- Attack
			DisableControlAction(2, 257, true) -- Attack 2
			DisableControlAction(2, 25, true) -- Aim
			DisableControlAction(2, 263, true) -- Melee Attack 1
			DisableControlAction(2, Keys['W'], true) -- Gå fram
			DisableControlAction(2, Keys['A'], true) -- Gå vänster
			DisableControlAction(2, Keys['S'], true) -- Gå bak
			DisableControlAction(2, Keys['D'], true) -- Gå höger
		else
			-- nothing
		end
	end
end)

function Draw3DText(x, y, z, text)
    local onScreen, _x, _y = World3dToScreen2d(x, y, z)
    local p = GetGameplayCamCoords()
    local distance = GetDistanceBetweenCoords(p.x, p.y, p.z, x, y, z, 1)
    local scale = (1 / distance) * 2
    local fov = (1 / GetGameplayCamFov()) * 100
    local scale = scale * fov
    if onScreen then
        SetTextScale(0.0*scale, 0.35*scale)
        SetTextFont(0)
        SetTextProportional(1)
        SetTextColour(255, 255, 255, 255)
        SetTextDropshadow(0, 0, 0, 0, 255)
        SetTextEdge(2, 0, 0, 0, 150) 
        SetTextDropShadow()
        SetTextOutline()
        SetTextEntry("STRING")
        SetTextCentre(1)
        AddTextComponentString(text)
        DrawText(_x,_y)
    end
end
