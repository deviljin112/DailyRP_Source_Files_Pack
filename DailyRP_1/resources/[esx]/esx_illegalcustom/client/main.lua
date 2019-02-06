ESX = nil
local Vehicles = {}
local PlayerData                = {}

Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		Citizen.Wait(0)
	end
end)

local lsMenuIsShowed = false
local isInLSMarker	 = false
local myCar 		 = {}

RegisterNetEvent('esx:playerLoaded')
AddEventHandler('esx:playerLoaded', function(xPlayer)
  	PlayerData = xPlayer
	ESX.TriggerServerCallback('esx_illegalcustom:getVehiclesPrices', function(vehicles)
		Vehicles = vehicles
	end)
end)

RegisterNetEvent('esx_illegalcustom:installMod')
AddEventHandler('esx_illegalcustom:installMod', function()
	--Citizen.Trace('installMod')
	local vehicle = GetVehiclePedIsIn(GetPlayerPed(-1), false)
	myCar = ESX.Game.GetVehicleProperties(vehicle)
	TriggerServerEvent('esx_illegalcustom:refreshOwnedVehicle', myCar)
end)

RegisterNetEvent('esx_illegalcustom:cancelInstallMod')
AddEventHandler('esx_illegalcustom:cancelInstallMod', function()
	--Citizen.Trace('cancelInstallMod')
	--Citizen.Trace('myCar: ' .. json.encode(myCar))

	local vehicle = GetVehiclePedIsIn(GetPlayerPed(-1), false)
	ESX.Game.SetVehicleProperties(vehicle, myCar)
end)

function OpenLSMenu(elems, menuname, menutitle, parent)

	ESX.UI.Menu.Open(
		'default', GetCurrentResourceName(), menuname,
		{
			title = menutitle,
			align = 'top-left',
			elements = elems
		},
		function(data, menu) -- on validate
			local isRimMod = false
			if data.current.modType == "modFrontWheels" then
				isRimMod = true
			end
			local vehicle = GetVehiclePedIsIn(GetPlayerPed(-1), false)			
			local found = false
			for k,v in pairs(Config.Menus) do
				if k == data.current.modType or isRimMod then
					if data.current.label == _U('by_default') or string.match(data.current.label, _U('installed')) then
						ESX.ShowNotification(_U('already_own') .. data.current.label)
						TriggerEvent('esx_illegalcustom:installMod')
					else
						local vehiclePrice = 0

						for i=1, #Vehicles, 1 do
							if GetEntityModel(vehicle) == GetHashKey(Vehicles[i].model) then
								vehiclePrice = Vehicles[i].price
								break
							end
						end

						if isRimMod then
							price = math.floor(vehiclePrice * data.current.price / 100)
							TriggerServerEvent("esx_illegalcustom:buyMod", price)
						elseif v.modType == 11 or v.modType == 12 or v.modType == 13 or v.modType == 15 or v.modType == 16 then
							price = math.floor(vehiclePrice * v.price[data.current.modNum + 1] / 100)
							TriggerServerEvent("esx_illegalcustom:buyMod", price)
						elseif v.modType == 17 then
							price = math.floor(vehiclePrice * v.price[1] / 100)
							TriggerServerEvent("esx_illegalcustom:buyMod", price)
						else
							price = math.floor(vehiclePrice * v.price / 100)
							TriggerServerEvent("esx_illegalcustom:buyMod", price)
						end

					end
					menu.close()
					found = true
					break
				end
			end
			if not found then
				GetAction(data.current)
			end
		end,
		function(data, menu) -- on cancel
			menu.close()
			TriggerEvent('esx_illegalcustom:cancelInstallMod')

			local playerPed = GetPlayerPed(-1)
			local vehicle = GetVehiclePedIsIn(playerPed, false)

			SetVehicleDoorsShut(vehicle, false)

			if parent == nil then
				lsMenuIsShowed = false
				local vehicle = GetVehiclePedIsIn(GetPlayerPed(-1), false)
				FreezeEntityPosition(vehicle, false)
				myCar = {}
			end
		end,
		function(data, menu) -- on change
			UpdateMods(data.current)
		end
	)
end

