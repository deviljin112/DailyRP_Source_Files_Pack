---------------------------------------------------------------------------
-- Adds New Database without needing to add an SQL Query Manually TO BE DONE!
---------------------------------------------------------------------------
MySQL.ready(function()
    MySQL.Async.execute("CREATE TABLE IF NOT EXISTS `mapblips` (`identifier` varchar(255) COLLATE utf8_unicode_ci NOT NULL,`accesstosee` int(11) NOT NULL DEFAULT '0')")
end)

---------------------------------------------------------------------------
-- Check Data Before Adding / Possibly duplicating data!
---------------------------------------------------------------------------
RegisterNetEvent("TreasureMap:CheckBeforeAddingIntoDatabase")
AddEventHandler("TreasureMap:CheckBeforeAddingIntoDatabase", function()
	local src = source
	CheckData(src, function(results)
		if results then
			TriggerClientEvent("chatMessage", src, "[Treasure Map]", {255,223,0}, "you have found this before!")
			TriggerClientEvent("TreasureMap:DisplayBlips", src)
		else 
			TriggerClientEvent("chatMessage", src, "[Treasure Map]", {255,223,0}, "Well-Done you have found a treasure map!")
			TriggerClientEvent("TreasureMap:NeedsAddingIntoDatabase", src)
			print("Sending Client Event to add data to DB!")
		end
	end)
end)

---------------------------------------------------------------------------
-- Check The Player Treasure Map Status On Spawn In!
---------------------------------------------------------------------------
RegisterNetEvent("TreasureMap:CheckOnPlayerSpawn")
AddEventHandler("TreasureMap:CheckOnPlayerSpawn", function()
	local src = source
	CheckData(src, function(results)
		if results then
			print("Has Found Map Before, Allowing Blips!")
			TriggerClientEvent("TreasureMap:DisplayBlips", src)
		else 
			print("Has not found map before, Not Allowing Blips!")
		end
	end)
end)
----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- This Adds The Players Information Into The Database GANG GANG SKRT SKRT! EZ PZ.
----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
RegisterNetEvent("TreasureMap:AddIntoDataBase")
AddEventHandler("TreasureMap:AddIntoDataBase", function()
		local src = source
        local identifier = getIdentifiant("license", src)
        local accesstosee = 1
        MySQL.Async.execute("INSERT INTO mapblips (identifier,accesstosee) values (@identifier,@accesstosee)", {
			['@identifier'] = identifier, ['@accesstosee'] = accesstosee
		}, function(result)
    end)
end)
---------------------------------------------------------------------------
-- Get Player ID (Standalone!) Linked with getIdentifiant() Functions
---------------------------------------------------------------------------
function getIdentifiant(type, id)
	local identifiers = {}
    local numIdentifiers = GetNumPlayerIdentifiers(id)

    for a = 0, numIdentifiers do
        table.insert(identifiers, GetPlayerIdentifier(id, a))
    end

    for b = 1, #identifiers do
        if string.find(identifiers[b], type, 1) then
            return identifiers[b]
        end
    end
	return false
end

---------------------------------------------------------------------------
-- Main Function To Check Player Data!    			@Xander1998 For Helping me <3
---------------------------------------------------------------------------
function CheckData(src, callback)
	MySQL.Async.fetchAll("SELECT * FROM mapblips WHERE identifier = @identifier", {
		["@identifier"] = getIdentifiant("license", src)
	}, function(results)
		if results[1] ~= nil then
			if results[1].accesstosee == 1 then
				callback(true)
			else
				callback(false)
			end
		else
			callback(false)
		end
	end)
end