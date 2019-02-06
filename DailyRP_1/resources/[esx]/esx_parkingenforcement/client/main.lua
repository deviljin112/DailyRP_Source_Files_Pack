local Keys = {
  ["ESC"] = 322, ["F1"] = 288, ["F2"] = 289, ["F3"] = 170, ["F5"] = 166, ["F6"] = 167, ["F7"] = 168, ["F8"] = 169, ["F9"] = 56, ["F10"] = 57,
  ["~"] = 243, ["1"] = 157, ["2"] = 158, ["3"] = 160, ["4"] = 164, ["5"] = 165, ["6"] = 159, ["7"] = 161, ["8"] = 162, ["9"] = 163, ["-"] = 84, ["="] = 83, ["BACKSPACE"] = 177,
  ["TAB"] = 37, ["Q"] = 44, ["W"] = 32, ["E"] = 38, ["R"] = 45, ["T"] = 245, ["Y"] = 246, ["U"] = 303, ["P"] = 199, ["["] = 39, ["]"] = 40, ["ENTER"] = 18,
  ["CAPS"] = 137, ["A"] = 34, ["S"] = 8, ["D"] = 9, ["F"] = 23, ["G"] = 47, ["H"] = 74, ["K"] = 311, ["L"] = 182,
  ["LEFTSHIFT"] = 21, ["Z"] = 20, ["X"] = 73, ["C"] = 26, ["V"] = 0, ["B"] = 29, ["N"] = 249, ["M"] = 244, [","] = 82, ["."] = 81,
  ["LEFTCTRL"] = 36, ["LEFTALT"] = 19, ["SPACE"] = 22, ["RIGHTCTRL"] = 70,
  ["HOME"] = 213, ["PAGEUP"] = 10, ["PAGEDOWN"] = 11, ["DELETE"] = 178,
  ["LEFT"] = 174, ["RIGHT"] = 175, ["TOP"] = 27, ["DOWN"] = 173,
  ["NENTER"] = 201, ["N4"] = 108, ["N5"] = 60, ["N6"] = 107, ["N+"] = 96, ["N-"] = 97, ["N7"] = 117, ["N8"] = 61, ["N9"] = 118
}

local PlayerData              = {}
local GUI                     = {}
local HasAlreadyEnteredMarker = false
local LastZone                = nil
local CurrentAction           = nil
local CurrentActionMsg        = ''
local CurrentActionData       = {}
local OnJob                   = false
local TargetCoords            = nil
local Blips                   = {}


ESX                           = nil
GUI.Time                      = 0

Citizen.CreateThread(function()
  while ESX == nil do
    TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
    Citizen.Wait(0)
  end
end)

function OpenParkingActionsMenu()

  local elements = {
    {label = "Vehicle List", value = 'vehicle_list'}
  }
  if Config.EnablePlayerManagement and PlayerData.job ~= nil and PlayerData.job.grade_name == 'boss' then
    table.insert(elements, {label = _U('boss_actions'), value = 'boss_actions'})
  end

  ESX.UI.Menu.CloseAll()

  ESX.UI.Menu.Open(
    'default', GetCurrentResourceName(), 'parking_actions',
    {
      title    = _U('parking'),
      elements = elements
    },
    function(data, menu)
      if data.current.value == 'vehicle_list' then

        if Config.EnableSocietyOwnedVehicles then

            local elements = {}

            ESX.TriggerServerCallback('esx_society:getVehiclesInGarage', function(vehicles)

              for i=1, #vehicles, 1 do
                table.insert(elements, {label = GetDisplayNameFromVehicleModel(vehicles[i].model) .. ' [' .. vehicles[i].plate .. ']', value = vehicles[i]})
              end

              ESX.UI.Menu.Open(
                'default', GetCurrentResourceName(), 'vehicle_spawner',
                {
                  title    = _U('service_vehicle'),
                  align    = 'top-left',
                  elements = elements,
                },
                function(data, menu)

                  menu.close()

                  local vehicleProps = data.current.value

                  ESX.Game.SpawnVehicle(vehicleProps.model, Config.Zones.VehicleSpawnPoint.Pos, 270.0, function(vehicle)
                    ESX.Game.SetVehicleProperties(vehicle, vehicleProps)
                    local playerPed = GetPlayerPed(-1)
                    TaskWarpPedIntoVehicle(playerPed,  vehicle,  -1)
                  end)

                  TriggerServerEvent('esx_society:removeVehicleFromGarage', 'parking', vehicleProps)

                end,
                function(data, menu)
                  menu.close()
                end
              )

            end, 'parking')

          else

            local elements = {
              {label = _U('boxville'), value = 'boxville'},
            }

            if Config.EnablePlayerManagement and PlayerData.job ~= nil and
              (PlayerData.job.grade_name == 'boss' or PlayerData.job.grade_name == 'chef' or PlayerData.job.grade_name == 'experimente') then
              table.insert(elements, {label = 'SlamVan', value = 'slamvan3'})
            end

            ESX.UI.Menu.CloseAll()

            ESX.UI.Menu.Open(
              'default', GetCurrentResourceName(), 'spawn_vehicle',
              {
                title    = _U('service_vehicle'),
                elements = elements
              },
              function(data, menu)
                for i=1, #elements, 1 do
                  if Config.MaxInService == -1 then
                    ESX.Game.SpawnVehicle(data.current.value, Config.Zones.VehicleSpawnPoint.Pos, 90.0, function(vehicle)
                      local playerPed = GetPlayerPed(-1)
                      TaskWarpPedIntoVehicle(playerPed, vehicle, -1)
                    end)
                    break
                  else
                    ESX.TriggerServerCallback('esx_service:enableService', function(canTakeService, maxInService, inServiceCount)
                      if canTakeService then
                        ESX.Game.SpawnVehicle(data.current.value, Config.Zones.VehicleSpawnPoint.Pos, 90.0, function(vehicle)
                          local playerPed = GetPlayerPed(-1)
                          TaskWarpPedIntoVehicle(playerPed,  vehicle, -1)
                        end)
                      else
                        ESX.ShowNotification(_U('service_full') .. inServiceCount .. '/' .. maxInService)
                      end
                    end, 'parking')
                    break
                  end
                end
                menu.close()
              end,
              function(data, menu)
                menu.close()
                OpenParkingActionsMenu()
              end
            )

          end
      end

      if data.current.value == 'cloakroom' then
        menu.close()
        ESX.TriggerServerCallback('esx_skin:getPlayerSkin', function(skin, jobSkin)

            if skin.sex == 0 then
                TriggerEvent('skinchanger:loadClothes', skin, jobSkin.skin_male)
            else
                TriggerEvent('skinchanger:loadClothes', skin, jobSkin.skin_female)
            end

        end)
      end

      if data.current.value == 'cloakroom2' then
        menu.close()
        ESX.TriggerServerCallback('esx_skin:getPlayerSkin', function(skin, jobSkin)

            TriggerEvent('skinchanger:loadSkin', skin)

        end)
      end

      if data.current.value == 'put_stock' then
        OpenPutStocksMenu()
      end

      if data.current.value == 'get_stock' then
        OpenGetStocksMenu()
      end

      if data.current.value == 'boss_actions' then
        TriggerEvent('esx_society:openBossMenu', 'parking', function(data, menu)
          menu.close()
        end)
      end

    end,
    function(data, menu)
      menu.close()
      CurrentAction     = 'parking_actions_menu'
      CurrentActionMsg  = _U('open_actions')
      CurrentActionData = {}
    end
  )
