IsPaused = false
ESX = nil

Citizen.CreateThread(function()
  while ESX == nil do
    TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
    Citizen.Wait(0)
  end
end)

-- CONFIG --

-- The watermark text --
--servername = "Cops - 0\nTest - 2"
jobs = {}

RegisterNetEvent('esx_jobCounter:set')
AddEventHandler('esx_jobCounter:set', function(jobs_online)
	--servername = jobs_online['police'].." - Cops".."\n"..
	--			 jobs_online['ambulance'].." - Sani".."\n"..
	--			 jobs_online['mecano'].." - Meca".."\n"..
	--			 jobs_online['taxi'].." - Taxi"

	jobs = jobs_online

	if jobs['police'] < 1 then
		cops_online = 'red'
	elseif jobs['police'] < 3 then
		cops_online = 'yellow'
	elseif jobs['police'] >= 3 then
		cops_online = 'green'
	end

	if jobs['ambulance'] < 1 then
		sani_online = 'red'
	elseif jobs['ambulance'] < 2 then
		sani_online = 'yellow'
	elseif jobs['ambulance'] >= 2 then
		sani_online = 'green'
	end

	if jobs['mecano'] < 1 then
		meca_online = 'red'
	elseif jobs['mecano'] < 2 then
		meca_online = 'yellow'
	elseif jobs['mecano'] >= 2 then
		meca_online = 'green'
	end

	if jobs['taxi'] < 1 then
		taxi_online = 'red'
	elseif jobs['taxi'] < 2 then
		taxi_online = 'yellow'
	elseif jobs['taxi'] >= 2 then
		taxi_online = 'green'
	end

	ESX.UI.HUD.UpdateElement('jobsCounter', {
		cops = cops_online,
		sani = sani_online,
		meca = meca_online,
		taxi = taxi_online
	})
end)

Citizen.CreateThread(function()
	while true do
		TriggerServerEvent('esx_jobCounter:get')

		Wait(30000)
	end
end)

--[[ The x and y offset (starting at the top left corner) --
-- Default: 0.005, 0.001
offset = {x = 0.005, y = 0.001}

-- Text RGB Color --
-- Default: 64, 64, 64 (gray)
rgb = {r = 164, g = 164, b = 164}

-- Text transparency --
-- Default: 255
alpha = 255

-- Text scale
-- Default: 0.4
-- NOTE: Number needs to be a float (so instead of 1 do 1.0)
scale = 0.4

-- Text Font --
-- 0 - 5 possible
-- Default: 1
font = 4
]]--

RegisterNetEvent('esx:playerLoaded')
AddEventHandler('esx:playerLoaded', function(xPlayer)

	ESX.PlayerData = xPlayer
	local jobsOnlineTpl = '<small style="font-size: 20px;">'..
						   '<div style="border-radius: 100px; text-shadow: 2px 0 0 {{cops}}, 0 -2px 0 {{cops}}, 0 2px 0 {{cops}}, -2px 0 0 {{cops}};">🚓</div>'..
						   '<div style="border-radius: 100px; text-shadow: 2px 0 0 {{sani}}, 0 -2px 0 {{sani}}, 0 2px 0 {{sani}}, -2px 0 0 {{sani}};">🚑</div>'..
						   '<div style="border-radius: 100px; text-shadow: 2px 0 0 {{meca}}, 0 -2px 0 {{meca}}, 0 2px 0 {{meca}}, -2px 0 0 {{meca}};">🔧</div>'..
						   '<div style="border-radius: 100px; text-shadow: 2px 0 0 {{taxi}}, 0 -2px 0 {{taxi}}, 0 2px 0 {{taxi}}, -2px 0 0 {{taxi}};">🚕</div>'..
						  '</small>'

    ESX.UI.HUD.RegisterElement('jobsCounter', 20, 0, jobsOnlineTpl, {
    	cops = 0,
    	sani = 0,
    	meca = 0,
    	taxi = 0	
	})

	if jobs['police'] < 1 then
		cops_online = 'red'
	elseif jobs['police'] < 3 then
		cops_online = 'yellow'
	elseif jobs['police'] >= 3 then
		cops_online = 'green'
	end

	if jobs['ambulance'] < 1 then
		sani_online = 'red'
	elseif jobs['ambulance'] < 2 then
		sani_online = 'yellow'
	elseif jobs['ambulance'] >= 2 then
		sani_online = 'green'
	end

	if jobs['mecano'] < 1 then
		meca_online = 'red'
	elseif jobs['mecano'] < 2 then
		meca_online = 'yellow'
	elseif jobs['mecano'] >= 2 then
		meca_online = 'green'
	end

	if jobs['taxi'] < 1 then
		taxi_online = 'red'
	elseif jobs['taxi'] < 2 then
		taxi_online = 'yellow'
	elseif jobs['taxi'] >= 2 then
		taxi_online = 'green'
	end

	ESX.UI.HUD.UpdateElement('jobsCounter', {
		cops = cops_online,
		sani = sani_online,
		meca = meca_online,
		taxi = taxi_online
	})

end)

-- CODE --
--[[
Citizen.CreateThread(function()
	while true do
		Wait(1)

		SetTextColour(rgb.r, rgb.g, rgb.b, alpha)

		SetTextFont(font)
		SetTextScale(scale, scale)
		SetTextWrap(0.0, 1.0)
		SetTextCentre(false)
		SetTextDropshadow(2, 2, 0, 0, 0)
		SetTextEdge(1, 0, 0, 0, 205)
		SetTextEntry("STRING")
		AddTextComponentString(servername)
		DrawText(offset.x, offset.y)
	end
end)
]]--