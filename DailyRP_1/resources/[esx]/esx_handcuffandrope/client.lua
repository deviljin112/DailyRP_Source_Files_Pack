-- ESX
ESX               = nil

Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		Citizen.Wait(0)
	end
end)

RegisterNetEvent('esx:playerLoaded')
AddEventHandler('esx:playerLoaded', function(xPlayer)
  PlayerData = xPlayer
end)

-- Locals

local cuffed = false
local dict = "mp_arresting"
local anim = "idle"
local flags = 49
local ped = PlayerPedId()
local changed = false
local prevMaleVariation = 0
local prevFemaleVariation = 0
local femaleHash = GetHashKey("mp_f_freemode_01")
local maleHash = GetHashKey("mp_m_freemode_01")
local IsLockpicking    = false

-- Sätt på handklovar
RegisterNetEvent('esx_handcuffandropeandrope:cuff')
AddEventHandler('esx_handcuffandropeandrope:cuff', function()
    ped = GetPlayerPed(-1)
    RequestAnimDict(dict)

    while not HasAnimDictLoaded(dict) do
        Citizen.Wait(0)
    end

        if GetEntityModel(ped) == femaleHash then
            prevFemaleVariation = GetPedDrawableVariation(ped, 7)
            SetPedComponentVariation(ped, 7, 25, 0, 0)
        elseif GetEntityModel(ped) == maleHash then
            prevMaleVariation = GetPedDrawableVariation(ped, 7)
            SetPedComponentVariation(ped, 7, 41, 0, 0)
        end

        SetEnablerope(ped, true)
        TaskPlayAnim(ped, dict, anim, 8.0, -8, -1, flags, 0, 0, 0, 0)

    cuffed = not cuffed
    changed = true
end)

-- Ta av handklovar
RegisterNetEvent('esx_handcuffandropeandrope:uncuff')
AddEventHandler('esx_handcuffandropeandrope:uncuff', function()
    ped = GetPlayerPed(-1)
    RequestAnimDict(dict)

    while not HasAnimDictLoaded(dict) do
        Citizen.Wait(0)
    end

        ClearPedTasks(ped)
        SetEnablerope(ped, false)
        UncuffPed(ped)

        if GetEntityModel(ped) == femaleHash then -- mp female
            SetPedComponentVariation(ped, 7, prevFemaleVariation, 0, 0)
        elseif GetEntityModel(ped) == maleHash then -- mp male
            SetPedComponentVariation(ped, 7, prevMaleVariation, 0, 0)
        end

    cuffed = not cuffed

    changed = true
end)

RegisterNetEvent('esx_handcuffandropeandrope:cuffcheck')
AddEventHandler('esx_handcuffandropeandrope:cuffcheck', function()
  local player, distance = ESX.Game.GetClosestPlayer()
  if distance ~= -1 and distance <= 3.0 then
  				  RequestAnimDict("amb@prop_human_bum_bin@idle_b")
				  TaskPlayAnim(ped,"amb@prop_human_bum_bin@idle_b","idle_d",100.0, 200.0, 0.3, 120, 0.2, 0, 0, 0, 130)
								ESX.ShowNotification('~g~You have used your rope')
				Wait(8000)
		TriggerServerEvent('esx_policejob:rope', GetPlayerServerId(player))
				ESX.ShowNotification('~r~Person dragged/UnDragged')
  else
    ESX.ShowNotification('No players nearby')
	end
end)

RegisterNetEvent('esx_handcuffandropeandrope:ropecheck')
AddEventHandler('esx_handcuffandropeandrope:ropecheck', function()
  local player, distance = ESX.Game.GetClosestPlayer()
  if distance ~= -1 and distance <= 3.0 then
  				  RequestAnimDict("amb@prop_human_bum_bin@idle_b")
				  TaskPlayAnim(ped,"amb@prop_human_bum_bin@idle_b","idle_d",100.0, 200.0, 0.3, 120, 0.2, 0, 0, 0, 130)
								ESX.ShowNotification('~g~You have used your rope')
				Wait(8000)
		TriggerServerEvent('esx_policejob:drag', GetPlayerServerId(player))
				ESX.ShowNotification('~r~Person Cuffed/UnCuffed')
  else
    ESX.ShowNotification('No players nearby')
	end
end)

RegisterNetEvent('esx_handcuffandropeandrope:nyckelcheck')
AddEventHandler('esx_handcuffandropeandrope:nyckelcheck', function()
	local player, distance = ESX.Game.GetClosestPlayer()
  if distance ~= -1 and distance <= 3.0 then
      TriggerServerEvent('esx_handcuffandropeandrope:unlocking', GetPlayerServerId(player))
  else
    ESX.ShowNotification('No players nearby')
	end
end)

RegisterNetEvent('esx_handcuffandropeandrope:unlockingcuffs')
AddEventHandler('esx_handcuffandropeandrope:unlockingcuffs', function()
  local player, distance = ESX.Game.GetClosestPlayer()
	local ped = GetPlayerPed(-1)

	if IsLockpicking == false then
		ESX.UI.Menu.CloseAll()
		FreezeEntityPosition(player,  true)
		FreezeEntityPosition(ped,  true)

		TaskStartScenarioInPlace(ped, "WORLD_HUMAN_WELDING", 0, true)

		IsLockpicking = true

		Wait(30000)

		IsLockpicking = false

		FreezeEntityPosition(player,  false)
		FreezeEntityPosition(ped,  false)

		ClearPedTasksImmediately(ped)

		TriggerServerEvent('esx_policejob:rope', GetPlayerServerId(player))
		ESX.ShowNotification('rope unlocked')
	else
		ESX.ShowNotification('Your are already lockpicking rope')
	end
end)

