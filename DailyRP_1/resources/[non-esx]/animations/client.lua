
-- Dankzy :D

local citycop = GetHashKey("s_m_y_cop_01")
local sheriff = GetHashKey("s_m_y_sheriff_01")
local medic = GetHashKey("s_m_m_paramedic_01")


hat = false

RegisterNetEvent( 'haton' )
AddEventHandler( 'haton', function()
	hat = not hat
	if(GetEntityModel(GetPlayerPed(-1)) == citycop) then
		if hat then
			SetPedPropIndex(GetPlayerPed(-1), 0, 0, 0, 2)
		else
			ClearPedProp(GetPlayerPed(-1), 0)
		end	
	elseif(GetEntityModel(GetPlayerPed(-1)) == sheriff) then
		if hat then
			SetPedPropIndex(GetPlayerPed(-1), 0, 0, 0, 2)
		else
			ClearPedProp(GetPlayerPed(-1), 0)
		end	
	elseif (GetEntityModel(GetPlayerPed(-1)) == medic) then
		if hat then
			SetPedPropIndex(GetPlayerPed(-1), 0, 0, 0, 2)
		else
			ClearPedProp(GetPlayerPed(-1), 0)
		end	
	end
end)



sg = false

  RegisterNetEvent( 'glasses' )
AddEventHandler( 'glasses', function()
	sg = not sg
	if(GetEntityModel(GetPlayerPed(-1)) == citycop) then
		if sg then
			SetPedPropIndex(GetPlayerPed(-1), 1, 0, 0, 2)
		else
			ClearPedProp(GetPlayerPed(-1), 1)
		end
	elseif(GetEntityModel(GetPlayerPed(-1)) == sheriff) then
		if sg then
			SetPedPropIndex(GetPlayerPed(-1), 1, 1, 0, 2)
		else
			ClearPedProp(GetPlayerPed(-1), 1)
		end
	elseif(GetEntityModel(GetPlayerPed(-1)) == medic) then
		if sg then
			SetPedPropIndex(GetPlayerPed(-1), 1, 0, 0, 2)
		else
			ClearPedProp(GetPlayerPed(-1), 1)
		end
	end
end)




local holstered = true

-- RESTRICTED PEDS --
-- I've only listed peds that have a remote speaker mic, but any ped listed here will do the animations.

-- Add/remove weapon hashes here to be added for holster checks.
local weapons = {
	"WEAPON_PISTOL",
	"WEAPON_COMBATPISTOL",
	"WEAPON_APPISTOL",
	"WEAPON_VINTAGEPISTOL",
	"WEAPON_SNSPISTOL",
	"WEAPON_HEAVYPISTOL",
	"WEAPON_MARKSMANPISTOL",
	"WEAPON_STUNGUN",
	"WEAPON_MACHINEPISTOL",
	"WEAPON_PISTOL50",
	"WEAPON_MICROSMG",
	"WEAPON_REVOLVER",
	"WEAPON_SWITCHBLADE",
	"WEAPON_KNIFE",
	"WEAPON_BAT",
	"WEAPON_CARBINERIFLE",
	"WEAPON_MUSKET",
	"WEAPON_NIGHTSTICK",
	"WEAPON_ASSULTSMG",
	"WEAPON_ASSULTRIFLE",
	"WEAPON_PUMPSHOTGUN",
	"WEAPON_FLASHLIGHT",
	"WEAPON_FLAREGUN",

}

-- Holster shit


Citizen.CreateThread( function()
	while true do 
		Citizen.Wait( 0 )
		local ped = PlayerPedId()
		if DoesEntityExist( ped ) and not IsEntityDead( ped ) and not IsPedInAnyVehicle(PlayerPedId(), true) then 
			DisableControlAction( 0, 246, true ) -- Y (Z)
			if not IsPauseMenuActive() then 
				loadAnimDict( "reaction@intimidation@cop@unarmed" )		
				if IsDisabledControlJustReleased( 0, 246 ) then -- Y
					ClearPedTasks(ped)
					SetEnableHandcuffs(ped, false)
					SetCurrentPedWeapon(ped, GetHashKey("WEAPON_UNARMED"), true)
				else
					if IsDisabledControlJustPressed( 0, 246 ) then -- Y 
						SetEnableHandcuffs(ped, true)
						SetCurrentPedWeapon(ped, GetHashKey("WEAPON_UNARMED"), true) 
						TaskPlayAnim(ped, "reaction@intimidation@cop@unarmed", "intro", 8.0, 2.0, -1, 50, 2.0, 0, 0, 0 )
					end
					if IsEntityPlayingAnim(GetPlayerPed(PlayerId()), "reaction@intimidation@cop@unarmed", "intro", 3) then 
						DisableActions(ped)
					end	
				end
			end 
		end 
	end
end )

-- HOLSTER/UNHOLSTER PISTOL --
 
 Citizen.CreateThread(function()
	while true do
		Citizen.Wait(0)
		local ped = PlayerPedId()
		if DoesEntityExist( ped ) and not IsEntityDead( ped ) and not IsPedInAnyVehicle(PlayerPedId(), true) then
			loadAnimDict( "rcmjosh4" )
			loadAnimDict( "weapons@pistol@" )
			if CheckWeapon(ped) then
				if holstered then
					TaskPlayAnim(ped, "rcmjosh4", "josh_leadout_cop2", 8.0, 2.0, -1, 48, 10, 0, 0, 0 )
					Citizen.Wait(600)
					ClearPedTasks(ped)
					holstered = false
				end
				--SetPedComponentVariation(ped, 9, 0, 0, 0)
			elseif not CheckWeapon(ped) then
				if not holstered then
					TaskPlayAnim(ped, "weapons@pistol@", "aim_2_holster", 8.0, 2.0, -1, 48, 10, 0, 0, 0 )
					Citizen.Wait(500)
					ClearPedTasks(ped)
					holstered = true
				end
				--SetPedComponentVariation(ped, 9, 1, 0, 0)
			end
		end
	end
end)




function CheckWeapon(ped)
	for i = 1, #weapons do
		if GetHashKey(weapons[i]) == GetSelectedPedWeapon(ped) then
			return true
		end
	end
	return false
end

function DisableActions(ped)
	DisableControlAction(1, 140, true)
	DisableControlAction(1, 141, true)
	DisableControlAction(1, 142, true)
	DisableControlAction(1, 37, true) -- Disables INPUT_SELECT_WEAPON (TAB)
	DisablePlayerFiring(ped, true) -- Disable weapon firing
end

function loadAnimDict( dict )
	while ( not HasAnimDictLoaded( dict ) ) do
		RequestAnimDict( dict )
		Citizen.Wait( 0 )
	end
end
