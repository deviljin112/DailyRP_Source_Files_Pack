ESX = nil
--Alterar Society para outro nome society_club?
TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

if Config.MaxInService ~= -1 then
  TriggerEvent('esx_service:activateService', 'biker', Config.MaxInService)
end

TriggerEvent('esx_society:registerSociety', 'biker', 'Biker', 'society_biker', 'society_biker', 'society_biker', {type = 'public'})


RegisterServerEvent('esx_club:getStockItem')
AddEventHandler('esx_club:getStockItem', function(itemName, count)

  local xPlayer = ESX.GetPlayerFromId(source)

  TriggerEvent('esx_addoninventory:getSharedInventory', 'society_biker', function(inventory)

    local item = inventory.getItem(itemName)

    if item.count >= count then
      inventory.removeItem(itemName, count)
      xPlayer.addInventoryItem(itemName, count)
    else
      TriggerClientEvent('esx:showNotification', xPlayer.source, _U('quantity_invalid'))
    end

    TriggerClientEvent('esx:showNotification', xPlayer.source, _U('have_withdrawn') .. count .. ' ' .. item.label)

  end)

end)

RegisterServerEvent('esx_club:putStockItems')
AddEventHandler('esx_club:putStockItems', function(itemName, count)

  local xPlayer = ESX.GetPlayerFromId(source)

  TriggerEvent('esx_addoninventory:getSharedInventory', 'society_biker', function(inventory)

    local item = inventory.getItem(itemName)

    if item.count >= 0 then
      xPlayer.removeInventoryItem(itemName, count)
      inventory.addItem(itemName, count)
    else
      TriggerClientEvent('esx:showNotification', xPlayer.source, _U('quantity_invalid'))
    end

    TriggerClientEvent('esx:showNotification', xPlayer.source, _U('added') .. count .. ' ' .. item.label)

  end)

end)


ESX.RegisterServerCallback('esx_club:getStockItems', function(source, cb)

  TriggerEvent('esx_addoninventory:getSharedInventory', 'society_biker', function(inventory)
    cb(inventory.items)
  end)

end)

ESX.RegisterServerCallback('esx_club:getPlayerInventory', function(source, cb)

  local xPlayer = ESX.GetPlayerFromId(source)
  local items   = xPlayer.inventory

  cb({
    items = items
  })

end)