function GetAction(data)
	local elements  = {}
	local menuname  = ''
	local menutitle = ''
	local parent    = nil

	local playerPed = GetPlayerPed(-1)
	local vehicle = GetVehiclePedIsIn(playerPed, false)
	local currentMods = ESX.Game.GetVehicleProperties(vehicle)

	if data.value == 'modSpeakers' or
		data.value == 'modTrunk' or
		data.value == 'modHydrolic' or
		data.value == 'modEngineBlock' or
		data.value == 'modAirFilter' or
		data.value == 'modStruts' or
		data.value == 'modTank' then
		SetVehicleDoorOpen(vehicle, 4, false)
		SetVehicleDoorOpen(vehicle, 5, false)
	elseif data.value == 'modDoorSpeaker' then
		SetVehicleDoorOpen(vehicle, 0, false)
		SetVehicleDoorOpen(vehicle, 1, false)
		SetVehicleDoorOpen(vehicle, 2, false)
		SetVehicleDoorOpen(vehicle, 3, false)
	else
		SetVehicleDoorsShut(vehicle, false)
	end

	local vehiclePrice = 0

	for i=1, #Vehicles, 1 do
		if GetEntityModel(vehicle) == GetHashKey(Vehicles[i].model) then
			vehiclePrice = Vehicles[i].price
			break
		end
	end

	for k,v in pairs(Config.Menus) do

		if data.value == k then

			menuname  = k
			menutitle = v.label
			parent    = v.parent

			if v.modType ~= nil then
				
				if v.modType == 16 then
					local modCount = GetNumVehicleMods(vehicle, v.modType) -- UPGRADES
					for j = 0, modCount, 1 do
						local _label = ''
						if j == currentMods[k] then
							_label = 'Niveau ' .. j+1 .. ' - <span style="color:cornflowerblue;">'.. _U('installed') ..'</span>'
						else
							price = math.floor(vehiclePrice * v.price[j+1] / 100)
							_label = 'Niveau ' .. j+1 .. ' - <span style="color:green;">$' .. price .. ' </span>'
						end
						table.insert(elements, {label = _label, modType = k, modNum = j})
						if j == modCount-1 then
							break
						end
					end
				elseif v.modType == 17 then -- TURBO
					local _label = ''
					if currentMods[k] then
						_label = 'Turbo - <span style="color:cornflowerblue;">'.. _U('installed') ..'</span>'
					else
						_label = 'Turbo - <span style="color:green;">$' .. math.floor(vehiclePrice * v.price[1] / 100) .. ' </span>'
					end
					table.insert(elements, {label = _label, modType = k, modNum = true})
				end
			else
				-- if data.value == 'primaryRespray' or data.value == 'secondaryRespray' or data.value == 'pearlescentRespray' or data.value == 'modFrontWheelsColor' then
					-- for i=1, #Config.Colors, 1 do
						-- if data.value == 'primaryRespray' then
							-- table.insert(elements, {label = Config.Colors[i].label, value = 'color1', color = Config.Colors[i].value})
						-- elseif data.value == 'secondaryRespray' then
							-- table.insert(elements, {label = Config.Colors[i].label, value = 'color2', color = Config.Colors[i].value})
						-- elseif data.value == 'pearlescentRespray' then
							-- table.insert(elements, {label = Config.Colors[i].label, value = 'pearlescentColor', color = Config.Colors[i].value})						
						-- elseif data.value == 'modFrontWheelsColor' then
							-- table.insert(elements, {label = Config.Colors[i].label, value = 'wheelColor', color = Config.Colors[i].value})
						-- end
					-- end
				-- else
					for l,w in pairs(v) do
						if l ~= 'label' and l ~= 'parent' then
							table.insert(elements, {label = w, value = l})
						end
					end
				-- end
			end
			break
		end
	end

	table.sort(elements, function(a, b)
		return a.label < b.label
	end)

	OpenLSMenu(elements, menuname, menutitle, parent)
end

-- Blips
-- Citizen.CreateThread(function()

	-- for k,v in pairs(Config.Zones)do
		-- local blip = AddBlipForCoord(v.Pos.x, v.Pos.y, v.Pos.z)
		-- SetBlipSprite(blip, 72)
		-- SetBlipScale(blip, 0.8)
		-- SetBlipAsShortRange(blip, true)
		-- BeginTextCommandSetBlipName("STRING")
		-- AddTextComponentString(v.Name)
		-- EndTextCommandSetBlipName(blip)
	-- end
-- end)

-- Activate menu when player is inside marker
Citizen.CreateThread(function()
	while true do
		Wait(0)
		local playerPed = GetPlayerPed(-1)
		if IsPedInAnyVehicle(playerPed, false) then
			local coords      = GetEntityCoords(GetPlayerPed(-1))
			local currentZone = nil
			local zone 		  = nil
			local lastZone    = nil
			if (PlayerData.job ~= nil and PlayerData.job.name == 'mecano') or Config.IsMecanoJobOnly == false then
				for k,v in pairs(Config.Zones) do
					if(GetDistanceBetweenCoords(coords, v.Pos.x, v.Pos.y, v.Pos.z, true) < v.Size.x) then
						isInLSMarker  = true

						SetTextComponentFormat("STRING")
						AddTextComponentString(v.Hint)
						DisplayHelpTextFromStringLabel(0, 0, 1, -1)

						break
					else
						isInLSMarker  = false
					end
				end
			end

			if IsControlJustReleased(0, 38) and not lsMenuIsShowed and isInLSMarker then				
				lsMenuIsShowed = true

				local vehicle = GetVehiclePedIsIn(playerPed, false)
				FreezeEntityPosition(vehicle, true)

				myCar = ESX.Game.GetVehicleProperties(vehicle)

				ESX.UI.Menu.CloseAll()
				GetAction({value = 'main'})
			end

			if isInLSMarker and not hasAlreadyEnteredMarker then
				hasAlreadyEnteredMarker = true
			end

			if not isInLSMarker and hasAlreadyEnteredMarker then
				hasAlreadyEnteredMarker = false
			end

		end
	end
end)