end

function OpenMobileParkingActionsMenu()

  ESX.UI.Menu.CloseAll()

  ESX.UI.Menu.Open(
    'default', GetCurrentResourceName(), 'mobile_parking_actions',
    {
      title    = _U('parking'),
      elements = {
        {label = _U('billing'),    value = 'billing'},
        {label = _U('ticket'),     value = 'ticket_vehicle'},
        {label = _U('boot'),       value = 'boot_vehicle'},
        {label = _U('unboot'),     value = 'unboot_vehicle'}

      }
    },
    function(data, menu)
      if data.current.value == 'billing' then
        ESX.UI.Menu.Open(
          'dialog', GetCurrentResourceName(), 'billing',
          {
            title = _U('invoice_amount')
          },
          function(data, menu)
            local amount = tonumber(data.value)
            if amount == nil then
              ESX.ShowNotification(_U('amount_invalid'))
            else
              menu.close()
              local closestPlayer, closestDistance = ESX.Game.GetClosestPlayer()
              if closestPlayer == -1 or closestDistance > 3.0 then
                ESX.ShowNotification(_U('no_players_nearby'))
              else
                TriggerServerEvent('esx_billing:sendBill', GetPlayerServerId(closestPlayer), 'society_parking', _U('parking'), amount)
              end
            end
          end,
        function(data, menu)
          menu.close()
        end
        )
      end

      if data.current.value == 'ticket_vehicle' then
        local playerPed = GetPlayerPed(-1)
        local coords    = GetEntityCoords(playerPed)
        local vehicle   = GetClosestVehicle(coords.x,  coords.y,  coords.z,  3.0,  0,  71)
          ESX.ShowNotification("Writing ticket...")
          Citizen.Wait(5000)
          ESX.ShowNotification("Signing bottom...")
          Citizen.Wait(2000)
          ESX.ShowNotification("Tearing off ticket...")
          Citizen.Wait(1000)
          ESX.ShowNotification("Putting ticket under wipers")
          Citizen.Wait(2000)
      		TriggerServerEvent('esx_parkingjob:ticketCurrentCar', GetVehicleNumberPlateText(vehicle))
     end

      if data.current.value == 'boot_vehicle' then
          ESX.ShowNotification("Getting boot...")
          Citizen.Wait(4000)
          ESX.ShowNotification("Attaching boot...")
          Citizen.Wait(5000)
          local playerPed = GetPlayerPed(-1)
			   local coords    = GetEntityCoords(playerPed)
        local vehicle   = GetClosestVehicle(coords.x,  coords.y,  coords.z,  3.0,  0,  71)
			   SetEntityAsMissionEntity(vehicle, true, true)
			   SetVehicleBurnout(vehicle, true)
			   SetVehicleTyreBurst(vehicle, 4, true, 1000.0)
          TriggerServerEvent('esx_parkingjob:bootCurrentCar', GetVehicleNumberPlateText(vehicle))
      end


      if data.current.value == 'unboot_vehicle' then
          ESX.ShowNotification("Removing boot...")
          Citizen.Wait(10000)
          local playerPed = GetPlayerPed(-1)
			   local coords    = GetEntityCoords(playerPed)
         local vehicle   = GetClosestVehicle(coords.x,  coords.y,  coords.z,  3.0,  0,  71)
			   SetEntityAsMissionEntity(vehicle, true, true)
			   SetVehicleBurnout(vehicle, false)
			   SetVehicleTyreFixed(vehicle, 4)
			   ESX.ShowNotification("Vehicle ~g~".. GetVehicleNumberPlateText(vehicle).."~s~ has been de-booted. You may now step out.")
      end
      

      

    end,
  function(data, menu)
    menu.close()
  end
  )
end

RegisterNetEvent('esx:playerLoaded')
AddEventHandler('esx:playerLoaded', function(xPlayer)
  PlayerData = xPlayer
end)

RegisterNetEvent('esx:setJob')
AddEventHandler('esx:setJob', function(job)
  PlayerData.job = job
end)

AddEventHandler('esx_parkingjob:hasEnteredMarker', function(zone)

  if zone == 'ParkingActions' then
    CurrentAction     = 'parking_actions_menu'
    CurrentActionMsg  = _U('open_actions')
    CurrentActionData = {}
  end

  if zone == 'VehicleDeleter' then

    local playerPed = GetPlayerPed(-1)

    if IsPedInAnyVehicle(playerPed,  false) then

      local vehicle = GetVehiclePedIsIn(playerPed,  false)

      CurrentAction     = 'delete_vehicle'
      CurrentActionMsg  = _U('veh_stored')
      CurrentActionData = {vehicle = vehicle}
    end
  end

end)

AddEventHandler('esx_parkingjob:hasExitedMarker', function(zone)
  ESX.UI.Menu.CloseAll()
end)

