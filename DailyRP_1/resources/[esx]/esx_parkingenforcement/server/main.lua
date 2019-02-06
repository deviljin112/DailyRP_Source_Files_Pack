ESX = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

TriggerEvent('esx_phone:registerNumber', 'parking', _U('parking_customer'), true, true)
TriggerEvent('esx_society:registerSociety', 'parking', 'Parking', 'society_parking', 'society_parking', 'society_parking', {type = 'private'})

ESX.RegisterServerCallback('esx_parkingjob:getPlayerInventory', function(source, cb)

  local xPlayer    = ESX.GetPlayerFromId(source)
  local items      = xPlayer.inventory

  cb({
    items      = items
  })

end)

RegisterServerEvent('esx_parkingjob:ticketCurrentCar')
AddEventHandler('esx_parkingjob:ticketCurrentCar', function(currentCar)
	local veh = MySQL.Sync.fetchAll('SELECT * FROM owned_vehicles')
    local vehCount = 0
    for i=1, #veh, 1 do
      	local vehicle = veh[i].vehicle
      	if string.find(vehicle, currentCar) then
      		local xPlayer = ESX.GetPlayerFromIdentifier(veh[i].owner)
      		TriggerClientEvent('esx_parkingjob:doCivInvoice', source, xPlayer.source)
			TriggerClientEvent('esx:showNotification', source, "Ticket written for plate: "..currentCar)
			TriggerClientEvent('esx:showNotification', xPlayer.source, "You've been given a parking ticket.")
      		break
      	else
      		vehCount = vehCount + 1
      	end
    end
      if vehCount == #veh then
      	TriggerClientEvent('esx:showNotification', source, "Ticket written for plate: "..currentCar)
        TriggerEvent('esx_addonaccount:getSharedAccount', 'society_parking', function(account)
          account.addMoney(250)
        end)
      end
end)

RegisterServerEvent('esx_parkingjob:bootCurrentCar')
AddEventHandler('esx_parkingjob:bootCurrentCar', function(currentCar)
  local veh = MySQL.Sync.fetchAll('SELECT * FROM owned_vehicles')
    local vehCount = 0
    for i=1, #veh, 1 do
        local vehicle = veh[i].vehicle
        if string.find(vehicle, currentCar) then
          local xPlayer = ESX.GetPlayerFromIdentifier(veh[i].owner)
          TriggerClientEvent('esx_parkingjob:doCivBootInvoice', source, xPlayer.source)
          TriggerClientEvent('esx_parkingjob:doCivBootNotify', xPlayer.source)
      TriggerClientEvent('esx:showNotification', source, "Vehicle ~r~".. currentCar.."~s~ has been booted. You may now step out.")
          break
        else
          vehCount = vehCount + 1
        end
    end
      if vehCount == #veh then
        TriggerClientEvent('esx:showNotification', source, "Vehicle ~r~".. currentCar.."~s~ has been booted. You may now step out.")
        TriggerEvent('esx_addonaccount:getSharedAccount', 'society_parking', function(account)
          account.addMoney(500)
        end)
      end
end)
