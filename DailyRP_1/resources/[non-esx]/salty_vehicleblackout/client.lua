ESX = nil

-- No need to modify any of this, but I tried to document what it's doing
local isBlackedOut = false
local oldBodyDamage = 0
local oldSpeed = 0


--== NATIVE INFO ==--

--[[

SHAKE_GAMEPLAY_CAM #
// 0xFD55E49555E017CF 0xF2EFE660
// ShakeGameplayCam
void SHAKE_GAMEPLAY_CAM(char* shakeName, float intensity);
Possible shake types (updated b617d):  
DEATH_FAIL_IN_EFFECT_SHAKE  
DRUNK_SHAKE  
FAMILY5_DRUG_TRIP_SHAKE  
HAND_SHAKE  
JOLT_SHAKE  
LARGE_EXPLOSION_SHAKE  
MEDIUM_EXPLOSION_SHAKE  
SMALL_EXPLOSION_SHAKE  
ROAD_VIBRATION_SHAKE  
SKY_DIVING_SHAKE  
VIBRATE_SHAKE 


]]--


local function blackout()
	-- Only blackout once to prevent an extended blackout if both speed and damage thresholds were met
	if not isBlackedOut then
		isBlackedOut = true
		-- This thread will black out the user's screen for the specified time
		Citizen.CreateThread(function()

			TriggerServerEvent('InteractSound_SV:PlayOnSource', 'heartbeat', 1.0)

			DoScreenFadeOut(100)
				Citizen.Wait(500)
			DoScreenFadeIn(250)

			ShakeGameplayCam('DEATH_FAIL_IN_EFFECT_SHAKE', 2.0)

				Citizen.Wait(1000)
			DoScreenFadeOut(100)
				Citizen.Wait(500)
			DoScreenFadeIn(250)
				Citizen.Wait(500)
			DoScreenFadeOut(100)
				Citizen.Wait(1000)
			DoScreenFadeIn(250)
				Citizen.Wait(1000)
			DoScreenFadeOut(100)

			--DoScreenFadeOut(100)

				while not IsScreenFadedOut() do
					Citizen.Wait(0)
				end

			Citizen.Wait(2000)

--			Citizen.Wait(Config.BlackoutTime)

			DoScreenFadeIn(250)

			isBlackedOut = false
		end)
	end
end

Citizen.CreateThread(function()
	while true do
		Citizen.Wait(0)
		-- Get the vehicle the player is in, and continue if it exists
		local vehicle = GetVehiclePedIsIn(PlayerPedId(), false)
		if DoesEntityExist(vehicle) then
			-- Check if damage blackout is enabled
			if Config.BlackoutFromDamage then
				local currentDamage = GetVehicleBodyHealth(vehicle)
				-- If the damage changed, see if it went over the threshold and blackout if necesary
				if currentDamage ~= oldBodyDamage then
					if not isBlackedOut and (currentDamage < oldBodyDamage) and ((oldBodyDamage - currentDamage) >= Config.BlackoutDamageRequired) then
						blackout()
					end
					oldBodyDamage = currentDamage
				end
			end
			
			-- Check if speed blackout is enabled
			if Config.BlackoutFromSpeed then
				local currentSpeed = GetEntitySpeed(vehicle) * 2.23
				-- If the speed changed, see if it went over the threshold and blackout if necesary
				if currentSpeed ~= oldSpeed then
					if not isBlackedOut and (currentSpeed < oldSpeed) and ((oldSpeed - currentSpeed) >= Config.BlackoutSpeedRequired) then
						blackout()
					end
					oldSpeed = currentSpeed
				end
			end
		else
			oldBodyDamage = 0
			oldSpeed = 0
		end
		
		if isBlackedOut and Config.DisableControlsOnBlackout then
			-- Borrowed controls from https://github.com/Sighmir/FiveM-Scripts/blob/master/vrp/vrp_hotkeys/client.lua
			DisableControlAction(0,71,true) -- veh forward
			DisableControlAction(0,72,true) -- veh backwards
			DisableControlAction(0,63,true) -- veh turn left
			DisableControlAction(0,64,true) -- veh turn right
			DisableControlAction(0,75,true) -- disable exit vehicle
		end
	end
end)
