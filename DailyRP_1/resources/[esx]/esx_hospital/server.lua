
ESX 				= nil
local defaultsecs   = 300
local maxsecs 		= 9999

-----------------------------

--ESX base
TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

local xPlayers 		= ESX.GetPlayers()

AddEventHandler('chatMessage', function(source, n, message)
	cm = stringsplit(message, " ")
	local xPlayer 		= ESX.GetPlayerFromId(source)

		
		if cm[1] == "/hrelease" then
			if xPlayer.job.name == 'police' or  xPlayer.job.name == 'ambulance' then
				CancelEvent()
				local tPID = tonumber(cm[2])
				if GetPlayerName(tPID) ~= nil then
					print("released ".. GetPlayerName(tPID).. " by ".. GetPlayerName(source))
					TriggerClientEvent("UnHB", tPID)
				end
				TriggerEvent('HRelease', tPID)
				-- Bed 1
			else
				TriggerClientEvent('chatMessage', -1, 'SYSTEM', { 255, 0, 0 }, "You do not have the right to put people in the hospital!")
			end
		elseif cm[1] == "/bed1" then
			if xPlayer.job.name == 'police' or  xPlayer.job.name == 'ambulance' then
				CancelEvent()
				local tPID = tonumber(cm[2])
				local hT = defaultsecs
					if cm[3] ~= nil then
						hT = tonumber(cm[3]) * 60					
					end
				local reason = tostring(cm[4])
				if hT > maxsecs then
					hT = maxsecs
				end
				if GetPlayerName(tPID) ~= nil then
					print("Put in the hospital: ".. GetPlayerName(tPID).. " for ".. hT .." secs- entry done by ".. GetPlayerName(source))
					local identifier = GetPlayerIdentifiers(tPID)[1]
					local name = GetPlayerName(source)
					local id = GetPlayerIdentifiers(source)[1]
					MySQL.Async.execute("INSERT INTO hospital (identifier,H_Time,H_Bed,Medic,Medic_ID, reason) VALUES (@identifier,@H_Time,@H_Bed,@MEDIC,@MID, @reason)",
						{['@identifier'] = identifier,
						['@H_Time'] = hT,
						['@H_Bed'] = "HB1",
						['@MEDIC'] = name,
						['@MID'] = id,
						['@reason'] = reason})
					TriggerClientEvent("HB1", tPID, hT)
					TriggerClientEvent('chatMessage', -1, 'Doctor', { 255, 0, 0 }, GetPlayerName(tPID) ..' has been hospitalized '.. hT ..' secs')
					TriggerClientEvent("pNotify:SendNotification", tPID, {
						text = "You have been admitted to bed 1!",
						type = "error",
						queue = "lmao",
						timeout = 10000,
						layout = "centerLeft"
					})
				end
				-- Bed 2
			else
				TriggerClientEvent('chatMessage', -1, 'SYSTEM', { 255, 0, 0 }, "You do not have the right to put people in the hospital!")
			end
		elseif cm[1] == "/bed2" then
			if xPlayer.job.name == 'police' or  xPlayer.job.name == 'ambulance' then
				CancelEvent()
				local tPID = tonumber(cm[2])
				local hT = defaultsecs
					if cm[3] ~= nil then
						hT = tonumber(cm[3]) * 60					
					end
				local reason = tostring(cm[4])
				if hT > maxsecs then
					hT = maxsecs
				end
				if GetPlayerName(tPID) ~= nil then
					print("Put in the hospital: ".. GetPlayerName(tPID).. " for ".. hT .." secs- entry done by ".. GetPlayerName(source))
					local identifier = GetPlayerIdentifiers(tPID)[1]
					local name = GetPlayerName(source)
					local id = GetPlayerIdentifiers(source)[1]
					MySQL.Async.execute("INSERT INTO hospital (identifier,H_Time,H_Bed,Medic,Medic_ID, reason) VALUES (@identifier,@H_Time,@H_Bed,@MEDIC,@MID, @reason)",
						{['@identifier'] = identifier,
						['@H_Time'] = hT,
						['@H_Bed'] = "HB2",
						['@MEDIC'] = name,
						['@MID'] = id,
						['@reason'] = reason})
					TriggerClientEvent("HB2", tPID, hT)
					TriggerClientEvent('chatMessage', -1, 'Doctor', { 255, 0, 0 }, GetPlayerName(tPID) ..' has been hospitalized '.. hT ..' secs')
					TriggerClientEvent("pNotify:SendNotification", tPID, {
						text = "You have been admitted to bed 2!",
						type = "error",
						queue = "lmao",
						timeout = 10000,
						layout = "centerLeft"
					})
				end
			else
				TriggerClientEvent('chatMessage', -1, 'SYSTEM', { 255, 0, 0 }, "You do not have the right to put people in the hospital!")
			end
			
		elseif cm[1] == "/hbill" then
			if xPlayer.job.name == 'police' or  xPlayer.job.name == 'ambulance' then
				CancelEvent()
				local tPID = tonumber(cm[2])
				local fine = tonumber(cm[3])
				local xPlayer = ESX.GetPlayerFromId(tPID)
				xPlayer.removeMoney(fine) 
				TriggerClientEvent('chatMessage', -1, 'Hospital', { 0, 0, 255 }, "ID "..tPID.." Has Been Charged ".. fine.." Dollars!")
				TriggerClientEvent("pNotify:SendNotification", tPID, {
					text = "You have been charged $"..fine,
					type = "error",
					queue = "lmao",
					timeout = 10000,
					layout = "centerLeft"
				})
			else
				TriggerClientEvent('chatMessage', -1, 'SYSTEM', { 255, 0, 0 }, "You do not have the right to charge people!")
			end
			
			-- Bed 3
			--else
			--	TriggerClientEvent('chatMessage', -1, 'SYSTEM', { 255, 0, 0 }, "You do not have the right to put people in the hospital!")
			--end
		elseif cm[1] == "/bed3" then
			if xPlayer.job.name == 'police' or  xPlayer.job.name == 'ambulance' then
				CancelEvent()
				local tPID = tonumber(cm[2])
				local hT = defaultsecs
					if cm[3] ~= nil then
						hT = tonumber(cm[3]) * 60					
					end
				local reason = tostring(cm[4])
				if hT > maxsecs then
					hT = maxsecs
				end
				if GetPlayerName(tPID) ~= nil then
					print("Put in the hospital: ".. GetPlayerName(tPID).. " for ".. hT .." secs- entry done by ".. GetPlayerName(source))
					local identifier = GetPlayerIdentifiers(tPID)[1]
					local name = GetPlayerName(source)
					local id = GetPlayerIdentifiers(source)[1]
					MySQL.Async.execute("INSERT INTO hospital (identifier,H_Time,H_Bed,Medic,Medic_ID, reason) VALUES (@identifier,@H_Time,@H_Bed,@MEDIC,@MID, @reason)",
						{['@identifier'] = identifier,
						['@H_Time'] = hT,
						['@H_Bed'] = "HB3",
						['@MEDIC'] = name,
						['@MID'] = id,
						['@reason'] = reason})
					TriggerClientEvent("HB3", tPID, hT)
					TriggerClientEvent('chatMessage', -1, 'Doctor', { 255, 0, 0 }, GetPlayerName(tPID) ..' has been hospitalized '.. hT ..' secs')
					TriggerClientEvent("pNotify:SendNotification", tPID, {
						text = "You have been admitted to bed 3!",
						type = "error",
						queue = "lmao",
						timeout = 10000,
						layout = "centerLeft"
					})
				end
			else
				TriggerClientEvent('chatMessage', -1, 'SYSTEM', { 255, 0, 0 }, "You do not have the right to put people in the hospital!")
			end
		end
end)

