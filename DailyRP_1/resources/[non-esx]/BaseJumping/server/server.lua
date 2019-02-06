--Script Name: BaseJumping for the ESX Framework.
--Description: This is a very simple script that in a nutshell gives you a parachute in exchange for $50 (this is configureable in the server.lua at line 28 and 30).
--There are locations on the map (that are marked with blips) so you know where they all are.
--Simply go to these locations, stand in the marker, press E and then jump. Make sure that when you jump, you left click to activate your Parachute.
--Author: Couga & the N3MTV Server.
--Modified by: BossManNz.
--Credits: Couga, N3MTV, American1, BossManNz.
--Additional Notes: Set the "enableFee" to false on line 14 if you wish to charge people for the parachute (great money sink for economy/role-play based servers in my opinion).


ESX = nil
TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

enableFee = true -- Set this to true if you want to charge people for Parachutes, or you can not be stingy like me and simply set it to false :).

AddEventHandler('esx:playerLoaded', function(source)
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)
end)

RegisterServerEvent('ogBj:baseJumpingCharge')
AddEventHandler('ogBj:baseJumpingCharge', function()
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)
	
	if enableFee then
	
	if(xPlayer.getMoney() >= 50) then
	TriggerClientEvent("pNotify:SendNotification", _source, {text = "<center><strong><b style='color:#B2FF33'>Base Jumping Notification</b><strong><br /> <br /> You have paid $50 to cover the cost of the Parachute... Feel free to jump!<center>", type = "success", queue = "global", timeout = 5000, layout = "centerRight" })
	xPlayer.removeMoney(50)
	
	else 
	
	TriggerClientEvent("pNotify:SendNotification", _source, {text = "<center><strong><b style='color:#B2FF33'>Base Jumping Notification</b><strong><br /> <br /> You do not have enough money to cover the cost of the Parachute.", type = "success", queue = "global", timeout = 5000, layout = "centerRight" })
	
	end
	
	else
	
	TriggerClientEvent("pNotify:SendNotification", _source, {text = "<center><strong><b style='color:#B2FF33'>Base Jumping Notification</b><strong><br /> <br /> You have been provided with a Parachute... Feel free to jump!<center>", type = "success", queue = "global", timeout = 5000, layout = "centerRight" })
    
	end
end)