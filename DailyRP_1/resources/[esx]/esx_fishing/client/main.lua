local Keys = {
  ["ESC"] = 322, ["F1"] = 288, ["F2"] = 289, ["F3"] = 170, ["F5"] = 166, ["F6"] = 167, ["F7"] = 168, ["F8"] = 169, ["F9"] = 56, ["F10"] = 57, 
  ["~"] = 243, ["1"] = 157, ["2"] = 158, ["3"] = 160, ["4"] = 164, ["5"] = 165, ["6"] = 159, ["7"] = 161, ["8"] = 162, ["9"] = 163, ["-"] = 84, ["="] = 83, ["BACKSPACE"] = 177, 
  ["TAB"] = 37, ["Q"] = 44, ["W"] = 32, ["E"] = 38, ["R"] = 45, ["T"] = 245, ["Y"] = 246, ["U"] = 303, ["P"] = 199, ["["] = 39, ["]"] = 40, ["ENTER"] = 18,
  ["CAPS"] = 137, ["A"] = 34, ["S"] = 8, ["D"] = 9, ["F"] = 23, ["G"] = 47, ["H"] = 74, ["K"] = 311, ["L"] = 182,
  ["LEFTSHIFT"] = 21, ["Z"] = 20, ["X"] = 73, ["C"] = 26, ["V"] = 0, ["B"] = 29, ["N"] = 249, ["M"] = 244, [","] = 82, ["."] = 81,
  ["LEFTCTRL"] = 36, ["LEFTALT"] = 19, ["SPACE"] = 22, ["RIGHTCTRL"] = 70, 
  ["HOME"] = 213, ["PAGEUP"] = 10, ["PAGEDOWN"] = 11, ["DELETE"] = 178,
  ["LEFT"] = 174, ["RIGHT"] = 175, ["TOP"] = 27, ["DOWN"] = 173,
  ["NENTER"] = 201, ["N4"] = 108, ["N5"] = 60, ["N6"] = 107, ["N+"] = 96, ["N-"] = 97, ["N7"] = 117, ["N8"] = 61, ["N9"] = 118
}
ESX                    = nil
local PlayerData       = {}
local Caught_KEY       = Keys['E']
local SuccessLimit     = 0.09 -- Maxim 0.1 (high value, low success chances)
local AnimationSpeed   = 0.0015
local ShowChatMSG      = true -- or false

local IsFishing        = false
local CFish            = false
local BarAnimation     = 0
local Faketimer        = 0
local RunCodeOnly1Time = true
local PosX             = 0.5
local PosY             = 0.1
local TimerAnimation   = 0.1

Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		Citizen.Wait(0)
	end
end)

function GetCar() return GetVehiclePedIsIn(GetPlayerPed(-1), false) end


-- Init playerdata & job
RegisterNetEvent('esx:playerLoaded')
AddEventHandler('esx:playerLoaded', function(xPlayer)
  PlayerData = xPlayer
end)

RegisterNetEvent('esx:setJob')
AddEventHandler('esx:setJob', function(job)
  PlayerData.job = job
end)

-- end init playerdata & job

function GetPed() return GetPlayerPed(-1) end

function text(x,y,scale,text)
    SetTextFont(0)
    SetTextProportional(0)
    SetTextScale(scale, scale)
    SetTextColour(255,255,255,255)
    SetTextDropShadow(0,0,0,0,255)
    SetTextEdge(2, 0, 0, 0, 255)
    SetTextEntry("STRING")
    AddTextComponentString(text)
    DrawText(x, y)
end

function FishGUI(bool)
	if not bool then return end
	DrawRect(PosX,PosY+0.005,TimerAnimation,0.005,255,255,0,255)
	DrawRect(PosX,PosY,0.1,0.01,0,0,0,255)
	TimerAnimation = TimerAnimation - 0.0001025
	if BarAnimation >= SuccessLimit then
		DrawRect(PosX,PosY,BarAnimation,0.01,102,255,102,150)
	else
		DrawRect(PosX,PosY,BarAnimation,0.01,255,51,51,150)
	end
	if BarAnimation <= 0 then
		up = true
	end
	if BarAnimation >= PosY then
		up = false
	end
	if not up then
		BarAnimation = BarAnimation - AnimationSpeed
	else
		BarAnimation = BarAnimation + AnimationSpeed
	end
	text(0.4,0.05,0.35, "Ryba zaczela brac, nacisnij [E] aby zaciagnac")