RegisterNetEvent('esx_phone:loaded')
AddEventHandler('esx_phone:loaded', function(phoneNumber, contacts)
  local specialContact = {
    name       = _U('parking'),
    number     = 'parking',
    base64Icon = 'data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAyAAAAMgCAYAAADbcAZoAAAACXBIWXMAAB7CAAAewgFu0HU+AAAAGXRFWHRTb2Z0d2FyZQBBZG9iZSBJbWFnZVJlYWR5ccllPAAAMN5JREFUeNrs3V1uG1neH+Cy4Yu8QABpgAC5CALx1Qasvsql2Cuw+iaXMr0Ca1ZgegUtr6ApbaAlIPdNrWCoDWhIBAkQIEik4EUCBIGUc8yjHrVblkSyPk5VPQ9QKLenx279WcU6vzpfr+7u7goAAIA6vFYCAABAAAEAAAQQAAAAAQQAABBAAAAABBAAAEAAAQAABBAAAAABBAAAEEAAAAAEEAAAQAABAAAEEAAAAAEEAAAQQAAAAAQQAABAAAEAAAQQAAAAAQQAABBAAAAABBAAAEAAAQAABBAAAAABBAAAEEAAAAAEEAAAQAABAAAEEAAAAAEEAAAQQAAAAAQQAABAAAEAABBAAAAAAQQAABBAAAAABBAAAEAAAQAAEEAAAAABBAAA6Lo3SgDQXa9PrwbhNEj/OHzwP+2FY/vBP8d/Z6fEv/omHLNvfm/64Nfxf7uOx+3h7swnBdAfr+7u7lQBoL0BY/hNuLg/77fwx7lMoWT28BwCytQnDSCAAFBfyIg9FXvpGDw47/SoDPc9KvN0xFAyD+Fk7goBEEAAWD9sDB6EjWEPg8a6weT3w5AuAAEEgMfDxvaDoDFMv95SmVJcpEAyTaFkriQAAghAHwPH8MHxVlVqs0hh5OshkAAIIAACBwIJgAACwIqh435I1UHRzpWo+uoyhZEzq24BCCAAuYeOgxQ4YvAwYbz9bu7DSAok10oCIIAANBk4tlPguA8dJo5323nxj96RuXIACCAAdYeOdyrSW3Go1iQeekYABBCAKoLHwYPgoaeDh2LPiGFaAAIIwMahI04kH6VD6OA5NymITExgBxBAAF4aOu6HWB0VlstlfXF530kKI3PlABBAAL4NHnspdBhiRdnOUxA5UwoAAQQQPEaF3g7qcd8rcmyuCIAAAvQrdAyK5byOGDz0dtCEk3CMDc8CBBCA7gePcTjeqwaZuEhBZKoUgAAC0J3gMUzBY181yNQiBZGJUgACCIDgAYIIgAAC8N3gMUrBY0c1EEQABBCAqoJHXEL3WPBAEAEQQACqDB7DwlArBBEAAQRA8ABBBEAAAdoePAbFcqjVO9WgpyzfCwggADUEj+1i2ePxUTXgq/NwHNnQEBBAAMoPH0cpfNi5HP7sS7HsEblWCkAAAdgseAyL5XCrt6oBT7oplr0hE6UABBCA1YPHoDDPA9ZxkYLITCkAAQTgZeHDcCvYnGFZgAAC8Ezw2AunSWG4FZQlDssahRByphSAAALwj+BhdSuoltWyAAEEIIWPYbHs9dhRDahU7A2JQ7KOlQIQQIA+Bg+9HtCMOEl9pDcEaLwtoARAjeFjGE4z4QMasR/vv7TYA0Bj9IAAdYWPY8EDshF7Qw6slAUIIEAXg4cVriBPVsoCBBCgc+EjDvX4WSUga/YNAQQQoPXBI040nxR2M4e2uCyWvSF2UQeqbycoAVBy+BiG01z4gFaJQySn4f4dKQVQNT0gQJnhYxxOn1QCWu2kWG5eaEgWIIAA2QYPQ66gWwzJAqprNygBsGH4iKtczYQP6BRDsgABBMgyfMTGyTQcO6oBnbMVjl/SHj4ApTEEC1g3fNhYEPrDxoWAAAI0FjzifI+4cdm+akCvmBcClNOWUAJghfAR53tMhQ/opft5IQdKAWxCDwjw0vAxLJY9H1uqAb334fZwd6IMwFptCiUAXhA+RuH0m/ABJHFyugACrEUPCPBc+BgXNhcEHmfTQkAAAUoNH5Nweq8SwBPi5PShEAIIIMAmwcPO5sCqISQu0ztXCkAAAdYJH9NiueINwEvdFMueEMv0Ak+3NZQAED6AEsRFKqZpuW4AAQR4NnzsCR+AEAIIIIDwAbQthPwtLd8NIIAA3w0f9vgAyvSLEAIIIIDwAQghgAACCB+AEAIIIIDwASCEAAIIIHwAQggggADCB4AQAjzJTujQn/AxCKeZ8AFk4Ac7pkOP2yRKAL0IH3GH8zPhA8iEzQpBAAE6Hj6mhU0GgXzYMR16zBAsED4AmnITjr3bw925UkCP2idKAJ12LHwAGYs9IWfpZQkggACtvrlPrybh9F4lgMzFlyRTIQQEEKDd4eNI+ABaFkKOlQH6wRwQ6F74GIXTLyoBtNDJ7eHuSBlAAAHaEz7iijJ/UwmgxT6EEDJRBhBAgPzDx6Cw0SDQDT+GEDJVBuhom0UJoBPhw0aDQJec2SMEBBAgb5PCcrtAd8SXKRMrY4EAAuR4E59ejcPpnUoAHRNfqpwpAwggQF7h4yCcPqkE0FH74XvO8rzQMSahQ3vDRxwfPS3M+2A1F+l8XSwXLbg3/fZfXGUScLoevx0u8/D3Bum4/33XLav4KVyPekNAAAEaDB/bqcFo3gffWoRjnq6P+5BxHRpvswyv48GDYDJIwWTguuYRN+EY5ngdAwII9CWATAo7nbPszZilY96lZUtTj8p9KBkWek0oissUQq6VAgQQoN6G2VE4/awSvWx8xaARQ8asj2+CU4/JfSCJh56S/rFTOgggQM0NMDud98cihY047n3qre+j98P2gzAikPSHndJBAAFqbGzFt947qtFZFylwnIUG1lw5Vr5HBimIHKSzIVvdZD4ICCBATY2rSWHeRxedPwgdejnKvWcOUhg5EEY6x3wQEECAihtSo3D6RSU6I/Z0TISORsKIEN8dX8L9c6QMIIAA5TecBsVy6JU3uO22SKFjYnhVo/fTdgoiseFqzkj72R8EBBCgggbTNJz2VaK1zlPo0EjK797aS0HEEK32ivNBBnoSQQABymsgjcPpk0q0slE0Ccex3o5W3GfbKYiMCos8tDLkh/vsQBlAAAE2bxRZcredweM4BQ9vZNt538UQMhZEWuev4Z47VgYQQIDNGkJx3ocx6u0JHrHROhE8BBEauwf39DiCAAKs3/iJDR9Dr9rR6NHjIYiQh4twHw6VAQQQYPUGj6FXggd5BpH4mZusnjdDsUAAAdZo6Bh6lbeTcIwN9ejlvXk/WV3vZN4vBwzFAgEEWKGBM9a4yVbcefkoNGymStH7+3RQLHtD3qlGlqyKBQIIsEKjxoaD+fk6wdywDh65Zw9SEDE/JD82KIScvz+VALIxET6yc1Esh3MIH/xJauDGOVtfVCM7x2nIHJAhPSCQw5uA5ZvUX1UiG3o9WPUeHhbLlwh6Q/LxJdzDR8oAAgjw54ZLfEs3L/R+5CL2eoxMYmXNe3kcjo+qkY0fwr08UwbI7PtSCaBxY+EjG5/jPgLCB+uISzKnN+4/FcteNJqnFxMypAcEmnwDsJx4/neVaNwiHAfelFLyvR3niFhSu3kfwr09UQbI6DtSCaBRHorNu59oLnxQmtiLFg4T1PNgQjoIIMDXm2858XxfJRp1P+TKbuZUFUTikKwPhSFZTYpDXE1Gh4wYggXNBZB5YcWcpsTG4JFhGdR4v8fekDP3fKP+2fwuyOQ7UQmgkcbIWEOk0fAxFD6oUxriF0PIpWo0xoR0yIQeEKg/fFh2tzmXKXwYckWT939sCL9XjUb8GO7/qTJAw9+FSgC1OxI+hA/6KS3VOwq/PFGNRoyVAJqnBwTqTPyW3W3KSWr0QU7fB7Ex/EklavdT+D44UwZo8PtPCaBWYyUQPiAK12X8PvigErUzFwQEEOjJzbbs/TDuW/iAhyFkIoTUbid8H/teAAEEemGsBMIHCCG+j0EAAaq/0U6vhoXeD+EDhJBc6AUBAQQ6b6wEwgcIIb6XAQEEqr/Jlr0f+ypRi3Phgw6EkC8qUQu9ICCAQGd5wNXjUq3pSAiJewXZJ6QeYyWA+tkHBKpM+Pb9qDN82GSQrn1/xL0q3qlE5T6kniegru83JYBKjZWgcjfhGAkfdNAohWt8T0On6AGBqtK93o+6/BDCx0wZ6Oj3yHY4zcOxpRqV0gsCdX63KQFUZqwEtTQahA86K/XsDYtlTx/VOVICEECg3TfW8q3lgUpU6sQbS3oSQmYayJV7m1YsBAQQaK3YWDBkojqXltulZyEkhm3L81ZrrAQggEDbAwjViENR9C7RxxASv1dMSq/Ofpq7Bwgg0LKbarmxld6P6hyEhthcGejr9V+YD1KlsRKAAAJtpPejOl9C+JgqA32VwvdIJaoLeGkOHyCAQEtuqOUkxrcqUYnLNAQF+h5C4gaF5oNUY0vAAwEE2saDqxrmfcAfjQvzQariRQcIINCSm2nZbf9eJappbJn3Af+Q9gcZqUQldsL3uRceIIBAK2gMVOMiNLaOlQH+FELi/iCfVcL3OQgg0F+67ct3oyEAT4aQcWEoVhXeWZIXBBDI+0ZaTj7fUYnSGXoFz/PyoxojJQABBDyo+sXQK3iBtDS1VbF8r4MAAr25iUw+r4q3uvBy43AslKFUO6l3GxBAIDtWSynflzTBFniBtCqW0F6+kRKAAAI58tAvV5x4PlYGWDmExA0KL1SiVHZGBwEEMruBlquk2Pm85ECX3uYCa9w/SlCquDO6Xm4QQCArHkzlugzhY6IMsJ40dNGEdN/zIIBAh3nbqJ6Qm3GxHMpIOd4ZhgUCCORx85xe7RX2/ijTRVpOFNhAGsJoCety6QUBAQSyMFIC9YRMxQBiWV4BBAQQ8EDiO07seA7lSb0gY5UojWFYIIBAwzeO4Vdl01CC8kPIpNALUiYvnUAAgUYNlaA0ej9AuBdAQAABnjFSAg0kyJ1ekFIZhgUCCDR009h8sEx6P0DIbxO9ICCAgAeQhhHwFL0gpRoqAQgg4AHUXno/oD4TJSiFF1BQgjdKACt7pwQaRLRTGsMfV7EbpOP+nx/af/Dr2HPwMCjH5W1n6dfT+L+1JEjHfUGOwrHlKtjIVriGhjZNhc28uru7UwV4eeMlvv36VSU2Fnc9HyoDNdyzMVwM01Hl8tkXKZDMwrV9lmktYgj56KrY2JfwGR8pA6xPDwisRqO5HBMloOIXBfdHXW/899MR//54Og9HDCJnaVPAHAggngOQBT0gsFrDZl7YgHBTi9AgGygDJd+b8ZqKb6VHRX7DjGIYOc5h2E6oUwz/710xG/tLRsES2vedrQSwUgNH+NjcRAko8b4cpkb134vl2/0c5zjEeWO/xRcY4Ri5/zrBZHQQQKAWQyUoxbESUMYLgRQ8fiva80Y/vsD4JQWRRr5PUi+MJXk9D0AAAQ+c3jgxbIESwse4WPZ4tHUoUQwisUfkLPWsegngeQACCOCBU5GJErBB8NgLR1wC91NHfqQ4NGvWwLAs92EJIbKh8AgCCPSo4RMfNOZ/bGZh7Xw2uAdjIz1eP2879qPFOStxWNYk7VFSudQLeeKq2thQCUAAAQ+avE2UgDXDR7x2fim6vYleHE42rSuEuB89F0AAAQ8aAQS+Hz76smxs7N2Zpc0TK2UyuucCCCDgQdN1cefzuTKwYviYFf3bsyIO9ZzWEUKK5UaJbPBZ1dhjBQII9KwRtF2Y/7GpiRKw4n0Xr5m3Pf3xt1IIGVT891gNa3NDJQABBDxg8uRNK6uGj77v1h1DyFmVb9hTr+SlK24je0oAAgh4wOTn3N4frBA+joSP38UeoEnFf8dEmTcyVAIQQMADJj96P3hp+Ihh/2eV+IN3aeNF92eevKACAQQ8YAQQWho+tl0r3/WpqknphmFtbKumBQNAAIEeNYoGRbf3Hqia4Ve81Liw2MOTQb7C+SAT5d3IQAlAAIEyebO1YaNJCXhB0B+G00eVeFIMZ0cV/dlT5fWcAAEEPFgEEPrEcrAv86mKpXlvD3fjfis2JVzfUAlAAAEBJA+Xhl/x7EPo9GpU9He/j3WMvSzwnAABBDxY0KAhvwZ1V72vaINC9+v6tuyIDgIIlMmkWA0aqnoALXs/3GMZhLbbw91pON0o7dq8rAIBBEppHA1VYW03aVw51NqQ7omqekGmSiuAgAACzRoowdr0fvBcwD8o9H5soooVsQQQzwsQQMADpbU0ZHjOSAmyq58XB+vTAwICCHigCCBk++BZDh96pxIb2UpzaEqTdkW3HK/nBQgg0CCrmqxnkRoy8D0HSpBtHafKul4gVAIQQKAM+0qgAUMlRkpQincVLP/q/l23QWXhEhBAYMMHid4PDRiqu7dsPFieofsXEECgG4zn1YChGoZfZVzPNHzSfiB5hEEQQKBn9ICs58b8DzTSWl/PqbICAgjUTw+IhgsCSBvsVLApoU1EXdsggEAD9IBouFD2A2fZULb5YP4N36mSAgII1E8PiIYL7qte1vX2cNd9vB4rJ4IAAjRADwgCSDfqeqmsgAACGkq5ixsQXisDTxgqQWu+r7xMWKdRVf58HBBAoEfsaqvBQvk0zir6vqpg7yL3s2scBBBAAKH1TECvzp77GRBAoK03xenVUBXWMlUCnrivBqpQKT0g3QyCIIAAPGGuBDxBAGlRwzfN57IjevNBEAQQgCcaLAIIdIteEEAAgZroQl/dhRLgvhJA0NMHAgisRxf66iy/i/uqWcMK/sy5sgogIIAAufKmFNzXAAIIUJu5EoD7GuAl3igB/MlACTRUKN2ksFRzlUofBhkXlnh9eqWyqzHUEAQQEEBqYqgGzzZmBdVWWhQ2kFzFWyWA5xmCBZTRuDQJHbpJaAQEECA7l0oAAgiAAALURe8HCCAAAggggAAAAgjQPSagQ3dNlQAQQAAAAAEE6C1DsAAAAQSojSFY4P4GeDEbEQKbOn59eqUXBAAQQIBa2PkXAHgxQ7AAAAABBAAAEEAAAAAEEAAAQAABAAAQQAAAAAEEAAAQQAAAeMaNEoAAAuuYKQEAnh8ggEBdrpUAAEAAAQAABBAAAAABBNY1VwIA1mAOCAggIIAAUBtzCEEAAQAABBDImzdYAKxjrgQggMDKbg93jeEFQAABAQQAABBAoJsWSgDAivSggwACa5srAQCruD3cNYcQBBBYm4cIAKu4UQIQQGATutEB8NwAAQQAIEt6zkEAgY1MlQCAFegBAQEEAKA2ekBAAIH13R7uTlUBgBXoAQEBBDZmRRMAXkoPCAggsDFvswB4kdvDXc8MEEBgY3MlAOAFLpUABBAQQACoi+FXIIBAKaZKAIDnBQggUBdvtAB4ibkSgAACGzOhEAABBAQQqNuFEgDwFHtHgQACZZorAQBPWCgBCCBQJsOwAPCcAAEEPFgA8JwAAQQ8WADol6kSgAACpbk93I1L8RrfC8D3eFEFAgh4uABQi0V6UQUIIFCqqRIA8AgvqEAAAQ8YAGozVQIQQKB0NpgC4Du8oAIBBCpjR3QA/sALKhBAoErecgHwkBdTIIBApaZKAIDnAggg4EEDQBP0jIMAAtVJ67xfqgQAyVQJQAABDxsA6nBpA0IQQEAAAcDzAAQQ8MABoHPOlADW9+ru7k4V4KWJ/fQqhpB9lQDor9vD3VeqABu0p5QAVjJVAoBeO1cCEECgTrrdAfptqgQggEBtbg9347rvNyoB0FteRIEAAh4+ANRicXu4O1cGEEBAAAHA9z8IINBZUyUAEEAAAQRqkXa/tQoKQL/chO//qTKAAAJN8RYMwPc+IICABxEAvvdBAIGOMQwLoFfi8CsBBAQQaJyHEYDve0AAAQ8kAHzfgwACHWMYFkAvGH4FAghkxUMJwPc8IIBArQ+mG2UA6KxjJQABBLKRhmF5OwbQTYvwPT9TBhBAIDcCCEA3TZQABBDITpqcuFAJAAEEEEDAQwqAdVzcHu7OlQEEEBBAAPC9Di326u7uThWgjDR/ejUNp32VAGi9uPfHtjJARW0mJYDSTJQAwPc5IIBALW4Pd+MDy2R0gPaz9wcIINAaEyUAaDWTz0EAAQEEgNro/QABBNojvTU7UQmAVlqkvZ0AAQRaZaIEAK2k9wMEEGif28PdaThdqARAq9wUXiCBAAIt5iEG0LLv7dvD3WtlAAEEWsmSvACtY/gVCCDQemMlAGiFE0vvggACXRBXUrlRBoDs6f0AAQTaL40l9lADyFvceHCmDCCAQFfEAKIXBCBfYyUAAQQ6Qy8IQNYu0tLpgAACnaIXBCBPYyUAAQQ6Ry8IQJb0foAAAp2mFwQgL2MlAAEEOksvCEBW9H6AAAK9oBcEIA9jJQABBDpPLwhAFs71fkCzXt3d3akC1Jn6T6/m4bSjEgCN+OcQQObKAA22hZQAajdWAoBGnAgfIIBA74SH3yScLlUCoFZxDt6RMoAAAn3lIQhQr+M0Fw8QQKB/0gTIC5UAqMWisAgICCBAMVICgFqM9X6AAAK9lyZCflYJgEpdpLl3gAACFDYnBKiaOXcggAD30pAAD0eAanwJ37MzZQABBPhjCJkUJqQDlC32Lo+VAQQQ4HEjJQAo1ZGJ5yCAAN9hQjpAqUw8BwEEeIE4IX2hDAAbiUOvRsoAAgjwjDRUwEMTYDPHqVcZyNSru7s7VYCc3gqcXsWekI8qAbCyyxA+9pQBMm/rKAFkZ1wYigWwjpESQP70gECGXp9eDcPpN5WgQnGc/P3+CNMHvx9/7yUrBw0f/Dq+cd4OxyAcO0pLQz7fHu6OlQEEEGD9EGIoFmVYpFBxf1yHRtq04mv3PpAMUyiJ//zWR0GFDL0CAQQooRG3nRqM3iizUkOsWPZofD1y2gch9ezdH/s+Kkr0gx3PQQABymuwGYrFUxYpbJzlFjheeH0fpECih4R1GXoFAghQciPNUCweCx0xcEy68tY3XOeDFEZGwggriBsODpUBBBCg/MbZTKOs925S6Dju+lCTFEZG6TAEkafuiT17foAAAlTTIIuTK6fh2FKN3rlMoWPS02v/vlfknUuBb/wU7oszZQABBKiuIRYbYb+oRG+cFD3o7Vjh+h+E01EKI4I4J+HeGCkDCCBA9Y2w+LbPm+DuB4+xYSXfvQe2UxA5EkR6K/YKDtu04AIggEDbG1+W5hU83AuCSF/dpPChZxAEEKDGhlecD/I3lRA8EER66ENf50OBAAI03egaFeaDtN1FCh5TpSjlnhjEeobjvWp0N6yb9wECCNBsg2uisdVKcQjJkbe4ld0Xw3CKtTVMsVvM+wABBMigoRWHnkwL+4O0yXk4RhpRtdwf43D6pBKdCe32+wABBMikkTUolpPSjX3PvwE1smdB7fdHnC81EdJb70dDFUEAAfJqZA3D6TeVyJZej+bvkXGhN6St/hrunWNlAAEEyK+BNSpMSs+NuR75BfX4WZgb0h4mnUNXv5OVANovNXJPVCIb9xNmhY987pFpOMUhWeeq0Zp76EgZoJv0gECHvD69io2sfZVolCFX+d8n48KQrJwtiuWkc/cQdPV7WAmgUw6K5ZtDmvE5NJoONJzyFj6fGEA+FMthcuQlfibuIeg4PSDQMWnln2lhZay62aHZvcLmfrJaHAgggIYVT4tvbON8j5lStPJesZ+OEA/U/d2rBNA9qTFsAqfwwfP3ShzqMywMXWzaF+ED+kMPCHSY5XmFD158r+gJaY7ldqFv37lKAN2V3ih+VonSxbfle8JHp+4VPSHCB1ATPSDQA69Pr9zo5blJ4WOuFJ28V/SE1Bvkh1a8gh5+1yoBwErhYyh8dJeeEOEDEEAAcgsfhl0JIQgfgAACUDnho58hxGaFwgcggADU7oPwIYQgfADlMAkdesAk9I18Dg2mcUs/97gh5faD3/r2n6NBOp4S/39bTzQqv21QTtN5no5ZmxudoY4H4fSrW2EjhjACAggIILzAeWgwHWT2WQ4ehIb74DB88K/sZ1zPixhG0jFt02T+UPe4sefPbgnhAxBAAAGkKotiudzudUaf4zTzgLFOjc9SGDlrwX0U/xvfuTVW9lMbPl+gxu9TJQD4k/jG9sBY9crthONjOH4NjfvrcEzSsLFcjVJoYjXuI0AAAXjG2HCR2sU5Ju/D8bfY0xOOYW7/gSmQHvioAAQQgDLFeR/HytCoOMzstxyDSAqmn31EAAIIQBni0KuRMmQXROLQrO2MQsi4WE6oB0AAAdjIyLyPLMWhWfPMekNGhf1BAAQQgA2cW6kna3GOyG9pOdzGpSWExz4WAAEEYB3xTfaRMrTCz3FIViYhJM4VuvSRAAggAKsat2lTPIr3uYQQwRVAAAFY1cKqV60NIY1/buHamYbTiY8DQAABeKmRErTWxxBCcvj8Yi+ICekAAgjAsy7SG2za6ziEkEGT/wFp5TS9aAACCMCzjN9vv7g61iSHIFToBQEQQACecJJ2tab99pseiqUXBEAAAXjOWAl8niXTCwLwAm+UAOihc8vu/m4RjvtaxLf4j/UKzdL/9pjhg18P0rFXLIdG1Wkn9oKEz3XSVCFjL0hameuTywpAAAF4yFCZpR9LmIT/6P8/NMS3Uzg5SEcdgWRcND8fJF5bRw0EMIDWMAQL6BsrX9Ug9gaE4ywcsVcihpGfYu0r/mtjL8iw6Z+7yGNSPIAAApAJjcNmGuYxjMRw8KGodp7EKIMfVw8bgAAC8NWiyTkCfA0isf4xiFxW9FccZPAzzsPp3KcNIIAAnClBFiFklkJIFT0hW00Pw0oEXQABBMDQmIxCSJwrUVVvxTCDny+G3YVPGkAAAfrr0tK72YWQaTiddDGAJHrcAAQQoMf0fuRpXMGfuZfJzzbx8QIIIEB/eRudoYombG+lfUia/tniXBfDsAAEEKCHLtKcA/oTDvc6/LMBCCAAPWzgUp5pBX/mdiY/28THCyCAAAIIGUnDsMpekncvk5/NMCwAAQTomYXVr1ph1uGfberjBRBAgP7Q+4EAAiCAAGj8UenntO0aBBBAADT+qEsuq2Ddz3ExDwRAAAF6YGH5XQRhAAEEoC4zJeituWsRQAAB0OhDAAEQQAA6a6oErTHo8g93e7jrWgQQQIAe8NZZAMmJiegAAgjQYTcmoJOZuRIACCBAd+n9aJf9kv+8aYY/49THDCCAAN2l96MtD6LTqz3XJIAAAtB2ekDaY68nn79rEkAAATrM2+b2OCj5zzP/B0AAAaidt81teAidXm2H07s+fPaW4gUQQABo3lEFf6aGPoAAAgDfPICWvR9VBBC9XwACCEC9DHdphUk4tir4c3P+7C997IAAAgB1P3xOr2L4eFfBH32Z+QR0k+MBzwAlAKCB8PG+oj9+osIAeXujBADUFDyG4XQcjrcV/jVnKg0ggADQ39AxKJb7fIwqDh7Rxe3h7lzVAQQQAPK0FwJCmX9eXNXqflfzYThi+Nip8eeZ+EgBBBAA8vVzh36Wxe3hrgAC0AImoQPQBWMlABBAAKAOl3o/AAQQgGa/3JaTn+mHoxb9t+77uAABBKCbBJB++GLXewABBADqEIdeHSkDgAACkIOBEnTaTbFc6rc9D1zDAgEEEEAAob3h4/Zw99o1CSCAAORiWwk6HT5mrkkAAQQgJ3tK0DmX8XNtafhwTQIIIEDHDZSgU06KZc/H3DUJ0G5vlADoqB0l6IRFOI5C8DgTigG6QQ8I0N0vuNMrQ17aK871+Fwsh1yddeRnsgkhQKEHBOi2GEBmytAqscdjEo7jFq5y9VQYHvhoAQQQoB8BhPzF3o7Yy3HWod4O1yKAAAIIIGQi9nLEnqlpPFq8qpVrEUAAAfgDY+6fFpe1rWqY03Xxx+FvMWwUIWxMe1rrocsNQAABeuD16dWwx43e5xypjTAMUPuzWQmAjhsqAU2HYFUAEEAAAQRcgwACCEDpDH2haQdKACCAAH36oju90gCkqWtvO5zeqgSAAAL0iwCCaw9AAAHQCMS1ByCAAHTPlmFY1P6AXQ6/eqcSAAII0E8CCK45AAEEQGOQzhopAYAAAvRXHIalQUg9D9fTq0FhCWgAAQToPQEE1xqAAAJQm/30ZhqqdqQEAAIIQDRWAip9sC6H+m2pBIAAAhAdpOVRoSp6PwAEEIDfbWkgUtlD9fRqGE5vVQJAAAF46EgvCBUZKwGAAALwLb0glP9AXfZ+WHoXQAABeJReEMo2VgIAAQTge/SCUN7DVO8HgAAC8AJ6QSjLWAkABBCA58RekGNlYKMH6XLfD70fAAIIwIu8Dw3IPWVgzfCxLcQCCCAAq9KAZF3jwq7nAAIIwIr2X59emZDOag/QZc/ZR5UAEEAA1jEODcqBMrCCiRIACCAA69rSoOTFD8/Tq3E4vVUJAAEEYBOGYvGS8BGHXn1SCQABBKAMhmLxVPiIq15NVAJAAAEoSxyKdaYMfEdcMc3QKwABBKBUb1+fXlmalz8+MJcbDr5XiZVdKwEggED/XCrByj6mBifcz/sQStdwe7g7UwVAAIH+8QZyPcd2SSfN+4jD8mw4CCCAAFQqNjinqQFKf8XwsaMMAAIIgBBCtQ/J06tJOO2rxNpulAAQQKCfpkqwkbjq0UQZehc+xoVJ55sy/wMQQADW9C69Dacf4WNU2GwQQAAB1jZXglK8F0J6Ez5+UYlS6AEB/uSNEoAAwsohJC4tOmrg7z4KR5lzUTQOhY+qWYEPEEBAI4C2hhD7KQgfLTRXAuBP37dKAN2n4VpZCJkog/CBAAIIIMDjFkoghPBo+DgSPgQQQAABNATaFEJm9glpbfiIAfJnlajG7eGu7x1AAIEeMwyrOnGfkLhZ4Z5StCZ4bIcj7nBun4/qXCgBIIBAv82VoJYQMlSK7MNHDIrTcLxTDd85gAACVEcPSPW2wvFbmlNAnuHjIIWPt6ohgAACCFCh28PdqSrU5uc4vMe8kOzCxzicfk1Bker5zgEEEMBKWDWKw3tmhmRlETwGcaGA8MtPqlErva6AAAJoENRsp1gOyTpWisbCx1G67g25qtfi9nDXBqiAAAIYEtGQj2mp3qFS1BY8Yq9HvN7jEruGXNXPyw5AAAE0ChoW38B/7Q0xN6Ty8HHf67GvGo2ZKgHwPa/u7u5UAfrVOHPTN+8mHEe3h7sTpSj12h6G03FhuFUOfrTwBSCAAPeNtNgo8GY4D3GjtrGG2sbX9CDWsbCpYDbCNf1KFYDvfm8rAfSOxm4+YhD8LS3ZO1COlYPHdlpa9+/CR3bBGkAAAQSQjMUle/8eGtMTQWSl4DEvLK2bozMlAJ5iCBb0swEXl8e0MlC+TsIxMTTrT9dtDGcxeBy4frP2Q7h2LXgBCCDAHxpy8Q3lO5XI3kUKIpOeX6/DcDpyzbbCTbherfIGPOmNEkAvCSDtEOeI7KeNDGMIOQ6Nu3lPQkdsxI5S8NhxKbTquwXgSXpAoIfSUJa/q0QrXaYwcta1MJJCx0E6BOR2+ilcl0IIIIAAjzb24hht+yV0I4xM2zrmPoXhodDRGX8J1+K1MgACCPBYwy8ObflZJTpjUSxXOJumQDLP9LrbToHj/hCCu+M8XHcHygAIIMD3GoKDwjCsrgeSWTpiKJk18WY6TSDfe3AIHN31oe8LJgACCPB849AwrH65eRBKrh+cr9cdwpWC7CD9Ywwb2yloxN8zebxfDL8CBBDg2cajYVg8FVQeI1jwGMOvgBezDC/025kAwiPiJn/7ysAKJkoAvJQeEOg5mxICG7L5ILBa20MJoPes2Q9sYqIEgAACvFhateZGJYA1HSsBIIAAq5ooAbCGi1z3nAEEECBv3mAC65goAbAqk9CBr0xGB1a0uD3cHSgDsHKbQwmARC8IsIqJEgACCLC228PdaThdqgTwAnHhCi8tAAEE2JgGBfASZ7eHu9fKAAggwEbSkrwLlQCeMVYCQAABNCyAOpxYehcQQIDS6AUBnjFWAkAAATQwgDro/QAEEKB8ekGA7xgrASCAAFU5UgLggc96PwABBKhMaGjEndEvVAIo7PsBCCBATcZKAMTvAvt+AGV5dXd3pwrAd70+vZqE03uVgN5ahPAxUAagtLaFEgDPiHNBbpQBemukBIAAAtQmDbsYqwT00nn4DpgqAyCAAHWHkDj59FIloFdiz6fV8AABBGjMSAmgV8aW3QUEEKAxoSEyC6cvKgG9cJF6PgEEEKBR48IO6dB1cejVSBkAAQRoXJqQrmEC3WboFSCAAFmFkGk4fVYJ6CRDrwABBMgyhIwLq2JB1xh6BQggQNYOChsUQpeMDL0CBBAgW6mhYo8A6IYv4Z4+UwagDq/u7u5UAVjb69OrSTi9VwlorcsQPvaUAait7aAEwCZCw2VUmA8CbRWHUR4oAyCAAG1jPgi09N417wMQQIDWSQ2YoUpAq/w1LasNIIAArQwhs3D6oBLQCif2+wCaYhI6UKrXp1exUfNRJSBbJp0DzbYVlAAoU2jYxKV5T1QC8gwfheGSQMP0gACVeH16FYdkvVUJyEZcKGLPpHOg8TaCEgAVGRaW54WcwsdQ+AAEEKCzQkPnWgiBrMLHTCkAAQQQQgDhAxBAAEoOIaPCRoUgfAAIIEBNISQ2gIbhWKgGCB9Av1kFC6jN69Or7XCaFlbHAuED6G97QAmAupgTAsIHgAACCCEgfAAIIEAvQsi5akApYqDfEz6ANjAHBGjU69OrSTi9VwnYKHwMU7AHEEAAXhBCRuH0i0rAyk5C8BgpA9Cq574SAE0LDahJOP1U2CsEVvFX4QNoIz0gQDZen17thVMMI5bphe+LQf0ghI+pUgCtfN4rAZCLBxsWnqgGPOp+srnwAbSWHhAgS69Pr47C6WeVgN/FYH5ksjkggABUF0LikKyzcOyoBj0Wh1yNQvA4UwqgE893JQBylYZkxRDyRTXoqYtiOeRK+AA6Qw8I0AqvT68OiuUE9S3VoCc+h+AxVgZAAAFoLoRspxDyTjXosDjRfGRXc0AAAcgniMTekOPC3BC6Jc71GIfgcawUQKef40oAtE0aD29uCF1yXizneggfQOfpAQFaLa2UFRtt+6pBCy2K5XCrqVIAAghAu4KIYVm0SRxudWySOSCAALQ/iMQGXdzE0GpZ5CoOHRzbUBAQQAC6E0K2UwgRRMjJSQoec6UABBAAQQQEDwABBEAQQfAAEEAA2htE4mT1cWGyOtX4Ork8HBPBA0AAAXgYRmIQGRV2VacccffyuKrVRCkABBCAp4LIIAWReOgVYRWxt+MsBY+ZcgAIIACrhpHYK3J/mCvC95yn4HFmKV0AAQSgjCCy/SCIGKKF0AEggADUGkjiF+V/Dse/DsdfVKQX/k84/ns4/k04/mMIHf9JSQDK8UYJAF7k3z/49f8Mx7+kxuk/KU1n/Jf0XPy36XO9/8z/RWkABBCAJv2l+GNPyH0g0UPSHrGH4388CBzRv1MWAAEEoI2BJPpv4fi/4fiv4fgPStSoGBD/dzj+X/GPlc7+SeAAEEAAuuT+rfrh7eHuNC33+9gR7SvXxgHjf6VnWgwZ/+pB/b8XEAEQQAC6K+2KPX/u3wtBZS+ctlXs627ib1/47woYAAIIAGsGFRvaLYOYpW4BuvodrwQAAIAAAgAACCAAAAACCAAAIIAAAAAIIAAAgAACAAAIIAAAAAIIAAAggAAAAAggAACAAAIAAAggAAAAAggAACCAAAAACCAAAIAAAgAACCAAAAACCAAAIIAAAAAIIAAAgAACAAAIIAAAAAIIAAAggAAAAAggAACAAAIAAAggAAAAAggAACCAAAAACCAAAIAAAgAAIIAAAAACCAAAIIAAAAAIIAAAgAACAAAggAAAAAIIAAAggAAAAAggAACAAAIAACCAAAAAAggAACCAAAAACCAAAIAAAgAAIIAAAAACCAAAIIAAAAAIIAAAgAACAAAggAAAAAIIAAAggAAAAAggAACAAAIAACCAAAAAAggAAIAAAgAACCAAAIAAAgAAIIAAAAACCAAAgAACAAAIIAAAgAACAAAggAAAAAIIAACAAAIAAAggAACAAAIAACCAAAAAAggAAIAAAgAACCAAAIAAAgAAIIAAAAACCAAAgAACAAAIIAAAgAACAAAggAAAAAIIAACAAAIAAAggAACAAKIEAACAAAIAAAggAAAAAggAACCAAAAACCAAAIAAAgAACCAAAAACCAAAIIAAAAAIIAAAgAACAAAIIAAAAAIIAAAggAAAAAggAACAAAIAAAggAAAAAggAACCAAAAACCAAAIAAAgAACCAAAAACCAAAIIAAAAAIIAAAgAACAAAIIAAAAAIIAAAggAAAAAggAACAAAIAACCAAAAAAggAACCAAAAACCAAAIAAAgAAIIAAAAACCAAAIIAAAAAIIAAAgAACAAAggAAAAAIIAAAggAAAAAggAACAAAIAACCAAAAAAggAACCAAAAACCAAAIAAAgAAIIAAAAACCAAAIIAAAAAIIAAAgAACAAAggAAAAAIIAACAAAIAAAggAACAAAIAACCAAAAAAggAAIAAAgAACCAAkJfLcMyVAaA8b5QAAH53E45pOM7icXu4e60kAAIIAJRpkQLHNASOM+UAEEAAoGxxaNUkhY6ZcgAIIABQJkOrAAQQAKiUoVUAAggAVMrQKgABBAAqY2gVgAACAJUytApAAAGAShlaBSCAAEBl4lCq88LQKgABBACqFgLHgSoAdNNrJQAAAAQQAABAAAEAABBAAAAAAQQAAEAAAQAABBAAAEAAAQAAEEAAAAABBAAAQAABAAAEEAAAQAABAAAQQAAAAAEEAABAAAEAAAQQAABAAAEAABBAAAAAAQQAAEAAAQAABBAAAKCX3igBQCUW4ZiGY64UACCAAFThMhxn8bg93J0pBwAIIABlO0+hYxpCx1w5AEAAASjT/dCq2MtxphwAIIAAlM3QKgAoyau7uztVAAAAamEZXgAAQAABAAAEEAAAAAEEAAAQQAAAAAQQAABAAAEAAAQQAAAAAQQAABBAAAAABBAAAEAAAQAABBAAAAABBAAAEEAAAAAEEAAAQAABAAB65f8LMAAviqs2frVNMAAAAABJRU5ErkJggg=='
  }
  TriggerEvent('esx_phone:addSpecialContact', specialContact.name, specialContact.number, specialContact.base64Icon)
end)

