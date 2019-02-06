Blips = {}
PlayerData = {}
Zones = {}
TakeoverZones = {}
InsideZone = nil
local initialized = false

ESX = nil;

Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		Citizen.Wait(0)
	end
end)

RegisterNetEvent('esx:playerLoaded')
AddEventHandler('esx:playerLoaded', function(xPlayer)
	PlayerData = xPlayer
	TriggerServerEvent('bubba_zones:retrieveZones')
end)

RegisterNetEvent('bubba_zones:receiveZones')
AddEventHandler('bubba_zones:receiveZones', function(zones)
	Zones = zones
	if not initialized then
		initialized = true
		for k,v in pairs(Zones) do
			if IsOwner(v, PlayerData) then
				TriggerServerEvent('bubba_zones:isZoneTakeover', v)
			end
		end
	end
	RefreshTakeoverZones()
	DeleteBlips()
	RefreshBlips()
end)

RegisterNetEvent('bubba_zones:ownedZoneTakeover')
AddEventHandler('bubba_zones:ownedZoneTakeover', function(zone)
	TriggerEvent('esx:showNotification', zone.label .. ' behöver skyddas!')
	table.insert(TakeoverZones, zone)
	DeleteBlips()
	RefreshBlips()
end)

RegisterNetEvent('bubba_zones:ownedZoneTakeoverPause')
AddEventHandler('bubba_zones:ownedZoneTakeoverPause', function(zone)
	TriggerEvent('esx:showNotification', zone.label .. ' ändrade inte ägare')
	for k,v in pairs(TakeoverZones) do
		if v.label == zone.label then
			TakeoverZones[k] = nil
		end
	end
	DeleteBlips()
	RefreshBlips()
end)

function IsTakeoverZone(zone)
	for k,v in pairs(TakeoverZones) do
		if v.label == zone.label then
			return true
		end
	end
	return false
end

function RefreshTakeoverZones()
	for k,v in pairs(Zones) do
		for j,l in pairs(TakeoverZones) do
			if v.label == l.label and not IsOwner(v, PlayerData) then
				TakeoverZones[j] = nil
			end
		end
	end
end

function RefreshBlips()
	for k,v in pairs(Zones) do
		local blip = AddBlipForCoord(v.marker.x, v.marker.y, v.marker.z)
		SetBlipSprite (blip, v.blip)
		SetBlipDisplay(blip, 4)
		SetBlipScale  (blip, 1.0)
		local isOwner = IsOwner(v, PlayerData)
		if IsTakeoverZone(v) then
			SetBlipColour(blip, 1)
			SetBlipRoute(blip, true)
		else
			SetBlipRoute(blip, false)
			if isOwner then
				SetBlipColour(blip, 2)
			elseif v.cooldown ~= nil then
				SetBlipColour(blip, 5)
			else
				SetBlipColour(blip, 1)
			end
		end
		SetBlipAsShortRange(blip, true)
		BeginTextCommandSetBlipName("STRING")
		AddTextComponentString(v.label)
		EndTextCommandSetBlipName(blip)
		table.insert(Blips, blip)
		if HasAccess(v) then
			local drugBlip = AddBlipForCoord(v.drugLocation.x, v.drugLocation.y, v.drugLocation.z)
			SetBlipSprite (drugBlip, v.blip)
			SetBlipDisplay(drugBlip, 4)
			SetBlipScale  (drugBlip, 1.0)
			SetBlipColour(drugBlip, 2)
			SetBlipAsShortRange(drugBlip, true)
			BeginTextCommandSetBlipName("STRING")
			AddTextComponentString(v.drug)
			EndTextCommandSetBlipName(drugBlip)
			table.insert(Blips, drugBlip)
		end
	end
end

function DeleteBlips()
	for i = 1, #Blips, 1 do
		RemoveBlip(Blips[i])
	end
	Blips = {}
end

function HasAccess(zone)
	local isOwner = IsOwner(zone, PlayerData)
	if not isOwner then
		for i = 1, #zone.accessPlayers, 1 do
			if zone.accessPlayers[i].identifier == PlayerData.identifier then
				return true
			end
		end
	end
	return isOwner
end

Citizen.CreateThread(function()
	while true do
		Wait(1000)
		for k,v in pairs(Zones) do
			-- Decrease cooldown locally on clients
			if v.cooldown ~= nil then
				v.cooldown = v.cooldown - 1
				if v.cooldown <= 0 then
					v.cooldown = nil
					DeleteBlips()
					RefreshBlips()
				end
			end
		end
	end
end)

