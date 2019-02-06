--[[

  ESX RP Chat

--]]

RegisterNetEvent('sendProximityMessage')
AddEventHandler('sendProximityMessage', function(id, name, message)
  local myId = PlayerId()
  local pid = GetPlayerFromServerId(id)
  if pid == myId then
    TriggerEvent('chatMessage', "^9OOC | " .. name .. "", {0, 153, 204}, "^0 " .. message)
  elseif GetDistanceBetweenCoords(GetEntityCoords(GetPlayerPed(myId)), GetEntityCoords(GetPlayerPed(pid)), true) > 1.1 then
    TriggerEvent('chatMessage', "^9OOC | " .. name .. "", {0, 153, 204}, "^0 " .. message)
  end
end)

