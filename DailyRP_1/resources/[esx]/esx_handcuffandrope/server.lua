ESX               = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

ESX.RegisterUsableItem('rope', function(source)
	local xPlayer = ESX.GetPlayerFromId(source)

	TriggerClientEvent('esx_handcuffandrope:ropecheck', source)
end)

RegisterServerEvent('esx_handcuffandrope:unlocking')
AddEventHandler('esx_handcuffandrope:unlocking', function(source)
  TriggerClientEvent('esx_handcuffandrope:unlockingcuffs', source)
end)

ESX.RegisterUsableItem('handcuffs', function(source)
	local xPlayer = ESX.GetPlayerFromId(source)
	TriggerClientEvent('esx_handcuffandrope:cuffcheck', source)
end)

RegisterServerEvent('esx_handcuffandrope:cuffing')
AddEventHandler('esx_handcuffandrope:cuffing', function(source)
  TriggerClientEvent('esx_handcuffandrope:cuff', source)
end)

ESX.RegisterUsableItem('key', function(source)
	local xPlayer = ESX.GetPlayerFromId(source)
	xPlayer.removeInventoryItem('key', 1)
	TriggerClientEvent('esx_handcuffandrope:unlockingcuffs', source)
end)

RegisterServerEvent('esx_handcuffandrope:unlocking')
AddEventHandler('esx_handcuffandrope:unlocking', function(source)
  TriggerClientEvent('esx_handcuffandrope:unlockingcuffs', source)
end)