end

function PlayAnim(ped,base,sub,nr,time) 
	Citizen.CreateThread(function() 
		RequestAnimDict(base) 
		while not HasAnimDictLoaded(base) do 
			Citizen.Wait(1) 
		end
		if IsEntityPlayingAnim(ped, base, sub, 3) then
			ClearPedSecondaryTask(ped) 
		else 
			for i = 1,nr do 
				TaskPlayAnim(ped, base, sub, 8.0, -8, -1, 16, 0, 0, 0, 0) 
				Citizen.Wait(time) 
			end 
		end 
	end) 
end

function AttachEntityToPed(prop,bone_ID,x,y,z,RotX,RotY,RotZ)
	BoneID = GetPedBoneIndex(GetPed(), bone_ID)
	obj = CreateObject(GetHashKey(prop),  1729.73,  6403.90,  34.56,  true,  true,  true)
	vX,vY,vZ = table.unpack(GetEntityCoords(GetPed()))
	xRot, yRot, zRot = table.unpack(GetEntityRotation(GetPed(),2))
	AttachEntityToEntity(obj,  GetPed(),  BoneID, x,y,z, RotX,RotY,RotZ,  false, false, false, false, 2, true)
	return obj
end

RegisterNetEvent('esx_fishing:startFishing')
AddEventHandler('esx_fishing:startFishing', function()
	if PlayerData.job ~= nil then
		if not IsPedInAnyVehicle(GetPed(), false) then
			if not IsPedSwimming(GetPed()) then
				if IsEntityInWater(GetPed()) then
					TriggerServerEvent('esx_fishing:removeInventoryItem','bait', 1)
					if ESX.UI.Menu.IsOpen('default', 'es_extended', 'inventory') then
						ESX.UI.Menu.Close('default', 'es_extended', 'inventory')
					end

					if ESX.UI.Menu.IsOpen('default', 'es_extended', 'inventory_item') then
						ESX.UI.Menu.Close('default', 'es_extended', 'inventory_item')
					end

					IsFishing = true
					if ShowChatMSG then ESX.ShowNotification("Zalozyles przynete, poczekaj az ryba zacznie brac ...") end
					RunCodeOnly1Time = true
					BarAnimation = 0

				else
					ESX.ShowNotification('Akcja niemozliwa, musisz byc w wodzie')
				end
			else
				ESX.ShowNotification('Akcja niemozliwa')
			end
		else
			ESX.ShowNotification('Akcja niemozliwa')
		end
	else
		ESX.ShowNotification("Musisz byc rybakiem")
	end
end)

RegisterNetEvent('esx_fishing:onEatFish')
AddEventHandler('esx_fishing:onEatFish', function()
	
	local playerPed = GetPlayerPed(-1)
	local health    = GetEntityHealth(playerPed) + 25

	SetEntityHealth(playerPed,  health)

end)