-- Create Blips
Citizen.CreateThread(function()
  local blip = AddBlipForCoord(Config.Zones.ParkingActions.Pos.x, Config.Zones.ParkingActions.Pos.y, Config.Zones.ParkingActions.Pos.z)
  SetBlipSprite (blip, 460)
  SetBlipDisplay(blip, 4)
  SetBlipScale  (blip, 0.8)
  SetBlipColour (blip, 69)
  SetBlipAsShortRange(blip, true)
  BeginTextCommandSetBlipName("STRING")
  AddTextComponentString(_U('parking'))
  EndTextCommandSetBlipName(blip)
end)

-- Display markers
Citizen.CreateThread(function()
  while true do
    Wait(0)
    if PlayerData.job ~= nil and PlayerData.job.name == 'parking' then

      local coords = GetEntityCoords(GetPlayerPed(-1))

      for k,v in pairs(Config.Zones) do
        if(v.Type ~= -1 and GetDistanceBetweenCoords(coords, v.Pos.x, v.Pos.y, v.Pos.z, true) < Config.DrawDistance) then
          DrawMarker(v.Type, v.Pos.x, v.Pos.y, v.Pos.z, 0.0, 0.0, 0.0, 0, 0.0, 0.0, v.Size.x, v.Size.y, v.Size.z, v.Color.r, v.Color.g, v.Color.b, 100, false, true, 2, false, false, false, false)
        end
      end
    end
  end
end)

