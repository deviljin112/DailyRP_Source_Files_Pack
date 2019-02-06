CurrentWeather = 'EXTRASUNNY'
local lastWeather = CurrentWeather
local baseTime = 0
local timeOffset = 0
local timer = 0
local freezeTime = false
local blackout = false

RegisterNetEvent('es_wsync:updateWeather')
AddEventHandler('es_wsync:updateWeather', function(NewWeather, newblackout)
	CurrentWeather = NewWeather
	blackout = newblackout
end)

Citizen.CreateThread(function()
	while true do
		if lastWeather ~= CurrentWeather then
			lastWeather = CurrentWeather
			SetWeatherTypeOverTime(CurrentWeather, 15.0)
			Citizen.Wait(15000)
		end
		Citizen.Wait(100) -- Wait 0 seconds to prevent crashing.
		SetBlackout(blackout)
		ClearOverrideWeather()
		ClearWeatherTypePersist()
		SetWeatherTypePersist(lastWeather)
		SetWeatherTypeNow(lastWeather)
		SetWeatherTypeNowPersist(lastWeather)
		if lastWeather == 'XMAS' then
			SetForceVehicleTrails(true)
			SetForcePedFootstepsTracks(true)
		else
			SetForceVehicleTrails(false)
			SetForcePedFootstepsTracks(false)
		end
	end
end)

RegisterNetEvent('es_wsync:updateTime')
AddEventHandler('es_wsync:updateTime', function(base, offset, freeze)
	freezeTime = freeze
	timeOffset = offset
	baseTime = base
end)

Citizen.CreateThread(function()
	local hour = 0
	local minute = 0
	while true do
		Citizen.Wait(0)
		local newBaseTime = baseTime
		if GetGameTimer() - 500  > timer then
			newBaseTime = newBaseTime + 0.25
			timer = GetGameTimer()
		end
		if freezeTime then
			timeOffset = timeOffset + baseTime - newBaseTime
		end
		baseTime = newBaseTime
		hour = math.floor(((baseTime+timeOffset)/60)%24)
		minute = math.floor((baseTime+timeOffset)%60)
		NetworkOverrideClockTime(hour, minute, 0)
	end
end)

AddEventHandler('playerSpawned', function()
	TriggerServerEvent('es_wsync:requestSync')
end)