Citizen.CreateThread(function()
	while true do Citizen.Wait(1)

		while IsFishing do
			local time = 4*3000
			TaskStandStill(GetPed(), time+7000)
			FishRod = AttachEntityToPed('prop_fishing_rod_01',60309, 0,0,0, 0,0,0)
			PlayAnim(GetPed(),'amb@world_human_stand_fishing@base','base',4,3000)
			Citizen.Wait(time)
			CFish = true
			IsFishing = false
		end

		while CFish do
			Citizen.Wait(1)
			FishGUI(true)
			if RunCodeOnly1Time then
				Faketimer = 1
				PlayAnim(GetPed(),'amb@world_human_stand_fishing@idle_a','idle_c',1,0) -- 10sec
				RunCodeOnly1Time = false
			end
			if TimerAnimation <= 0 then
				CFish = false
				TimerAnimation = 0.1
				StopAnimTask(GetPed(), 'amb@world_human_stand_fishing@idle_a','idle_c',2.0)
				Citizen.Wait(200)
				DeleteEntity(FishRod)
				if ShowChatMSG then ESX.ShowNotification("Ryba uciekla...") end
			end
			if IsControlJustPressed(1, Caught_KEY) then
				if BarAnimation >= SuccessLimit then
					CFish = false
					TimerAnimation = 0.1
					if ShowChatMSG then ESX.ShowNotification("Vous avez attrapé un poisson !") end
					StopAnimTask(GetPed(), 'amb@world_human_stand_fishing@idle_a','idle_c',2.0)
					Citizen.Wait(200)
					DeleteEntity(FishRod)

					TriggerServerEvent('esx_fishing:caughtFish')

				else
					CFish = false
					TimerAnimation = 0.1
					StopAnimTask(GetPed(), 'amb@world_human_stand_fishing@idle_a','idle_c',2.0)
					Citizen.Wait(200)
					DeleteEntity(FishRod)
					if ShowChatMSG then ESX.ShowNotification("Ryba uciekla...") end
				end
			end
		end
	end
end)

Citizen.CreateThread(function() -- Thread for  timer
	while true do 
		Citizen.Wait(1000)
		Faketimer = Faketimer + 1 
	end 
end)




---- ADDED

local Locations = {

    ["Blips"] = {
        ["SellFish"] = {
            ["title"] = "Sprzedaz Ryb",
            ["sprite"] = 356,
            ["x"] =  -1845.41, ["y"] = -1196.15, ["z"] = 12.17
        }

    },

    ["Markers"] = {
        ["SellFish"] = { ["x"] = -1845.28, ["y"] = -1195.79, ["z"] = 18.33, ["Info"] = "[E] ~g~aby sprzedac rybe" },
    }
}

Citizen.CreateThread(function()

    local Blips = Locations["Blips"]

    for spot, val in pairs(Blips) do
        local BlipInformation = val
        
        local Blip = AddBlipForCoord(BlipInformation["x"], BlipInformation["y"], BlipInformation["z"])
        SetBlipSprite(Blip, BlipInformation["sprite"])
        SetBlipDisplay(Blip, 4)
        SetBlipScale(Blip, 0.8)
        SetBlipColour(Blip, 0)
        SetBlipAsShortRange(Blip, true)
        BeginTextCommandSetBlipName("STRING")
        AddTextComponentString(BlipInformation["title"])
        EndTextCommandSetBlipName(Blip)
    end

    Citizen.Wait(0)

    while true do
      
        local sleep = 500
        
        local ped = PlayerPedId()
        local coords = GetEntityCoords(ped)

        if not Fishing then

            for place, v in pairs(Locations["Markers"]) do

                local dstCheck = GetDistanceBetweenCoords(coords, v["x"], v["y"], v["z"], true)

                if dstCheck <= 5.0 then
                    sleep = 5
                    DrawM(v["Info"], 27, v["x"], v["y"], v["z"])
                    if dstCheck <= 1.5 then
                        if IsControlJustPressed(0, Keys["E"]) then
                            print(place)
                            StartAction(place)
                        end
                    end
                end
            end

        end

        Citizen.Wait(sleep)


    end
end) 

function StartAction(currentAction)
    if string.len(currentAction) >= 15 then
        StartFishing()
    elseif currentAction == "SellFish" then
        TriggerServerEvent("esx_fishing:sellFish")
    elseif currentAction == "BuyEquipment" then
        OpenFishMenu()
    end
end 

function DrawM(hint, type, x, y, z)
	ESX.Game.Utils.DrawText3D({x = x, y = y, z = z + 1.0}, hint, 0.4)
	DrawMarker(type, x, y, z, 0.0, 0.0, 0.0, 0, 0.0, 0.0, 2.0, 2.0, 2.0, 255, 255, 255, 100, false, true, 2, false, false, false, false)
end