local vehPrice = nil
local modPrice = vehPrice

Citizen.CreateThread(function()
	local blipX = 2505.325
	local blipY = 4217.261
	local blipZ = 39.926
	local loadedBlip = false

	while true do
		Citizen.Wait(0)
		local x,y,z = table.unpack(GetEntityCoords(GetPlayerPed(-1), true))
		local distance = GetDistanceBetweenCoords(2505.325, 4214.261, 38.5, x, y, z, true)
	
		--load blip
		if not loadedBlip then 
			local blipSellCar = AddBlipForCoord(blipX, blipY, blipZ)
			SetBlipSprite(blipSellCar, 227)
			SetBlipDisplay(blipSellCar, 2)
			SetBlipScale(blipSellCar, 1.0)
			SetBlipColour(blipSellCar, 1)
			SetBlipAlpha(blipSellCar, 255)
			SetBlipAsShortRange(blipSellCar, true)
			BeginTextCommandSetBlipName("String")
			AddTextComponentString("Chop Shop")
			EndTextCommandSetBlipName(blipSellCar)
			loadedBlip = true
		end
		
		--load marker if player is in vehicle
		if IsPedSittingInAnyVehicle(GetPlayerPed(-1)) then		
			local vehicle = GetVehiclePedIsIn(GetPlayerPed(-1), false)
			local class = GetVehicleClass(vehicle)
			
			TriggerServerEvent("getVehPrice", class)
			-- DrawMarker(1, 2505.325, 4214.261, 38.5, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 4.0, 4.0, 2.0, 255, 0, 0, 100, false, true, 1, false, false, false, false)
		end
		
		--vehicle health modifier
		if IsPedSittingInAnyVehicle(GetPlayerPed(-1)) and vehPrice ~= nil then
			local health = GetEntityHealth(GetVehiclePedIsIn(GetPlayerPed(-1)))
			local modifier = health/1000
			modPrice = round((modifier * vehPrice), 0)
		end
		
		--ability to sell car if in range of chop shop
		if IsPedSittingInAnyVehicle(GetPlayerPed(-1)) and distance <= 4.0 then
			ShowHelp()
			incircle = true
			if IsControlPressed(1, 38) then
				sellVehicle()
			end
		end
	end
end)

RegisterNetEvent("setVehPrice")
AddEventHandler("setVehPrice", function(price)
	vehPrice = price
end)

function ShowHelp()
    BeginTextCommandDisplayHelp("STRING")
    AddTextComponentSubstringPlayerName("Press ~INPUT_PICKUP~ to sell your vehicle for ~b~$" .. modPrice .. "~s~!")
    EndTextCommandDisplayHelp(0, false, true, -1)
end

function sellVehicle()
	if vehPrice == nil then
		TriggerEvent("chatMessage", "^2You cannot sell this car!")
	else
		local seconds = 60
		timer = seconds
		chopping = true

		Citizen.CreateThread(function()
			while timer > 0 do
				Citizen.Wait(0)
				Citizen.Wait(1000)
				if(timer > 0)then
					timer = timer - 1
				end
			end
		end)

		Citizen.CreateThread(function()
			while true do
				Citizen.Wait(0)
				if chopping then
					drawTxt(0.66, 1.44, 1.0,1.0,0.4, "Selling vehicle:" .. timer .. "seconds remaining", 255, 255, 255, 255)
				end
			end
		end)

		if chopping then
			TriggerServerEvent("sellVehicle", modPrice)
			local vehicle = SetEntityAsMissionEntity(GetVehiclePedIsIn(GetPlayerPed(-1)), true, true)
			DeleteVehicle(vehicle)
			vehPrice = nil
			chopping = false
	
		elseif not chopping then
			return
		end
	end
end

function round(num, numDecimalPlaces)
	local mult = 10^(numDecimalPlaces or 0)
	return math.floor(num * mult + 0.5) / mult
end

function drawTxt(x,y ,width,height,scale, text, r,g,b,a, outline)
    SetTextFont(0)
    SetTextProportional(0)
    SetTextScale(scale, scale)
    SetTextColour(r, g, b, a)
    SetTextDropShadow(0, 0, 0, 0,255)
    SetTextEdge(1, 0, 0, 0, 255)
    SetTextDropShadow()
	SetTextOutline()
    SetTextEntry("STRING")
    AddTextComponentString(text)
    DrawText(x - width/2, y - height/2 + 0.005)
end

Citizen.CreateThread(function()
    while true do
		local pos = GetEntityCoords(GetPlayerPed(-1), true)
		local pos2 = { ['x'] = 2505.325, ['y'] = 4214.261, ['z'] = 38.5 }

            if(Vdist(pos.x, pos.y, pos.z, pos2.x, pos2.y, pos2.z) < 15.0) then
                if not holdingup then
                    DrawMarker(1, 2505.325, 4214.261, 38.5, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 4.0, 4.0, 2.0, 255, 0, 0, 100, false, true, 1, false, false, false, false)

                    if(Vdist(pos.x, pos.y, pos.z, pos2.x, pos2.y, pos2.z) < 1.0) then
                        if (incircle == false) then
                            showhelp()
                        end
						incircle = true
					end
						
                    if(Vdist(pos.x, pos.y, pos.z, pos2.x, pos2.y, pos2.z) > 1.0) then
                        incircle = false
                        
                    end
                end
            end
        end

        if chopping then

			local pos2 = { ['x'] = 2505.325, ['y'] = 4214.261, ['z'] = 38.5}
			
            if(Vdist(pos.x, pos.y, pos.z, pos2.x, pos2.y, pos2.z) > 13) then
                chopping = false
            end
        end

    Citizen.Wait(0)
end)