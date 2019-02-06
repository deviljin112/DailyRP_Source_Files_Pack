ESX          = nil

---------------------------------------------------------- Config ----------------------------------------------------------
----------------------------------------------------------------------------------------------------------------------------
local command = false -- false = /smutsig funkar inte, true /smutsig funkar
local isSmutsig = false -- ändra inte
local TreDMe = true -- om du har 3dme nedladdat: https://github.com/Sheamle/3dme
local debug = true -- sätt till true för debug meddelanden i F8
local duschar = { 
    ["Prysznic1"] = { ["x"] = -1382.77, ["y"] = -1328.39, ["z"] = 3.3, ["h"] = 261.38}, 
    ["Prysznic2"] = { ["x"] = -1243.76, ["y"] = -1537.76, ["z"] = 3.45, ["h"] = 260.36},
	["Kapiel1"] = { ["x"] = 254.39, ["y"] = -1000.25, ["z"] = -99.78, ["h"] = 177.36}
} 
local blips = { -- blips på mappen, för allmänna duschar
    {title="Prysznic", colour=38, id=355, x = -1382.77, y = -1328.39, z = 4.0},
	{title="Prysznic", colour=38, id=355, x = -1243.76, y = -1537.76, z = 4.0}
}
----------------------------------------------------------------------------------------------------------------------------
---------------------------------------------------------- Status ----------------------------------------------------------
local scriptStatus = false
----------------------------------------------------------------------------------------------------------------------------
-- Sätt scriptStatus till true om du vill ha att det är en status, false för att det inte ska vara en status. 
----------------------------------------------------------------------------------------------------------------------------
-- Om det är true kommer spelaren bli smutsig när statusen är över 75%, false så är det random.
----------------------------------------------------------------------------------------------------------------------------
---------------------------------------------------------- Scriptet --------------------------------------------------------

Citizen.CreateThread(function()
	while true do
		Citizen.Wait(120000)
		local smutsigRisk = math.random(100)
		if not isSmutsig and not scriptStatus and smutsigRisk <= 5 then -- 5% att man blir smutsig om man inte har esx_status på
			isSmutsig = true
			Wait(500)
			if debug then
				print('Blev smutsig random, smutsigRisk: ' .. smutsigRisk)
			end
		end
	end
end)

Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		Citizen.Wait(0)
	end
end)
  
Citizen.CreateThread(function()

    for _, info in pairs(blips) do
      info.blip = AddBlipForCoord(info.x, info.y, info.z)
      SetBlipSprite(info.blip, info.id)
      SetBlipDisplay(info.blip, 4)
      SetBlipScale(info.blip, 0.35)
      SetBlipColour(info.blip, info.colour)
      SetBlipAsShortRange(info.blip, true)
      BeginTextCommandSetBlipName("STRING")
      AddTextComponentString(info.title)
      EndTextCommandSetBlipName(info.blip)
    end
end)

Citizen.CreateThread(function()
	while true do
		Citizen.Wait(1000)
		if isSmutsig then
			TriggerServerEvent('loffe_smutsig:sync', GetPlayerServerId(PlayerId()), 'flugor')
			if TreDMe then
				TriggerServerEvent('3dme:shareDisplay', '~r~Smierdziel')
			end
			Wait(500)
		end
	end
end)

AddEventHandler('esx_status:loaded', function(status)
	if scriptStatus then
	TriggerEvent('esx_status:registerStatus', 'dirty', 0, '#593400', function(status)
		return true
	end, function(status)
		status.add(500)
	end)

	Citizen.CreateThread(function()
		while true do
			Citizen.Wait(5000)

			local playerPed  = PlayerPedId()

			TriggerEvent('esx_status:getStatus', 'dirty', function(status)
				if status.val >= 750000 then
					isSmutsig = true
				else
				Wait(500)
				end
			end)
		end
	end)
	end
end)

