
ESX = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

ESX.RegisterUsableItem('mask', function(source)
 	TriggerClientEvent('esx_copweapon:mask',source)
end)
