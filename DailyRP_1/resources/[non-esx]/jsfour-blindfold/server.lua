local ESX = nil

-- ESX
TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

-- Sätt på/ta av ögonbindel
RegisterServerEvent('jsfour-blindfold')
AddEventHandler('jsfour-blindfold', function( player, hasItem )
  local src = source
  TriggerClientEvent('jsfour-blindfold', player, hasItem, src)
end)

-- Notis skickas om spelaren inte har en ögonbindel
RegisterServerEvent('jsfour-blindfold:notis')
AddEventHandler('jsfour-blindfold:notis', function( src )
  TriggerClientEvent('esx:showNotification', src, 'ummm...')
end)

-- Ger spelaren en ögonbindel
RegisterServerEvent('jsfour-blindfold:giveItem')
AddEventHandler('jsfour-blindfold:giveItem', function( src )
  local xPlayer = ESX.GetPlayerFromId(src)
end)

-- Kollar om spelaren har en ögonbindel
ESX.RegisterServerCallback('jsfour-blindfold:itemCheck', function( src, cb )
  local xPlayer = ESX.GetPlayerFromId(src)
  local item    = xPlayer.getInventoryItem('blindfold').count
  if item > 0 then
    cb(true)
  else
    cb(false)
  end
end)

ESX.RegisterUsableItem('blindfold', function(source)
  TriggerClientEvent('jsfour-blindfold:used',source)
end)