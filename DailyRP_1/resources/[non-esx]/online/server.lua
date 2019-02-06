--[[-----------------------------------------------------------------------|
Made by Cheleber - Hope you Enjoy
My Server: www.grandetheftlusitan.com
If you need my help or wanna help me, here is my Discord: Cheleber#0967
--]]-----------------------------------------------------------------------|

-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

------------------- STARTING!
local se = {}
local mi = {}
local hr = {}
local di = {}
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

-- CHECKING THE PLAYER TIME WHEN HE JOINS THE SERVER
RegisterServerEvent("onlinetime_sql:time")
AddEventHandler("onlinetime_sql:time", function()
	local _source = source
	local identifier = GetPlayerIdentifiers(_source)[1]
	MySQL.Async.fetchAll('SELECT * FROM times WHERE identifier=@id', {['@id'] = identifier}, function(gotInfo)
		if gotInfo[1] ~= nil then
		    TriggerClientEvent("onlinetime_sql:sendDados", _source, gotInfo[1].Seconds, gotInfo[1].Minutes, gotInfo[1].Hours, gotInfo[1].Days)
		else
			local news = 0
			local newm = 0
		    local newh = 0
		    local newd = 0
			MySQL.Async.execute("INSERT INTO times (identifier, Seconds, Minutes, Hours, Days) VALUES (@Identifier,@Seconds,@Minutes,@Hours,@Days)", {['@identifier'] = identifier, ['@Seconds'] = news, ['@Minutes'] = newm, ['@Hours'] = newh, ['@Days'] = newd})
			TriggerClientEvent("onlinetime_sql:sendDados", _source, news, newm, newh, newd)
		end
	end)
end)

-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

-- SAVING THE TIME IN THE TABLES
RegisterServerEvent("onlinetime_sql:savetime")
AddEventHandler("onlinetime_sql:savetime", function(s, m, h, d)
	local _source = source
	se[_source] = {
        ['total'] = s
    }	
    mi[_source] = {
        ['total'] = m
    }
    hr[_source] = {
        ['total'] = h
    }
    di[_source] = {
        ['total'] = d
    }	
end)

-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

-- SAVING THE TIME IN THE DB
RegisterServerEvent("onlinetime_sql:savetimedb")
AddEventHandler("onlinetime_sql:savetimedb", function(s, m, h, d)
	local _source = source
	local identifier = GetPlayerIdentifiers(_source)[1]	
    MySQL.Async.execute("UPDATE times SET Seconds=@SECONDS WHERE identifier=@identifier", {["@SECONDS"] = s, ['@identifier'] = identifier})
	MySQL.Async.execute("UPDATE times SET Minutes=@MINUTES WHERE identifier=@identifier", {["@MINUTES"] = m, ['@identifier'] = identifier})
    MySQL.Async.execute("UPDATE times SET Hours=@HOURS WHERE identifier=@identifier", {["@HOURS"] = h, ['@identifier'] = identifier})
	MySQL.Async.execute("UPDATE times SET Days=@DAYS WHERE identifier=@identifier", {["@DAYS"] = d, ['@identifier'] = identifier}) 
end)

-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

-- SAVING THE TIME WHEN PLAYER DISCONNECT
AddEventHandler('playerDropped', function() 
    local _source = source
	local identifier = GetPlayerIdentifiers(_source)[1]	
	MySQL.Async.execute("UPDATE times SET Minutes=@MINUTES WHERE identifier=@identifier", {["@MINUTES"] = mi[source].total, ['@identifier'] = identifier})
    MySQL.Async.execute("UPDATE times SET Hours=@HOURS WHERE identifier=@identifier", {["@HOURS"] = hr[source].total, ['@identifier'] = identifier})
	MySQL.Async.execute("UPDATE times SET Days=@DAYS WHERE identifier=@identifier", {["@DAYS"] = di[source].total, ['@identifier'] = identifier})   
end)


-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

-- COMMANDS /ot and /onlintime

