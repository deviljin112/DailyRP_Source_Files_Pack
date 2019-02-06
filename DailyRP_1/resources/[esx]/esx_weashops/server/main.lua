ESX               = nil
local ItemsLabels = {}

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

function LoadLicenses (source)
  TriggerEvent('esx_license:getLicenses', source, function (licenses)
    TriggerClientEvent('esx_weashop:loadLicenses', source, licenses)
  end)
end

if Config.EnableLicense == true then
  AddEventHandler('esx:playerLoaded', function (source)
    LoadLicenses(source)
  end)
end

RegisterServerEvent('esx_weashop:buyLicense')
AddEventHandler('esx_weashop:buyLicense', function ()
  local _source = source
  local xPlayer = ESX.GetPlayerFromId(source)

  if xPlayer.get('money') >= Config.LicensePrice then
    xPlayer.removeMoney(Config.LicensePrice)

    TriggerEvent('esx_license:addLicense', _source, 'weapon', function ()
      LoadLicenses(_source)
    end)
  else
    TriggerClientEvent('esx:showNotification', _source, _U('not_enough'))
  end
end)


ESX.RegisterServerCallback('esx_weashop:requestDBItems', function(source, cb)

  MySQL.Async.fetchAll(
    'SELECT * FROM weashops',
    {},
    function(result)

      local shopItems  = {}

      for i=1, #result, 1 do

        if shopItems[result[i].name] == nil then
          shopItems[result[i].name] = {}
        end

        table.insert(shopItems[result[i].name], {
          name  = result[i].item,
          price = result[i].price,
          label = ESX.GetWeaponLabel(result[i].item)
        })

      end

      cb(shopItems)

    end
  )

end)

RegisterServerEvent('esx_weashop:buyItem')
AddEventHandler('esx_weashop:buyItem', function(itemName, price, zone)

  local _source = source
  local xPlayer  = ESX.GetPlayerFromId(source)
 

  if zone=="BlackWeashop" then
    if xPlayer.get('money') >= price then

    xPlayer.removeMoney(price)
    xPlayer.addWeapon(itemName, 42)
    TriggerClientEvent('esx:showNotification', _source, _U('buy') .. ESX.GetWeaponLabel(itemName))

  else
    TriggerClientEvent('esx:showNotification', _source, _U('not_enough'))
  end

  else if xPlayer.get('money') >= price then

    xPlayer.removeMoney(price)
    xPlayer.addWeapon(itemName, 42)

    TriggerClientEvent('esx:showNotification', _source, _U('buy') .. ESX.GetWeaponLabel(itemName))

  else
    TriggerClientEvent('esx:showNotification', _source, _U('not_enough'))
  end
  end

end)


RegisterServerEvent('esx_weashop:buyCaricatore')
AddEventHandler('esx_weashop:buyCaricatore', function(zone)

  local _source = source
  local xPlayer  = ESX.GetPlayerFromId(source)
  local price = 0
  local sourceItem = xPlayer.getInventoryItem('clip')

  if zone=="BlackWeashop" then
    if xPlayer.get('money') >= 500 then
		if sourceItem.limit ~= -1 and (sourceItem.count + 1) > sourceItem.limit then
		TriggerClientEvent('esx:showNotification', _source, 'Already you have the max amount of clips!')
		else
    xPlayer.removeMoney(500)
    xPlayer.addInventoryItem('clip', 1)
    TriggerClientEvent('esx:showNotification', _source, 'You brought a clip')
	end
  else
    TriggerClientEvent('esx:showNotification', _source, _U('not_enough'))
  end
  
  else 
  
	if xPlayer.get('money') >= 3000 then
	if sourceItem.limit ~= -1 and (sourceItem.count + 1) > sourceItem.limit then
		TriggerClientEvent('esx:showNotification', _source, 'Already you have the max amount of clips!')
	else
    xPlayer.removeMoney(3000)
    xPlayer.addInventoryItem('clip', 1)
    TriggerClientEvent('esx:showNotification', _source, 'You brought a clip')
	end
  else
    TriggerClientEvent('esx:showNotification', _source, _U('not_enough'))
  end
  end

end)