-- Enter / Exit marker events
Citizen.CreateThread(function()
  while true do
    Wait(0)
    if PlayerData.job ~= nil and PlayerData.job.name == 'parking' then
      local coords      = GetEntityCoords(GetPlayerPed(-1))
      local isInMarker  = false
      local currentZone = nil
      for k,v in pairs(Config.Zones) do
        if(GetDistanceBetweenCoords(coords, v.Pos.x, v.Pos.y, v.Pos.z, true) < v.Size.x) then
          isInMarker  = true
          currentZone = k
        end
      end
      if (isInMarker and not HasAlreadyEnteredMarker) or (isInMarker and LastZone ~= currentZone) then
        HasAlreadyEnteredMarker = true
        LastZone                = currentZone
        TriggerEvent('esx_parkingjob:hasEnteredMarker', currentZone)
      end
      if not isInMarker and HasAlreadyEnteredMarker then
        HasAlreadyEnteredMarker = false
        TriggerEvent('esx_parkingjob:hasExitedMarker', LastZone)
      end
    end
  end
end)

-- Key Controls
Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)

        if CurrentAction ~= nil then

          SetTextComponentFormat('STRING')
          AddTextComponentString(CurrentActionMsg)
          DisplayHelpTextFromStringLabel(0, 0, 1, -1)

          if IsControlJustReleased(0, 38) and PlayerData.job ~= nil and PlayerData.job.name == 'parking' then

            if CurrentAction == 'parking_actions_menu' then
                OpenParkingActionsMenu()
            end

            if CurrentAction == 'delete_vehicle' then

              if Config.EnableSocietyOwnedVehicles then

                local vehicleProps = ESX.Game.GetVehicleProperties(CurrentActionData.vehicle)
                TriggerServerEvent('esx_society:putVehicleInGarage', 'parking', vehicleProps)

              else

                if
                  GetEntityModel(vehicle) == GetHashKey('boxville')   or
                  GetEntityModel(vehicle) == GetHashKey('slamvan3')
                then
                  TriggerServerEvent('esx_service:disableService', 'parking')
                end

              end

              ESX.Game.DeleteVehicle(CurrentActionData.vehicle)
            end

            CurrentAction = nil
          end
        end

        if IsControlJustReleased(0, Keys['F6']) and PlayerData.job ~= nil and PlayerData.job.name == 'parking' then
            OpenMobileParkingActionsMenu()
        end

    end