RegisterNetEvent('loffe_smutsig:syncFlugor')
AddEventHandler('loffe_smutsig:syncFlugor', function(ped, stop)
		local Player = ped
		local PlayerPed = GetPlayerPed(GetPlayerFromServerId(ped))

		local particleDictionary = "core"
		local particleName = "ent_amb_fly_swarm"

		RequestNamedPtfxAsset(particleDictionary)

		while not HasNamedPtfxAssetLoaded(particleDictionary) do
			Citizen.Wait(0)
		end

		SetPtfxAssetNextCall(particleDictionary)

		bone = GetPedBoneIndex(PlayerPed, 11816)

		effect = StartParticleFxLoopedOnPedBone(particleName, PlayerPed, 0.0, 0.0, -0.6, 0.0, 0.0, 20.0, bone, 2.2, false, false, false)
		Wait(25)
		effect2 = StartParticleFxLoopedOnPedBone(particleName, PlayerPed, 0.0, 0.0, -0.6, 0.0, 0.0, 20.0, bone, 2.2, false, false, false)
		Wait(25)
		effect3 = StartParticleFxLoopedOnPedBone(particleName, PlayerPed, 0.0, 0.0, -0.6, 0.0, 0.0, 20.0, bone, 2.2, false, false, false)
		Wait(25)
		effect4 = StartParticleFxLoopedOnPedBone("exp_grd_bzgas_smoke", PlayerPed, 0.0, -0.6, -0.2, 0.0, 0.0, 20.0, bone, 0.7, false, false, false)
		Wait(600)
		StopParticleFxLooped(effect, 0)
		Wait(25)
		StopParticleFxLooped(effect2, 0)
		Wait(25)
		StopParticleFxLooped(effect3, 0)
		Wait(25)
		StopParticleFxLooped(effect4, 0)
end)

Citizen.CreateThread(function()
	while true do
      
	Citizen.Wait(5)
      
		local coords = GetEntityCoords(GetPlayerPed(-1))
		for k, v in pairs(duschar) do
			if GetDistanceBetweenCoords(coords, v["x"], v["y"], v["z"], true) < 100 then
				DrawMarker(27, v["x"], v["y"], v["z"], 0.0, 0.0, 0.0, 0, 0.0, 0.0, 2.0, 2.0, 2.0, 255, 0, 0, 100, false, true, 2, false, false, false, false)
				if GetDistanceBetweenCoords(coords, v["x"], v["y"], v["z"], true) < 1.5 then
					DrawText3D(v["x"], v["y"], v["z"]+0.9, '~g~[E] ~w~Prysznic', 0.80)
					if IsControlPressed(0, 38) then
						isSmutsig = false
						local hashSkin = GetHashKey("mp_m_freemode_01") 	
						SetEntityCoords(GetPlayerPed(-1), v["x"], v["y"], v["z"])
						SetEntityHeading(GetPlayerPed(-1), v["h"])
						FreezeEntityPosition(GetPlayerPed(-1), true)
						if GetEntityModel(GetPlayerPed(-1)) == hashSkin then -- kille
							if debu then
								print("kille")
							end
							TriggerEvent('skinchanger:getSkin', function(skin)
								local clothesSkin = {
								['tshirt_1'] = 15, ['tshirt_2'] = 0,
								['torso_1'] = 15, ['torso_2'] = 0,
								['arms'] = 15,
								['pants_1'] = 61, ['pants_2'] = 5,
								['shoes_1'] = 34, ['shoes_2'] = 0,
							}
							TriggerEvent('skinchanger:loadClothes', skin, clothesSkin)

						end)
						else
							if debug then
								print("tjej")
							end
							TriggerEvent('skinchanger:getSkin', function(skin)
								local clothesSkin = {
								['tshirt_1'] = 15, ['tshirt_2'] = 0,
								['torso_1'] = 15, ['torso_2'] = 0,
								['arms'] = 15,
								['pants_1'] = 15, ['pants_2'] = 0,
								['shoes_1'] = 35, ['shoes_2'] = 0,
							}
							TriggerEvent('skinchanger:loadClothes', skin, clothesSkin)

							end)
						end
						Citizen.Wait(500)
						TriggerServerEvent('loffe_smutsig:sync', GetPlayerServerId(PlayerId()), 'vatten', v["x"], v["y"], v["z"])
						Citizen.Wait(2500)
						if scriptStatus then
							TriggerEvent('esx_status:set', 'dirty', 0)
						end
						Citizen.Wait(1000)
						TriggerServerEvent('loffe_smutsig:sync', GetPlayerServerId(PlayerId()), 'flugor')
						Citizen.Wait(6500)
						FreezeEntityPosition(GetPlayerPed(-1), false)
					end
				end
			end
		end
	end
end)