Citizen.CreateThread(function()
	while true do
		Wait(0)
		local coords = GetEntityCoords(GetPlayerPed(-1))
		for k,v in pairs(Zones) do
			local isOwner = IsOwner(v, PlayerData)
			if not IsEntityDead(GetPlayerPed(-1)) then
				local hasAccess = HasAccess(v)
				local distanceLocation = GetDistanceBetweenCoords(coords, v.marker.x, v.marker.y, v.marker.z, true)
				local distanceDrugLocation = GetDistanceBetweenCoords(coords, v.drugLocation.x, v.drugLocation.y, v.drugLocation.z, true)
				local distanceExitLocation = GetDistanceBetweenCoords(coords, v.transferLocation.x, v.transferLocation.y, v.transferLocation.z, true)
				local distanceMenuLocation = GetDistanceBetweenCoords(coords, v.menuLocation.x, v.menuLocation.y, v.menuLocation.z, true)
				if hasAccess and distanceDrugLocation < (v.drugLocation.sizeX / 2) then
					SetTextComponentFormat('STRING')
					AddTextComponentString("Tryck ~INPUT_CONTEXT~ för att gå till " .. v.label)
					DisplayHelpTextFromStringLabel(0, 0, 1, -1)
					if IsControlJustReleased(0, 38) then
						DoScreenFadeOut(1000)
						Citizen.Wait(1500)
						ESX.Game.Teleport(GetPlayerPed(-1), v.transferLocation)
						DoScreenFadeIn(1000)
					end
				elseif hasAccess and distanceExitLocation < (v.drugLocation.sizeX / 2) then
					SetTextComponentFormat('STRING')
					AddTextComponentString("Tryck ~INPUT_CONTEXT~ för att lämna " .. v.label)
					DisplayHelpTextFromStringLabel(0, 0, 1, -1)
					if IsControlJustReleased(0, 38) then
						DoScreenFadeOut(1000)
						Citizen.Wait(1500)
						ESX.Game.Teleport(GetPlayerPed(-1), v.drugLocation)
						DoScreenFadeIn(1000)
					end
				elseif isOwner and distanceMenuLocation < (v.drugLocation.sizeX / 2) then
					SetTextComponentFormat('STRING')
					AddTextComponentString("Tryck ~INPUT_CONTEXT~ för att ändra rättigheter för " .. v.label)
					DisplayHelpTextFromStringLabel(0, 0, 1, -1)
					if IsControlJustReleased(0, 38) then
						OpenAccessMenu(v, PlayerData)
					end
				elseif distanceLocation < (v.marker.sizeX / 2) then
					if InsideZone == nil then
						InsideZone = v
						TriggerServerEvent('bubba_zones:isInsideZone', PlayerData, v)
						if not isOwner and v.cooldown ~= nil then
							TriggerEvent('esx:showNotification', '~y~' .. v.label .. ' är stängt för tillfället')
						end
					end
				elseif InsideZone ~= nil and InsideZone.label == v.label then
					TriggerServerEvent('bubba_zones:outOfZone', PlayerData, v)
					if not isOwner or IsTakeoverZone(v) then
						TriggerEvent('esx:showNotification', 'Du måste stå inuti zonen')
					end
					InsideZone = nil
				end
			elseif InsideZone ~= nil and InsideZone.label == v.label then
				TriggerServerEvent('bubba_zones:outOfZone', PlayerData, v)
				InsideZone = nil
			end
			-- Draw markers for zones
			if not isOwner then
				if v.cooldown ~= nil then
					DrawMarker(1, v.marker.x, v.marker.y, v.marker.z, 0.0, 0.0, 0.0, 0, 0.0, 0.0, v.marker.sizeX, v.marker.sizeY, v.marker.sizeZ, 255, 255, 0, 100, false, true, 2, false, false, false, false)
				else
					DrawMarker(1, v.marker.x, v.marker.y, v.marker.z, 0.0, 0.0, 0.0, 0, 0.0, 0.0, v.marker.sizeX, v.marker.sizeY, v.marker.sizeZ, 255, 0, 0, 100, false, true, 2, false, false, false, false)
				end
			elseif IsTakeoverZone(v) then
				DrawMarker(1, v.marker.x, v.marker.y, v.marker.z, 0.0, 0.0, 0.0, 0, 0.0, 0.0, v.marker.sizeX, v.marker.sizeY, v.marker.sizeZ, 255, 0, 0, 100, false, true, 2, false, false, false, false)
			end
			if hasAccess then
				--DrawMarker(1, v.drugLocation.x, v.drugLocation.y, v.drugLocation.z, 0.0, 0.0, 0.0, 0, 0.0, 0.0, v.drugLocation.sizeX, v.drugLocation,sizeY, v.drugLocation.sizeZ, 0, 255, 0, 100, false, true, 2, false, false, false, false)
				--DrawMarker(1, v.transferLocation.x, v.transferLocation.y, v.transferLocation.z, 0.0, 0.0, 0.0, 0, 0.0, 0.0, v.drugLocation.sizeX, v.drugLocation,sizeY, v.drugLocation.sizeZ, 0, 255, 0, 100, false, true, 2, false, false, false, false)
			end
		end
	end
end)