RegisterServerEvent("HospitalCheck")
AddEventHandler("HospitalCheck", function()
	local player = source
--print("SOURCE = "..source)
--print("PLAYER = "..player)
	local identifier = GetPlayerIdentifiers(source)[1]
	MySQL.Async.fetchAll('SELECT * FROM hospital WHERE identifier=@id', {['@id'] = identifier}, function(gotInfo)
		if gotInfo[1] ~= nil then
			if gotInfo[1].identifier == GetPlayerIdentifiers(player)[1] then
				TriggerClientEvent(gotInfo[1].H_Bed, player, gotInfo[1].H_Time)
			end
		else
		end
	end)
end)

RegisterServerEvent("HospitalUpdate")
AddEventHandler("HospitalUpdate", function(newTime)
	local player = source
print("SOURCE="..source)
        player = source
print("TIME REMAINING="..newTime)
	local identifier = GetPlayerIdentifiers(player)[1]
	MySQL.Async.execute("UPDATE hospital SET H_Time=@TIME WHERE identifier=@identifier", {["@TIME"] = newTime, ['@identifier'] = identifier})
        if newTime == 0 then
            local player = source
	    local identifier = GetPlayerIdentifiers(player)[1]
	    --local newID = "RELEASED=" .. identifier
	    --MySQL.Async.execute("UPDATE hospital SET H_Time=@Time WHERE identifier=@identifier", {["@Time"] = 0, ['@identifier'] = identifier})
	    --MySQL.Async.execute("UPDATE hospital SET identifier=@ID WHERE identifier=@identifier", {["@ID"] = newID, ['@identifier'] = identifier})
		MySQL.Async.execute("DELETE FROM hospital WHERE identifier=@identifier", {['@identifier'] = identifier})
        end
end)

RegisterServerEvent("HRelease")
AddEventHandler("HRelease", function(source)
print("PLAYER "..source.." IS NOW RELEASED FROM DOCTOR'S CARE")
	local player = source
	local identifier = GetPlayerIdentifiers(player)[1]
	--local newID = "RELEASED=" .. identifier
	--MySQL.Async.execute("UPDATE hospital SET H_Time=@Time WHERE identifier=@identifier", {["@Time"] = 0, ['@identifier'] = identifier})
	MySQL.Async.execute("DELETE FROM hospital WHERE identifier=@identifier", {['@identifier'] = identifier})
	--MySQL.Async.execute("UPDATE hospital SET identifier=@ID WHERE identifier=@identifier", {["@ID"] = newID, ['@identifier'] = identifier})
end)
--[[
RegisterServerEvent("HReleaseTime")
AddEventHandler("HRelease", function()
print("PLAYER "..source.."IS NOW RELEASED FROM DOCTOR'S CARE")
	local player = source
	local identifier = GetPlayerIdentifiers(player)[1]
	local newID = "RELEASED=" .. identifier
	--MySQL.Async.execute("UPDATE hospital SET H_Time=@Time WHERE identifier=@identifier", {["@Time"] = 0, ['@identifier'] = identifier})
	MySQL.Async.execute("DELETE FROM hospital WHERE identifier=@identifier", {['@identifier'] = identifier})
	--MySQL.Async.execute("UPDATE hospital SET identifier=@ID WHERE identifier=@identifier", {["@ID"] = newID, ['@identifier'] = identifier})
end)
]]--
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
