ESX                           = nil

local Licenses                = {}

Citizen.CreateThread(function()
  while ESX == nil do
    TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
    Citizen.Wait(0)
  end
end)

RegisterNetEvent('NoLicense:loadLicenses')
AddEventHandler('NoLicense:loadLicenses', function (licenses)
    for i = 1, #licenses, 1 do
      Licenses[licenses[i].type] = true
    end
end)



Citizen.CreateThread(function()
    while true do
      
      Citizen.Wait(0)

      TriggerEvent('esx_license:getLicenses', source, function (licenses)
        TriggerEvent('NoLicense:loadLicenses', source, licenses)
      end)

      Citizen.Wait(0)
 
      if(IsPedInAnyVehicle(GetPlayerPed(-1), false)) and (not Licenses['dmv'] or not Licenses['drive']) and CurrentTest ~= 'drive' then
        DrawMissionText("Nie masz ~r~prawa jazdy~w~! Idz je zrobic zanim zlapie cie ~b~policja~w~!", 2000)
      end

    end
end)

function DrawMissionText(m_text, showtime)
  ClearPrints()
  SetTextEntry_2("STRING")
  AddTextComponentString(m_text)
  DrawSubtitleTimed(showtime, 1)
end