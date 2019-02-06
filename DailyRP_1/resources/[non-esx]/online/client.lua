--[[-----------------------------------------------------------------------|
Made by Cheleber - Hope you Enjoy
My Server: www.grandetheftlusitan.com
If you need my help or wanna help me, here is my Discord: Cheleber#0967
--]]-----------------------------------------------------------------------|

-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

------------------- STARTING!
local seconds = 0
local minutes = 0
local hours = 0
local days = 0
local timechecked = false
local count = 0

-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

------------------ CHECK THE TIME ON SPAWN
Citizen.CreateThread(function()
    while true do
        Wait(0)
		TriggerServerEvent('onlinetime_sql:time')
		return
    end
end)

-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

------------------ RETRIEVING THE TIME ON SPAWN
RegisterNetEvent('onlinetime_sql:sendDados')
AddEventHandler('onlinetime_sql:sendDados', function(s, m, h, d)
    seconds = s
	minutes = m
    hours = h 
    days = d
    timechecked = true -- STARTS THE COUNT OF THE ONLINE TIME
end)


-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

-- THE MASTER COUNTER 
Citizen.CreateThread(function()
	while true do
		Citizen.Wait(1000)
		if timechecked == true then
		    count = count + 1
			seconds = seconds + 1
			if seconds == 60 then
			    seconds = 0
			    minutes = minutes + 1
				if minutes == 60 then
				    minutes = 0
				    hours = hours + 1
				    if hours == 24 then
					    hours = 0
				        days = days + 1
				    end
				end
			end
		end
		TriggerServerEvent("onlinetime_sql:savetime", seconds, minutes, hours, days)
		if count == savetime then
		    count = 0
		    TriggerServerEvent("onlinetime_sql:savetimedb", seconds, minutes, hours, days) 
		end
	end
end)