RegisterNetEvent('loffe_smutsig:syncVatten')
AddEventHandler('loffe_smutsig:syncVatten', function(ped, x, y, z)
		if debug then
			print("vatten")
		end
		local Player = ped
		local PlayerPed = GetPlayerPed(GetPlayerFromServerId(ped))

		local particleDictionary = "core"
		local particleName = "exp_sht_steam"
		local animDictionary = 'mp_safehouseshower@male@'
		local animDictionary2 = 'mp_safehouseshower@female@'
		local animName = 'male_shower_idle_b'
		local animName2 = 'shower_idle_b'
		
		RequestAnimDict(animDictionary)

		while not HasAnimDictLoaded(animDictionary) do
			Citizen.Wait(0)
		end
		
		local hashSkin = GetHashKey("mp_m_freemode_01") 
				
		RequestAnimDict(animDictionary2)

		while not HasAnimDictLoaded(animDictionary2) do
			Citizen.Wait(0)
		end		
		TaskPlayAnim(PlayerPed, animDictionary, animName, 8.0, -8.0, -1, 0, 0, false, false, false)
		
		RequestNamedPtfxAsset(particleDictionary)

		while not HasNamedPtfxAssetLoaded(particleDictionary) do
			Citizen.Wait(0)
		end

		SetPtfxAssetNextCall(particleDictionary)
		
		local coords = GetEntityCoords(playerPed)
		local effect = StartParticleFxLoopedAtCoord(particleName, x, y, z+2.6, 0.0, 180.0, 0.0, 5.0, false, false, false, false)
		Wait(25)
		Wait(10000)
		DeleteEntity(prop)
		while not DoesParticleFxLoopedExist(effect) do
		Wait(5)
		end
		StopParticleFxLooped(effect, 0)
		Wait(25)
		StopParticleFxLooped(effect, 0)
		ClearPedTasks(PlayerPed)
		ESX.TriggerServerCallback('esx_skin:getPlayerSkin', function(skin)
		TriggerEvent('skinchanger:loadSkin', skin)
		Wait(25)
		StopParticleFxLooped(effect, 0)
		end)
		SetPedWetnessHeight(PlayerPed, 1.0)
end)

RegisterCommand("smutsig", function(source)  
	if command then
		if scriptStatus then
			TriggerEvent('esx_status:set', 'dirty', 750000)
			TriggerEvent("pNotify:SendNotification",{
				text = ('Wszyscy na okolo wiedza ze smierdzisz!'),
				type = "warning",
				timeout = (5000),
				layout = "bottomCenter",
				queue = "global"
			})
		else
			isSmutsig = not isSmutsig
		end
	else
		TriggerEvent("pNotify:SendNotification",{
			text = ('Nie mozesz sie ubrudzic komenda!'),
			type = "error",
			timeout = (5000),
			layout = "bottomCenter",
			queue = "global"
		})
	end
end, false)

function DrawText3D(x, y, z, text, scale)
    local onScreen, _x, _y = World3dToScreen2d(x, y, z)
    local pX, pY, pZ = table.unpack(GetGameplayCamCoords())
 
    SetTextScale(scale, scale)
    SetTextFont(4)
    SetTextProportional(1)
    SetTextEntry("STRING")
    SetTextCentre(1)
    SetTextColour(255, 255, 255, 215)
 
    AddTextComponentString(text)
    DrawText(_x, _y)
 
    local factor = (string.len(text)) / 230
    DrawRect(_x, _y + 0.0250, 0.095 + factor, 0.06, 41, 11, 41, 100)
end
