--[[Info]]--

require "resources/essentialmode/lib/MySQL"
MySQL:open("127.0.0.1", "DBNAME", "root", "password")



--[[Register]]--

RegisterServerEvent("dmv:success")
RegisterServerEvent("dmv:LicenseStatus")
RegisterServerEvent("dmv:ttcharge")
RegisterServerEvent("dmv:dtcharge")

--[[DMV TheoryTest]]--

AddEventHandler("dmv:success", function()
	TriggerEvent("es:getPlayerFromId", source, function(player)
		MySQL:executeQuery("UPDATE users SET DmvTest='Passed' WHERE identifier = '@username'", { ['@username'] = player.identifier})
	end)
end)

AddEventHandler("dmv:ttcharge", function()
  TriggerEvent('es:getPlayerFromId', source, function(user)
	local ttest = 200  
      user:removeMoney((ttest))    
	end)
end)

AddEventHandler("dmv:dtcharge", function()
  TriggerEvent('es:getPlayerFromId', source, function(user)
	local dtest = 500  	
      user:removeMoney((dtest))    
	end)
end)

--[[ ***** SPAWN CHECK ***** ]]
AddEventHandler("dmv:LicenseStatus", function()
    TriggerEvent("es:getPlayerFromId", source, function(player)
		local executed_query = MySQL:executeQuery("SELECT * FROM users WHERE identifier = '@username'",{['@username'] = player.identifier})
		local result = MySQL:getResults(executed_query, {'DmvTest'}, "DmvTest")
        local LicStatus = result[1].DmvTest
        if (LicStatus == "Required") then
            TriggerClientEvent('dmv:CheckLicStatus',source)
        end
    end)
end)