AddEventHandler('chatMessage', function(source, color, msg)
	cm = stringsplit(msg, " ")
	if cm[1] == "/ot" or cm[1] == "/onlinetime" then
		CancelEvent()
		local name = GetPlayerName(source)
		if tablelength(cm) == 1 then
			local segundo = tonumber(se[source].total)
			local minuto = tonumber(mi[source].total)
			local hora = tonumber(hr[source].total)
			local dia = tonumber(di[source].total)
			segundo = math.floor(segundo)
			minuto = math.floor(minuto)
			hora = math.floor(hora)
			dia = math.floor(dia)
			if segundo <= 9 then
			    segundo = '0'.. tostring(segundo)
			end
			if minuto <= 9 then
			    minuto = '0'.. tostring(minuto)
		    end
			if hora <= 9 then
			    hora = '0'.. tostring(hora)
			end
			if dia > 0 then
				if dia == 1 then
					TriggerClientEvent('chatMessage', source, "YOUR ONLINE TIME" , {255, 0, 0}, "Player: " .. name .. " | " .. tostring(dia) .. " Day | " .. hora .. ":" .. minuto .. ":" .. segundo .. "")    
			    else
				    TriggerClientEvent('chatMessage', source, "YOUR ONLINE TIME" , {255, 0, 0}, "Player: " .. name .. " | " .. tostring(dia) .. " Days |  " .. hora .. ":" .. minuto .. ":" .. segundo .. "")          
				end
			else
				TriggerClientEvent('chatMessage', source, "YOUR ONLINE TIME" , {255, 0, 0}, "Player: " .. name .. " |  " .. hora .. ":" .. minuto .. ":" .. segundo .. "")    
		    end
		end
		if tablelength(cm) == 2 then
		    if tonumber(cm[2]) then
		    local tPID = tonumber(cm[2])
			    local name = GetPlayerName(tPID)
				if name ~= nil then			    
				    local segundo = tonumber(se[tPID].total)
				    local minuto = tonumber(mi[tPID].total)
				    local hora = tonumber(hr[tPID].total)
				    local dia = tonumber(di[tPID].total)
			        segundo = math.floor(segundo)
			        minuto = math.floor(minuto)
			        hora = math.floor(hora)
			        dia = math.floor(dia)
			        if segundo <= 9 then
			            segundo = '0'.. tostring(segundo)
			        end
			        if minuto <= 9 then
			            minuto = '0'.. tostring(minuto)
		            end
			        if hora <= 9 then
			            hora = '0'.. tostring(hora)
			        end
				    if dia > 0 then
				        if dia == 1 then
							if name ~= GetPlayerName(source) then
						        TriggerClientEvent('chatMessage', source, "ONLINE TIME" , {255, 0, 0}, "Player: " .. name .. " | " .. tostring(dia) .." Day | " .. hora .. ":" .. minuto .. ":" .. segundo .. "")       
						    else
								TriggerClientEvent('chatMessage', source, "YOUR ONLINE TIME" , {255, 0, 0}, "Player: " .. name .. " | " .. tostring(dia) .." Day | " .. hora .. ":" .. minuto .. ":" .. segundo .. "")     
						    end
						else
							if name ~= GetPlayerName(source) then
						        TriggerClientEvent('chatMessage', source, "ONLINE TIME" , {255, 0, 0}, "Player: " .. name .. " | " .. tostring(dia) .." Days | " .. hora .. ":" .. minuto .. ":" .. segundo .. "")         
						    else
								TriggerClientEvent('chatMessage', source, "YOUR ONLINE TIME" , {255, 0, 0}, "Player: " .. name .. " | " .. tostring(dia) .." Days | " .. hora .. ":" .. minuto .. ":" .. segundo .. "")     
						    end
					    end
				    else
					    if name ~= GetPlayerName(source) then
						    TriggerClientEvent('chatMessage', source, "ONLINE TIME" , {255, 0, 0}, "Player: " .. name .. " | " .. hora .. ":" .. minuto .. ":" .. segundo .. "")           
						else
						    TriggerClientEvent('chatMessage', source, "YOUR  ONLINE TIME" , {255, 0, 0}, "Player: " .. name .. " | " .. hora .. ":" .. minuto .. ":" .. segundo .. "")     
						end
					end
			    else
				    TriggerClientEvent('chatMessage', source, "SYSTEM", {255, 0, 0}, "Invalid Player ID!")
				end
	        end	
		end
		if tablelength(cm) > 2 then
		    TriggerClientEvent('chatMessage', source, "SYSTEM", {255, 0, 0}, "Incorrect use, use: /ot or /onlinetime")
			TriggerClientEvent('chatMessage', source, "SYSTEM", {255, 0, 0}, "To see other players time, use: /ot [ID] or /onlinetime [ID]")
		end
	end		
end)

-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

-- USEFUL FUNCTIONS

function stringsplit(inputstr, sep)
    if sep == nil then
        sep = "%s"
    end
    local t={} ; i=1
    for str in string.gmatch(inputstr, "([^"..sep.."]+)") do
        t[i] = str
        i = i + 1
    end
    return t
end


function tablelength(T)
	local count = 0
	for _ in pairs(T) do count = count + 1 end
	return count
end