end)

function openParking()
  if PlayerData.job ~= nil and PlayerData.job.name == 'parking' then
    OpenMobileParkingActionsMenu()
  end
end

function deleteCar( entity )
    Citizen.InvokeNative( 0xEA386986E786A54F, Citizen.PointerValueIntInitialized( entity ) )
end

RegisterNetEvent('esx_parkingjob:doMoney')
AddEventHandler('esx_parkingjob:doMoney', function()
  TriggerServerEvent('esx_addonaccount:getSharedAccount', 'society_parking', function(account)
      account.addMoney(150)
    end)
end)

RegisterNetEvent('esx_parkingjob:doCivInvoice')
AddEventHandler('esx_parkingjob:doCivInvoice', function(player)
	TriggerServerEvent('esx_billing:sendBill', player, 'society_parking', _U('parking'), 500)
end)


RegisterNetEvent('esx_parkingjob:doCivBootInvoice')
AddEventHandler('esx_parkingjob:doCivBootInvoice', function(player)
  TriggerServerEvent('esx_billing:sendBill', player, 'society_parking', _U('parking'), 1250)
end)

RegisterNetEvent('esx_parkingjob:doCivBootNotify')
AddEventHandler('esx_parkingjob:doCivBootNotify', function()
  ESX.ShowNotification("You've been given a boot on your car. Text Parking Enforcement to get it off of your car.")
end)