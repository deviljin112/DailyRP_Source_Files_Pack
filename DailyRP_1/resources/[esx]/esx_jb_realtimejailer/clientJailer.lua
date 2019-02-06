local cJ = false
local IsPlayerUnjailed = false


--ESX base

Citizen.CreateThread(function()
    while ESX == nil do
        TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
        Citizen.Wait(0)
    end
end)

RegisterNetEvent("esx_jb_jailer:JailInStation")
AddEventHandler("esx_jb_jailer:JailInStation", function(Station, Distance, JailTime)
	jailing(Station, Distance, JailTime)
end)

function jailing(Station, Distance, JailTime)
	if cJ == true then
		return
	end
	local PlayerPed = GetPlayerPed(-1)
	if DoesEntityExist(PlayerPed) then
		
		Citizen.CreateThread(function()
			local spawnloccoords = {}
			TriggerEvent('esx_society:setClothes', "police", "prison_wear")	
			spawnloccoords = SetPlayerSpawnLocationjail(Station)
			SetEntityCoords(PlayerPed, spawnloccoords.x,spawnloccoords.y, spawnloccoords.z )
			cJ = true
			IsPlayerUnjailed = false
			while JailTime > 0 and not IsPlayerUnjailed do
				local remainingjailseconds = JailTime/ 60
				local jailseconds =  math.floor(JailTime) % 60 
				local remainingjailminutes = remainingjailseconds / 60
				local jailminutes =  math.floor(remainingjailseconds) % 60
				local remainingjailhours = remainingjailminutes / 24
				local jailhours =  math.floor(remainingjailminutes) % 24
				local remainingjaildays = remainingjailhours / 365 
				local jaildays =  math.floor(remainingjailhours) % 365

				
				PlayerPed = GetPlayerPed(-1)
				--RemoveAllPedWeapons(PlayerPed, true)
				--SetEntityInvincible(PlayerPed, true)
				if IsPedInAnyVehicle(PlayerPed, false) then
					ClearPedTasksImmediately(PlayerPed)
				end
				if JailTime % 10 == 0 then
					if JailTime % 30 == 0 then
						TriggerEvent('chatMessage', 'SYSTEM', { 0, 0, 0 }, math.floor(jaildays).." jours, "..math.floor(jailhours).." heures,"..math.floor(jailminutes).." minutes, "..math.floor(jailseconds).." secondes avant d'être libéré.")
					end
				end
				Citizen.Wait(1000)
				local pL = GetEntityCoords(PlayerPed, true)
				local D = Vdist(spawnloccoords.x,spawnloccoords.y, spawnloccoords.z, pL['x'], pL['y'], pL['z'])
				if D > Distance then -- distance#######################################################################################
					SetEntityCoords(PlayerPed, spawnloccoords.x,spawnloccoords.y, spawnloccoords.z)
				end
				JailTime = JailTime - 1.0
			end
			TriggerServerEvent('chatMessageEntered', "SYSTEM", { 0, 0, 0 }, GetPlayerName(PlayerId()) .." a été libéré de la prison.")
			TriggerServerEvent('esx_jb_jailer:UnJailplayer', GetPlayerServerId(PlayerId()))
			local outsidecoords = {}
			outsidecoords = SetPlayerSpawnLocationoutsidejail(Station)
			SetEntityCoords(PlayerPed, outsidecoords.x,outsidecoords.y,outsidecoords.z )
			cJ = false
			--SetEntityInvincible(PlayerPed, false)
			TriggerEvent('esx_society:getPlayerSkin')
		end)
	end
end

function SetPlayerSpawnLocationjail(location)
	if location == 'JailPoliceStation1' then
		return {x=459.5500793457, y=-994.46508789063, z=23.914855957031}
	elseif location == 'JailPoliceStation2' then
		return {x=458.41693115234,y=-997.93572998047,z=23.914854049683}	
	elseif location == 'JailPoliceStation3' then
		return {x=458.29275512695,y=-1001.5576782227,z=23.914852142334}	
	elseif location == 'FederalJail' then
		return {x=1642.58,y=2568.06,z=45.564888000488}
	end
end

function SetPlayerSpawnLocationoutsidejail(location)
	if location == 'JailPoliceStation1' then
		return {x=432.95864868164,y=-981.41455078125,z=29.710334777832}
	elseif location == 'JailPoliceStation2' then
		return {x=432.95864868164,y=-981.41455078125,z=29.710334777832}	
	elseif location == 'JailPoliceStation3' then
		return {x=432.95864868164,y=-981.41455078125,z=29.710334777832}	
	elseif location == 'FederalJail' then
		return {x=1847.5042724609,y=2586.2209472656,z=44.672046661377}
	end
end

RegisterNetEvent("esx_jb_jailer:UnJail")
AddEventHandler("esx_jb_jailer:UnJail", function()
	IsPlayerUnjailed = true
end)



---- COMMAND JAIL ----

RegisterNetEvent("esx_jb_jailer:CommandJail")
AddEventHandler("esx_jb_jailer:CommandJail", function(playerid)
	openJailMenu(GetPlayerServerId(playerid))
end)


function openJailMenu(playerid)
	local elements = {
	  {label = "Cellule 1",     value = 'JailPoliceStation1'},
	  {label = "Cellule 2",     value = 'JailPoliceStation2'},
	  {label = "Cellule 3",     value = 'JailPoliceStation3'},
	  {label = "Cellule fédérale",     value = 'FederalJail'},
	  {label = "Libérer de cellule",     value = 'FreePlayer'},
	}
	ESX.UI.Menu.Open(
	  'default', GetCurrentResourceName(), 'jail_menu',
	  {
		title    = 'Mettre en prison',
		align    = 'top-left',
		elements = elements,
	  },
	  function(data3, menu)
		  if data3.current.value ~= "FreePlayer" then
			  maxLength = 4
			  AddTextEntry('FMMC_KEY_TIP8', "Nombre d'heures en prison")
			  DisplayOnscreenKeyboard(1, "FMMC_KEY_TIP8", "", "", "", "", "", maxLength)
			  ESX.ShowNotification("~b~Entrez le nombre d'heures que vous voulez mettre la personne en prison.")
			  blockinput = true
  
			  while UpdateOnscreenKeyboard() ~= 1 and UpdateOnscreenKeyboard() ~= 2 do
				  Citizen.Wait( 0 )
			  end
  
			  local jailtime = GetOnscreenKeyboardResult()
  
			  UnblockMenuInput()
  
			  if string.len(jailtime) >= 1 and tonumber(jailtime) ~= nil then
				  TriggerServerEvent('esx_jb_jailer:PutInJail', playerid, data3.current.value, tonumber(jailtime)*60*60)
			  else
				  return false
			  end
		  else
			  TriggerServerEvent('esx_jb_jailer:UnJailplayer', playerid)
		  end
	  end,
	  function(data3, menu)
		menu.close()
	  end
	)
  end
  
  function UnblockMenuInput()
	  Citizen.CreateThread( function()
		  Citizen.Wait( 150 )
		  blockinput = false 
	  end )
  end