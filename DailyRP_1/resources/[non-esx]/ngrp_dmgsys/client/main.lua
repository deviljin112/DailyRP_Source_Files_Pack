--------------------------------
--        NGRP.PL             --
-- Author: Ezi                --
-- Discord: Ezi#2639          --
-- Version: 0.1v              --
--                            --
--------------------------------

local lastBone = nil
local damagedParts = {}
local keyPressed = false
local nearDamage = {}

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(100)
        local FoundLastDamagedBone, LastDamagedBone = GetPedLastDamageBone(PlayerPedId())
        if FoundLastDamagedBone and LastDamagedBone ~= lastBone then
            local DamagedBone = getBoneName(LastDamagedBone)
            if DamagedBone then
                exports.pNotify:SendNotification({text = "You have recived damage <b>" .. DamagedBone .. "</b>", layout = "centerLeft", type = "error", timeout = 3000})
                TriggerEvent('ngrp_dmgsys:storeBones', LastDamagedBone)
                Citizen.Wait(0)
                lastBone = LastDamagedBone
            end
        end
    end
end)

Citizen.CreateThread(function()
  while true do
    Citizen.Wait(0)
    if IsControlPressed(1, UserKey) then
      if not keyPressed then
        TriggerServerEvent('ngrp_dmgsys:sendDamage')
        keyPressed = true
      end
    end
    if IsControlJustReleased(1, UserKey) then
      keyPressed = false
    end
  end
end)

Citizen.CreateThread(function()
  while true do
    Citizen.Wait(0)
    if keyPressed then
      for player, parts in pairs(nearDamage) do
        for k, part in pairs(parts) do
          local ped = GetPlayerPed(player)
          local pos, x, y, z = GetPedBoneCoords(ped, part.value, 0.10, 0, 0)
          local color = {r = 255, g = 255, b = 255}
          if part.count * 25 >= 50 then
            color = {r = 253, g = 106, b = 2}
          end
          if part.count * 25 >= 75 then
            color = {r = 237, g = 41, b = 57}
          end
          if part.count * 25 >= 100 then
            color = {r = 124, g = 10, b = 2}
          end
          DrawText3D(pos.x, pos.y, pos.z, 'Damage '..'['.. part.count * 25 ..'%]', color)
        end
      end
    end
  end
end)

Citizen.CreateThread(function()
  local ped = GetPlayerPed(-1)
  while true do
    Citizen.Wait(0)
    for k, part in pairs(damagedParts) do
        while part.count * 25 >= 100 and not IsEntityDead(ped) do
          local boneName = getBoneName(part.value)
          exports.pNotify:SendNotification({text = "You are bleeding from <b>" .. boneName .. "</b>. You will lose <b>5% of your health every 5 seconds</b>.", layout = "centerLeft", type = "error", timeout = 4200})
          local currentHealth = GetEntityHealth(ped)
          SetEntityHealth(ped, currentHealth - 5)
          Citizen.Wait(5000)
        end
      end
  end
end)


RegisterNetEvent('ngrp_dmgsys:storeBones')
AddEventHandler('ngrp_dmgsys:storeBones', function(bone)
  local currentCount = getDamagedCount(bone)
  if currentCount == 0 then
    table.insert(damagedParts, {value = bone, count = 1})
  else
    addDamagedCount(bone)
  end
  local id = PlayerId()
  TriggerServerEvent('ngrp_dmgsys:storeDamage', damagedParts, id)
end)

RegisterNetEvent('ngrp_dmgsys:receiveDamage')
AddEventHandler('ngrp_dmgsys:receiveDamage', function(damagedPlayers)
  nearDamage = {}
  for player, parts in pairs(damagedPlayers) do
    local ped = GetPlayerPed(-1)
    local ped2 = GetPlayerPed(player)
    local playerCoords = GetEntityCoords(ped)
    local playerCoords2 = GetEntityCoords(ped2)

    if(Vdist( playerCoords.x, playerCoords.y, playerCoords.z, playerCoords2.x, playerCoords2.y, playerCoords2.z) < 1.5)then
      nearDamage[player] = parts
    end
  end
end)

function getBoneName(boneId)
    for Key, Value in pairs(parts) do
        if boneId == Value then
            return Key
        end
    end
    return nil
end

function getBonePart(boneId)
    for element, Value in pairs(elements) do
        for k, Value in pairs(Value) do
            return element
        end
    end
    return nil
end

function getDamagedCount(part)
  for k, currentPart in pairs(damagedParts) do
    if currentPart.value == part then
      return currentPart.count
    end
  end
  return 0
end

function addDamagedCount(part, color)
  for k, currentPart in pairs(damagedParts) do
    if currentPart.value == part then
      currentPart.count = currentPart.count + 1
      break
    end
  end
end

function DrawText3D(x,y,z, text, color) -- some useful function, use it if you want!
  local onScreen,_x,_y=World3dToScreen2d(x,y,z)
  local px,py,pz=table.unpack(GetGameplayCamCoords())
  local dist = GetDistanceBetweenCoords(px,py,pz, x,y,z, 1)

  local scale = (1/dist)*2
  local fov = (1/GetGameplayCamFov())*100
  local scale = scale*fov

  if onScreen then
      SetTextScale(0.0*scale, 0.20*scale)
      SetTextFont(0)
      SetTextProportional(1)
      -- SetTextScale(0.0, 0.55)
      SetTextColour(color.r, color.b, color.g, 255)
      SetTextDropshadow(0, 0, 0, 0, 255)
      SetTextEdge(2, 0, 0, 0, 150)
      SetTextDropShadow()
      SetTextOutline()
      SetTextEntry("STRING")
      SetTextCentre(1)
      AddTextComponentString(text)
      DrawText(_x,_y)
  end
end



function dump(o)
   if type(o) == 'table' then
      local s = '{ '
      for k,v in pairs(o) do
         if type(k) ~= 'number' then k = '"'..k..'"' end
         s = s .. '['..k..'] = ' .. dump(v) .. ','
      end
      return s .. '} '
   else
      return tostring(o)
   end
end