-- ??
Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)
        if not changed then
            ped = PlayerPedId()
            local IsCuffed = IsPedCuffed(ped)
            if IsCuffed and not IsEntityPlayingAnim(PlayerPedId(), dict, anim, 3) then
                Citizen.Wait(0)
                TaskPlayAnim(ped, dict, anim, 8.0, -8, -1, flags, 0, 0, 0, 0)
            end
        else
            changed = false
        end
    end
end)

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)
        ped = PlayerPedId()
        if cuffed then
        end
    end
end)

RegisterNetEvent('esx_handcuffandrope:cuff')
AddEventHandler('esx_handcuffandrope:cuff', function()
    ped = GetPlayerPed(-1)
    RequestAnimDict(dict)

    while not HasAnimDictLoaded(dict) do
        Citizen.Wait(0)
    end

        if GetEntityModel(ped) == femaleHash then
            prevFemaleVariation = GetPedDrawableVariation(ped, 7)
            SetPedComponentVariation(ped, 7, 25, 0, 0)
        elseif GetEntityModel(ped) == maleHash then
            prevMaleVariation = GetPedDrawableVariation(ped, 7)
            SetPedComponentVariation(ped, 7, 41, 0, 0)
        end

        SetEnableHandcuffs(ped, true)
        TaskPlayAnim(ped, dict, anim, 8.0, -8, -1, flags, 0, 0, 0, 0)

    cuffed = not cuffed
    changed = true
end)
--- Uncufing
RegisterNetEvent('esx_handcuffandrope:uncuff')
AddEventHandler('esx_handcuffandrope:uncuff', function()
    ped = GetPlayerPed(-1)
    RequestAnimDict(dict)

    while not HasAnimDictLoaded(dict) do
        Citizen.Wait(0)
    end

        ClearPedTasks(ped)
        SetEnableHandcuffs(ped, false)
        UncuffPed(ped)

        if GetEntityModel(ped) == femaleHash then -- mp female
            SetPedComponentVariation(ped, 7, prevFemaleVariation, 0, 0)
        elseif GetEntityModel(ped) == maleHash then -- mp male
            SetPedComponentVariation(ped, 7, prevMaleVariation, 0, 0)
        end

    cuffed = not cuffed

    changed = true
end)

RegisterNetEvent('esx_handcuffandrope:cuffcheck')
AddEventHandler('esx_handcuffandrope:cuffcheck', function()
  local player, distance = ESX.Game.GetClosestPlayer()
  if distance ~= -1 and distance <= 3.0 then
  				  RequestAnimDict("amb@prop_human_bum_bin@idle_b")
				  TaskPlayAnim(ped,"amb@prop_human_bum_bin@idle_b","idle_d",100.0, 200.0, 0.3, 120, 0.2, 0, 0, 0, 130)
								ESX.ShowNotification('~g~You have used your handcuffs')
				Wait(8000)
		TriggerServerEvent('esx_policejob:handcuff', GetPlayerServerId(player))
				ESX.ShowNotification('~r~Person Cuffed/UnCuffed')
  else
    ESX.ShowNotification('No players nearby')
	end
end)

RegisterNetEvent('esx_handcuffandrope:nyckelcheck')
AddEventHandler('esx_handcuffandrope:nyckelcheck', function()
	local player, distance = ESX.Game.GetClosestPlayer()
  if distance ~= -1 and distance <= 3.0 then
      TriggerServerEvent('esx_handcuffandrope:unlocking', GetPlayerServerId(player))
  else
    ESX.ShowNotification('No players nearby')
	end
end)

RegisterNetEvent('esx_handcuffandrope:unlockingcuffs')
AddEventHandler('esx_handcuffandrope:unlockingcuffs', function()
  local player, distance = ESX.Game.GetClosestPlayer()
	local ped = GetPlayerPed(-1)

	if IsLockpicking == false then
		ESX.UI.Menu.CloseAll()
		FreezeEntityPosition(player,  true)
		FreezeEntityPosition(ped,  true)

		TaskStartScenarioInPlace(ped, "WORLD_HUMAN_WELDING", 0, true)

		IsLockpicking = true

		Wait(30000)

		IsLockpicking = false

		FreezeEntityPosition(player,  false)
		FreezeEntityPosition(ped,  false)

		ClearPedTasksImmediately(ped)

		TriggerServerEvent('esx_policejob:handcuff', GetPlayerServerId(player))
		ESX.ShowNotification('Handcuffs unlocked')
	else
		ESX.ShowNotification('Your are already lockpicking handcuffs')
	end
end)

-- ??
Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)
        if not changed then
            ped = PlayerPedId()
            local IsCuffed = IsPedCuffed(ped)
            if IsCuffed and not IsEntityPlayingAnim(PlayerPedId(), dict, anim, 3) then
                Citizen.Wait(0)
                TaskPlayAnim(ped, dict, anim, 8.0, -8, -1, flags, 0, 0, 0, 0)
            end
        else
            changed = false
        end
    end
end)

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)
        ped = PlayerPedId()
        if cuffed then
        end
    end
end)
