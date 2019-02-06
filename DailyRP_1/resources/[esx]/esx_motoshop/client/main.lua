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

local GUI                     = {}
local HasAlreadyEnteredMarker = false
local LastZone                = nil
local PlayerData              = {}
local CurrentAction           = nil
local CurrentActionMsg        = ''
local CurrentActionData       = {}
local IsInShopMenu            = false
local Categories              = {}
local Vehicles                = {}
local LastVehicles            = {}
local CurrentVehicleData      = nil

ESX                           = nil
GUI.Time                      = 0

Citizen.CreateThread(function ()
  while ESX == nil do
    TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
    Citizen.Wait(0)
  end

  ESX.TriggerServerCallback('esx_motoshop:getCategories', function (categories)
    Categories = categories
  end)

  ESX.TriggerServerCallback('esx_motoshop:getVehicles', function (vehicles)
    Vehicles = vehicles
  end)
end)

function DeleteShopInsideVehicles ()
  while #LastVehicles > 0 do
    local vehicle = LastVehicles[1]
    ESX.Game.DeleteVehicle(vehicle)
    table.remove(LastVehicles, 1)
  end
end

function OpenShopMenu ()
  IsInShopMenu = true

  ESX.UI.Menu.CloseAll()

  local playerPed = GetPlayerPed(-1)

  FreezeEntityPosition(playerPed, true)
  SetEntityVisible(playerPed, false)
  SetEntityCoords(playerPed, Config.Zones.ShopInside.Pos.x, Config.Zones.ShopInside.Pos.y, Config.Zones.ShopInside.Pos.z)

  local vehiclesByCategory = {}
  local elements           = {}
  local firstVehicleData   = nil

  for i=1, #Categories, 1 do
    vehiclesByCategory[Categories[i].name] = {}
  end

  for i=1, #Vehicles, 1 do
    table.insert(vehiclesByCategory[Vehicles[i].category], Vehicles[i])
  end

  for i=1, #Categories, 1 do
    local category         = Categories[i]
    local categoryVehicles = vehiclesByCategory[category.name]
    local options          = {}

    for j=1, #categoryVehicles, 1 do
      local vehicle = categoryVehicles[j]

      if i == 1 and j == 1 then
        firstVehicleData = vehicle
      end

      table.insert(options, vehicle.name .. ' $' .. vehicle.price)
    end

    table.insert(elements, {
      name    = category.name,
      label   = category.label,
      value   = 0,
      type    = 'slider',
      max     = #Categories[i],
      options = options
    })
  end

  ESX.UI.Menu.Open(
    'default', GetCurrentResourceName(), 'vehicle_shop',
    {
      title    = _U('car_dealer'),
      align    = 'top-left',
      elements = elements,
    },
    function (data, menu)
      local vehicleData = vehiclesByCategory[data.current.name][data.current.value + 1]

      ESX.UI.Menu.Open(
        'default', GetCurrentResourceName(), 'shop_confirm',
        {
          title = _U('buy') .. ' ' .. vehicleData.name .. ' ' .. _U('for') .. ' ' .. vehicleData.price .. ' ?',
          align = 'top-left',
          elements = {
            {label = _U('yes'), value = 'yes'},
            {label = _U('no'), value = 'no'},
          },
        },
        function (data2, menu2)
          if data2.current.value == 'yes' then
            if Config.EnablePlayerManagement then
              ESX.TriggerServerCallback('esx_motoshop:buyVehicleSociety', function (hasEnoughMoney)
                if hasEnoughMoney then
                  IsInShopMenu = false

                  DeleteShopInsideVehicles()

                  local playerPed = GetPlayerPed(-1)

                  CurrentAction     = 'shop_menu'
                  CurrentActionMsg  = _U('shop_menu')
                  CurrentActionData = {}

                  FreezeEntityPosition(playerPed, false)
                  SetEntityVisible(playerPed, true)
                  SetEntityCoords(playerPed, Config.Zones.ShopEntering.Pos.x, Config.Zones.ShopEntering.Pos.y, Config.Zones.ShopEntering.Pos.z)

                  menu2.close()
                  menu.close()

                  ESX.ShowNotification(_U('vehicle_purchased'))
                else
                  ESX.ShowNotification(_U('broke_company'))
                end

              end, 'motodealer', vehicleData.model)
            else
              local playerData = ESX.GetPlayerData()

              if Config.EnableSocietyOwnedVehicles and playerData.job.grade_name == 'boss' then
                ESX.UI.Menu.Open(
                  'default', GetCurrentResourceName(), 'shop_confirm_buy_type',
                  {
                    title = 'Type d\'achat',
                    align = 'top-left',
                    elements = {
                      {label = 'Personnel', value = 'personnal'},
                      {label = 'Societé',   value = 'society'},
                    },
                  },
                  function (data3, menu3)

                    if data3.current.value == 'personnal' then
                      ESX.TriggerServerCallback('esx_motoshop:buyVehicle', function (hasEnoughMoney)
                        if hasEnoughMoney then
                          IsInShopMenu = false

                          menu3.close()
                          menu2.close()
                          menu.close()

                          DeleteShopInsideVehicles()

                          ESX.Game.SpawnVehicle(vehicleData.model, {
                            x = Config.Zones.ShopOutside.Pos.x,
                            y = Config.Zones.ShopOutside.Pos.y,
                            z = Config.Zones.ShopOutside.Pos.z
                          }, Config.Zones.ShopOutside.Heading, function (vehicle)

                            TaskWarpPedIntoVehicle(playerPed, vehicle, -1)

                            local vehicleProps = ESX.Game.GetVehicleProperties(vehicle)

                            if Config.EnableOwnedVehicles then
                              TriggerServerEvent('esx_motoshop:setVehicleOwned', vehicleProps)
                            end

                            ESX.ShowNotification(_U('vehicle_purchased'))
                          end)

                          FreezeEntityPosition(playerPed, false)
                          SetEntityVisible(playerPed, true)
                        else
                          ESX.ShowNotification(_U('not_enough_money'))
                        end
                      end, vehicleData.model)
                    end

                    if data3.current.value == 'society' then
                      ESX.TriggerServerCallback('esx_motoshop:buyVehicleSociety', function (hasEnoughMoney)
                        if hasEnoughMoney then

                          IsInShopMenu = false

                          menu3.close()
                          menu2.close()
                          menu.close()

                          DeleteShopInsideVehicles()

                          ESX.Game.SpawnVehicle(vehicleData.model, {
                            x = Config.Zones.ShopOutside.Pos.x,
                            y = Config.Zones.ShopOutside.Pos.y,
                            z = Config.Zones.ShopOutside.Pos.z
                          }, Config.Zones.ShopOutside.Heading, function (vehicle)

                            TaskWarpPedIntoVehicle(playerPed, vehicle, -1)

                            local vehicleProps = ESX.Game.GetVehicleProperties(vehicle)

                            TriggerServerEvent('esx_motoshop:setVehicleOwnedSociety', playerData.job.name, vehicleProps)

                            ESX.ShowNotification(_U('vehicle_purchased'))

                          end)

                          FreezeEntityPosition(playerPed, false)
                          SetEntityVisible(playerPed, true)
                        else
                          ESX.ShowNotification(_U('broke_company'))
                        end
                      end, playerData.job.name, vehicleData.model)
                    end
                  end,
                  function (data3, menu3)
                    menu3.close()
                  end
                )
              else
                ESX.TriggerServerCallback('esx_motoshop:buyVehicle', function (hasEnoughMoney)
                  if hasEnoughMoney then

                    IsInShopMenu = false

                    menu2.close()
                    menu.close()

                    DeleteShopInsideVehicles()

                    ESX.Game.SpawnVehicle(vehicleData.model, {
                      x = Config.Zones.ShopOutside.Pos.x,
                      y = Config.Zones.ShopOutside.Pos.y,
                      z = Config.Zones.ShopOutside.Pos.z
                    }, Config.Zones.ShopOutside.Heading, function (vehicle)

                      TaskWarpPedIntoVehicle(playerPed, vehicle, -1)

                      local vehicleProps = ESX.Game.GetVehicleProperties(vehicle)

                      if Config.EnableOwnedVehicles then
                        TriggerServerEvent('esx_motoshop:setVehicleOwned', vehicleProps)
                      end

                      ESX.ShowNotification(_U('vehicle_purchased'))
                    end)

                    FreezeEntityPosition(playerPed, false)
                    SetEntityVisible(playerPed, true)
                  else
                    ESX.ShowNotification(_U('not_enough_money'))
                  end
                end, vehicleData.model)
              end
            end
          end

          if data2.current.value == 'no' then

          end

        end,
        function (data2, menu2)
          menu2.close()
        end
      )

    end,
    function (data, menu)

      menu.close()

      DeleteShopInsideVehicles()

      local playerPed = GetPlayerPed(-1)

      CurrentAction     = 'shop_menu'
      CurrentActionMsg  = _U('shop_menu')
      CurrentActionData = {}

      FreezeEntityPosition(playerPed, false)
      SetEntityVisible(playerPed, true)

      if Config.EnablePlayerManagement then
        SetEntityCoords(playerPed, Config.Zones.BossActions.Pos.x, Config.Zones.BossActions.Pos.y, Config.Zones.BossActions.Pos.z)
      else
        SetEntityCoords(playerPed, Config.Zones.ShopEntering.Pos.x, Config.Zones.ShopEntering.Pos.y, Config.Zones.ShopEntering.Pos.z)
      end

      IsInShopMenu = false

    end,
    function (data, menu)
      local vehicleData = vehiclesByCategory[data.current.name][data.current.value + 1]
      local playerPed   = GetPlayerPed(-1)

      DeleteShopInsideVehicles()

      ESX.Game.SpawnLocalVehicle(vehicleData.model, {
        x = Config.Zones.ShopInside.Pos.x,
        y = Config.Zones.ShopInside.Pos.y,
        z = Config.Zones.ShopInside.Pos.z
      }, Config.Zones.ShopInside.Heading, function(vehicle)
        table.insert(LastVehicles, vehicle)
        TaskWarpPedIntoVehicle(playerPed, vehicle, -1)
        FreezeEntityPosition(vehicle, true)
      end)
    end
  )

  DeleteShopInsideVehicles()

  ESX.Game.SpawnLocalVehicle(firstVehicleData.model, {
    x = Config.Zones.ShopInside.Pos.x,
    y = Config.Zones.ShopInside.Pos.y,
    z = Config.Zones.ShopInside.Pos.z
  }, Config.Zones.ShopInside.Heading, function (vehicle)
    table.insert(LastVehicles, vehicle)
    TaskWarpPedIntoVehicle(playerPed, vehicle, -1)
    FreezeEntityPosition(vehicle, true)
  end)

end

function OpenResellerMenu ()

  ESX.UI.Menu.CloseAll()

  ESX.UI.Menu.Open(
    'default', GetCurrentResourceName(), 'reseller',
    {
      title    = _U('car_dealer'),
      align    = 'top-left',
      elements = {
        {label = _U('buy_vehicle'),                    value = 'buy_vehicle'},
        {label = _U('pop_vehicle'),                    value = 'pop_vehicle'},
        {label = _U('depop_vehicle'),                  value = 'depop_vehicle'},
        {label = _U('create_bill'),                    value = 'create_bill'},
        {label = _U('get_rented_vehicles'),            value = 'get_rented_vehicles'},
        {label = _U('set_vehicle_owner_sell'),         value = 'set_vehicle_owner_sell'},
        {label = _U('set_vehicle_owner_rent'),         value = 'set_vehicle_owner_rent'},
        {label = _U('set_vehicle_owner_sell_society'), value = 'set_vehicle_owner_sell_society'},
        {label = _U('deposit_stock'),                  value = 'put_stock'},
        {label = _U('take_stock'),                     value = 'get_stock'},
      }
    },
    function (data, menu)
      if data.current.value == 'buy_vehicle' then
        OpenShopMenu()
      end
	  
      if data.current.value == 'put_stock' then
        OpenPutStocksMenu()
      end

      if data.current.value == 'get_stock' then
        OpenGetStocksMenu()
      end

      if data.current.value == 'pop_vehicle' then
        OpenPopVehicleMenu()
      end

      if data.current.value == 'depop_vehicle' then
        DeleteShopInsideVehicles()
      end

      if data.current.value == 'create_bill' then

        ESX.UI.Menu.Open(
          'dialog', GetCurrentResourceName(), 'set_vehicle_owner_sell_amount',
          {
            title = _U('invoice_amount'),
          },
          function (data2, menu)

            local amount = tonumber(data2.value)

            if amount == nil then
              ESX.ShowNotification(_U('invoice_amount'))
            else
              menu.close()

              local closestPlayer, closestDistance = ESX.Game.GetClosestPlayer()

              if closestPlayer == -1 or closestDistance > 3.0 then
                ESX.ShowNotification(_U('invoice_amount'))
              else
                TriggerServerEvent('esx_billing:sendBill', GetPlayerServerId(closestPlayer), 'society_motodealer', _U('car_dealer'), tonumber(data2.value))
              end
            end
          end,
          function (data2, menu)
            menu.close()
          end
        )
      end

      if data.current.value == 'get_rented_vehicles' then
        OpenRentedVehiclesMenu()
      end

      if data.current.value == 'set_vehicle_owner_sell' then
        local closestPlayer, closestDistance = ESX.Game.GetClosestPlayer()

        if closestPlayer == -1 or closestDistance > 3.0 then
          ESX.ShowNotification(_U('no_players'))
        else
          local vehicleProps = ESX.Game.GetVehicleProperties(LastVehicles[#LastVehicles])
          local model        = CurrentVehicleData.model

          TriggerServerEvent('esx_motoshop:sellVehicle', model)

          if Config.EnableOwnedVehicles then
            TriggerServerEvent('esx_motoshop:setVehicleOwnedPlayerId', GetPlayerServerId(closestPlayer), vehicleProps)
            ESX.ShowNotification(_U('vehicle_set_owned', vehicleProps.plate, GetPlayerName(closestPlayer)))
          else
            ESX.ShowNotification(_U('vehicle_sold_to', vehicleProps.plate, GetPlayerName(closestPlayer)))
          end
        end
      end

      if data.current.value == 'set_vehicle_owner_sell_society' then
        local closestPlayer, closestDistance = ESX.Game.GetClosestPlayer()

        if closestPlayer == -1 or closestDistance > 3.0 then
          ESX.ShowNotification(_U('no_players'))
        else
          ESX.TriggerServerCallback('esx:getOtherPlayerData', function (xPlayer)
            local vehicleProps = ESX.Game.GetVehicleProperties(LastVehicles[#LastVehicles])
            local model        = CurrentVehicleData.model

            TriggerServerEvent('esx_motoshop:sellVehicle', model)

            if Config.EnableSocietyOwnedVehicles then
              TriggerServerEvent('esx_motoshop:setVehicleOwnedSociety', xPlayer.job.name, vehicleProps)
              ESX.ShowNotification(_U('vehicle_set_owned', vehicleProps.plate, GetPlayerName(closestPlayer)))
            else
              ESX.ShowNotification(_U('vehicle_sold_to', vehicleProps.plate, GetPlayerName(closestPlayer)))
            end
          end, GetPlayerServerId(closestPlayer))
        end
      end

      if data.current.value == 'set_vehicle_owner_rent' then
        ESX.UI.Menu.Open(
          'dialog', GetCurrentResourceName(), 'set_vehicle_owner_rent_amount',
          {
            title = _U('rental_amount'),
          },
          function (data2, menu)
            local amount = tonumber(data2.value)

            if amount == nil then
              ESX.ShowNotification(_U('invalid_amount'))
            else
              menu.close()

              local closestPlayer, closestDistance = ESX.Game.GetClosestPlayer()

              if closestPlayer == -1 or closestDistance > 5.0 then
                ESX.ShowNotification(_U('no_players'))
              else
                SetVehicleNumberPlateText(LastVehicles[#LastVehicles], 'LOC ' .. ESX.GetRandomString(5))

                local vehicleProps = ESX.Game.GetVehicleProperties(LastVehicles[#LastVehicles])
                local model        = CurrentVehicleData.model

                TriggerServerEvent('esx_motoshop:rentVehicle', model, vehicleProps.plate, GetPlayerName(closestPlayer), CurrentVehicleData.price, amount, GetPlayerServerId(closestPlayer))

                if Config.EnableOwnedVehicles then
                  TriggerServerEvent('esx_motoshop:setVehicleOwnedPlayerId', GetPlayerServerId(closestPlayer), vehicleProps)
                end

                ESX.ShowNotification(_U('vehicle_set_rented', vehicleProps.plate, GetPlayerName(closestPlayer)))

                TriggerServerEvent('esx_motoshop:setVehicleForAllPlayers', vehicleProps, Config.Zones.ShopInside.Pos.x, Config.Zones.ShopInside.Pos.y, Config.Zones.ShopInside.Pos.z, 5.0)
              end
            end
          end,
          function (data2, menu)
            menu.close()
          end
        )
      end
    end,
    function (data, menu)
      menu.close()

      CurrentAction     = 'reseller_menu'
      CurrentActionMsg  = _U('shop_menu')
      CurrentActionData = {}
    end
  )

end

function OpenPersonnalVehicleMenu ()

  ESX.UI.Menu.CloseAll()

  ESX.TriggerServerCallback('esx_motoshop:getPersonnalVehicles', function (vehicles)
    local elements = {}

    for i=1, #vehicles, 1 do
      for j=1, #Vehicles, 1 do
        if vehicles[i].model == GetHashKey(Vehicles[j].model) then
          vehicles[i].name = Vehicles[j].name
        end
      end
    end

    for i=1, #vehicles, 1 do
      table.insert(elements, {label = vehicles[i].name .. ' [' .. vehicles[i].plate .. ']', value = vehicles[i]})
    end

    ESX.UI.Menu.Open(
      'default', GetCurrentResourceName(), 'personnal_vehicle',
      {
        title    = _U('personal_vehicle'),
        align    = 'top-left',
        elements = elements,
      },
      function (data, menu)
        local playerPed   = GetPlayerPed(-1)
        local coords      = GetEntityCoords(playerPed)
        local heading     = GetEntityHeading(playerPed)
        local vehicleData = data.current.value

        menu.close()

        ESX.Game.SpawnVehicle(vehicleData.model, {
          x = coords.x,
          y = coords.y,
          z = coords.z
        }, heading, function (vehicle)
          ESX.Game.SetVehicleProperties(vehicle, vehicleData)
          TaskWarpPedIntoVehicle(playerPed, vehicle, -1)
        end)
      end,
      function (data, menu)
        menu.close()
      end
    )
  end)
end

function OpenPopVehicleMenu ()
  ESX.TriggerServerCallback('esx_motoshop:getCommercialVehicles', function (vehicles)
    local elements = {}

    for i=1, #vehicles, 1 do
      table.insert(elements, {label = vehicles[i].name .. ' $' .. vehicles[i].price, value = vehicles[i].name})
    end

    ESX.UI.Menu.Open(
      'default', GetCurrentResourceName(), 'commercial_vehicles',
      {
        title    = _U('vehicle_dealer'),
        align    = 'top-left',
        elements = elements,
      },
      function (data, menu)
        local model = data.current.value

        DeleteShopInsideVehicles()

        ESX.Game.SpawnVehicle(model, {
          x = Config.Zones.ShopInside.Pos.x,
          y = Config.Zones.ShopInside.Pos.y,
          z = Config.Zones.ShopInside.Pos.z
        }, Config.Zones.ShopInside.Heading, function (vehicle)

          table.insert(LastVehicles, vehicle)

          for i=1, #Vehicles, 1 do
            if model == Vehicles[i].model then
              CurrentVehicleData = Vehicles[i]
            end
          end
        end)
      end,
      function (data, menu)
        menu.close()
      end
    )
  end)
end

function OpenRentedVehiclesMenu ()
  ESX.TriggerServerCallback('esx_motoshop:getRentedVehicles', function (vehicles)
    local elements = {}

    for i=1, #vehicles, 1 do
      table.insert(elements, {label = vehicles[i].playerName .. ' : ' .. vehicles[i].name .. ' - ' .. vehicles[i].plate, value = vehicles[i].name})
    end

    ESX.UI.Menu.Open(
      'default', GetCurrentResourceName(), 'rented_vehicles',
      {
        title    = _U('rent_vehicle'),
        align    = 'top-left',
        elements = elements,
      },
      nil,
      function (data, menu)
        menu.close()
      end
    )
  end)
end

function OpenBossActionsMenu ()
  ESX.UI.Menu.CloseAll()

  ESX.UI.Menu.Open(
    'default', GetCurrentResourceName(), 'reseller',
    {
      title    = _U('dealer_boss'),
      align    = 'top-left',
      elements = {
        {label = 'Akcje szefa',   value = 'boss_actions'},
      },
    },
    function (data, menu)
      if data.current.value == 'boss_actions' then
        TriggerEvent('esx_society:openBossMenu', 'motodealer', function(data, menu)
          menu.close()
        end, {wash = false})
      end
    end,
    function (data, menu)
      menu.close()

      CurrentAction     = 'boss_actions_menu'
      CurrentActionMsg  = _U('shop_menu')
      CurrentActionData = {}
    end
  )
end


function OpenGetStocksMenu ()
  ESX.TriggerServerCallback('esx_motoshop:getStockItems', function (items)
    local elements = {}

    for i=1, #items, 1 do
      table.insert(elements, {label = 'x' .. items[i].count .. ' ' .. items[i].label, value = items[i].name})
    end

    ESX.UI.Menu.Open(
      'default', GetCurrentResourceName(), 'stocks_menu',
      {
        title    = _U('dealership_stock'),
        elements = elements,
      },
      function (data, menu)
        local itemName = data.current.value

        ESX.UI.Menu.Open(
          'dialog', GetCurrentResourceName(), 'stocks_menu_get_item_count',
          {
            title = _U('amount'),
          },
          function (data2, menu2)
            local count = tonumber(data2.value)

            if count == nil then
              ESX.ShowNotification(_U('quantity_invalid'))
            else
              menu2.close()
              menu.close()
              OpenGetStocksMenu()

              TriggerServerEvent('esx_motoshop:getStockItem', itemName, count)
            end
          end,
          function (data2, menu2)
            menu2.close()
          end
        )
      end,
      function (data, menu)
        menu.close()
      end
    )
  end)
end

function OpenPutStocksMenu ()
  ESX.TriggerServerCallback('esx_motoshop:getPlayerInventory', function (inventory)
    local elements = {}

    for i=1, #inventory.items, 1 do
      local item = inventory.items[i]

      if item.count > 0 then
        table.insert(elements, {label = item.label .. ' x' .. item.count, type = 'item_standard', value = item.name})
      end
    end

    ESX.UI.Menu.Open(
      'default', GetCurrentResourceName(), 'stocks_menu',
      {
        title    = _U('inventory'),
        elements = elements,
      },
      function (data, menu)
        local itemName = data.current.value

        ESX.UI.Menu.Open(
          'dialog', GetCurrentResourceName(), 'stocks_menu_put_item_count',
          {
            title = _U('amount'),
          },
          function (data2, menu2)
            local count = tonumber(data2.value)

            if count == nil then
              ESX.ShowNotification(_U('quantity_invalid'))
            else
              menu2.close()
              menu.close()
              OpenPutStocksMenu()

              TriggerServerEvent('esx_motoshop:putStockItems', itemName, count)
            end

          end,
          function (data2, menu2)
            menu2.close()
          end
        )
      end,
      function (data, menu)
        menu.close()
      end
    )
  end)
end


RegisterNetEvent('esx:playerLoaded')
AddEventHandler('esx:playerLoaded', function (xPlayer)
  PlayerData = xPlayer

  if Config.EnablePlayerManagement then
    if PlayerData.job.name == 'motodealer' then
      Config.Zones.ShopEntering.Type = 1

      if PlayerData.job.grade_name == 'boss' then
        Config.Zones.BossActions.Type = 1
      end
    else
      Config.Zones.ShopEntering.Type = -1
      Config.Zones.BossActions.Type  = -1
    end
  end
end)

RegisterNetEvent('esx:setJob')
AddEventHandler('esx:setJob', function (job)
  PlayerData.job = job

  if Config.EnablePlayerManagement then
    if PlayerData.job.name == 'motodealer' then
      Config.Zones.ShopEntering.Type = 1

      if PlayerData.job.grade_name == 'boss' then
        Config.Zones.BossActions.Type = 1
      end

    else
      Config.Zones.ShopEntering.Type = -1
      Config.Zones.BossActions.Type  = -1
    end
  end
end)

RegisterNetEvent('esx_motoshop:openPersonnalVehicleMenu')
AddEventHandler('esx_motoshop:openPersonnalVehicleMenu', function ()
  OpenPersonnalVehicleMenu()
end)

AddEventHandler('esx_motoshop:hasEnteredMarker', function (zone)
  if zone == 'ShopEntering' then
    if Config.EnablePlayerManagement then
      if PlayerData.job ~= nil and PlayerData.job.name == 'motodealer' then
        CurrentAction     = 'reseller_menu'
        CurrentActionMsg  = _U('shop_menu')
        CurrentActionData = {}
      end
    else
      CurrentAction     = 'shop_menu'
      CurrentActionMsg  = _U('shop_menu')
      CurrentActionData = {}
    end
  end

  if zone == 'GiveBackVehicle' and Config.EnablePlayerManagement then
    local playerPed = GetPlayerPed(-1)

    if IsPedInAnyVehicle(playerPed, false) then
      local vehicle = GetVehiclePedIsIn(playerPed, false)

      CurrentAction     = 'give_back_vehicle'
      CurrentActionMsg  = _U('vehicle_menu')

      CurrentActionData = {
        vehicle = vehicle
      }
    end
  end

  if zone == 'ResellVehicle' then
    local playerPed = GetPlayerPed(-1)

    if IsPedInAnyVehicle(playerPed, false) then
      local vehicle     = GetVehiclePedIsIn(playerPed, false)
      local vehicleData = nil

      for i=1, #Vehicles, 1 do
        if GetHashKey(Vehicles[i].model) == GetEntityModel(vehicle) then
          vehicleData = Vehicles[i]
          break
        end
      end

      local resellPrice = math.floor(vehicleData.price / 100 * Config.ResellPercentage)

      CurrentAction     = 'resell_vehicle'
      CurrentActionMsg  = _U('sell_menu').. vehicleData.name .. _U('price') .. resellPrice

      CurrentActionData = {
        vehicle = vehicle,
        price   = resellPrice
      }
    end
  end

  if zone == 'BossActions' and Config.EnablePlayerManagement and PlayerData.job ~= nil and PlayerData.job.name == 'motodealer' and PlayerData.job.grade_name == 'boss' then
    CurrentAction     = 'boss_actions_menu'
    CurrentActionMsg  = _U('shop_menu')
    CurrentActionData = {}
  end
end)

AddEventHandler('esx_motoshop:hasExitedMarker', function (zone)
  if not IsInShopMenu then
    ESX.UI.Menu.CloseAll()
  end

  CurrentAction = nil
end)

if Config.EnablePlayerManagement then
  RegisterNetEvent('esx_phone:loaded')
  AddEventHandler('esx_phone:loaded', function (phoneNumber, contacts)
    local specialContact = {
      name       = _U('dealership'),
      number     = 'motodealer',
      base64Icon = 'data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAJAAAACQCAYAAADnRuK4AAAACXBIWXMAAAsTAAALEwEAmpwYAAA4JmlUWHRYTUw6Y29tLmFkb2JlLnhtcAAAAAAAPD94cGFja2V0IGJlZ2luPSLvu78iIGlkPSJXNU0wTXBDZWhpSHpyZVN6TlRjemtjOWQiPz4KPHg6eG1wbWV0YSB4bWxuczp4PSJhZG9iZTpuczptZXRhLyIgeDp4bXB0az0iQWRvYmUgWE1QIENvcmUgNS42LWMxMzggNzkuMTU5ODI0LCAyMDE2LzA5LzE0LTAxOjA5OjAxICAgICAgICAiPgogICA8cmRmOlJERiB4bWxuczpyZGY9Imh0dHA6Ly93d3cudzMub3JnLzE5OTkvMDIvMjItcmRmLXN5bnRheC1ucyMiPgogICAgICA8cmRmOkRlc2NyaXB0aW9uIHJkZjphYm91dD0iIgogICAgICAgICAgICB4bWxuczp4bXA9Imh0dHA6Ly9ucy5hZG9iZS5jb20veGFwLzEuMC8iCiAgICAgICAgICAgIHhtbG5zOmRjPSJodHRwOi8vcHVybC5vcmcvZGMvZWxlbWVudHMvMS4xLyIKICAgICAgICAgICAgeG1sbnM6cGhvdG9zaG9wPSJodHRwOi8vbnMuYWRvYmUuY29tL3Bob3Rvc2hvcC8xLjAvIgogICAgICAgICAgICB4bWxuczp4bXBNTT0iaHR0cDovL25zLmFkb2JlLmNvbS94YXAvMS4wL21tLyIKICAgICAgICAgICAgeG1sbnM6c3RFdnQ9Imh0dHA6Ly9ucy5hZG9iZS5jb20veGFwLzEuMC9zVHlwZS9SZXNvdXJjZUV2ZW50IyIKICAgICAgICAgICAgeG1sbnM6dGlmZj0iaHR0cDovL25zLmFkb2JlLmNvbS90aWZmLzEuMC8iCiAgICAgICAgICAgIHhtbG5zOmV4aWY9Imh0dHA6Ly9ucy5hZG9iZS5jb20vZXhpZi8xLjAvIj4KICAgICAgICAgPHhtcDpDcmVhdG9yVG9vbD5BZG9iZSBQaG90b3Nob3AgQ0MgMjAxNyAoV2luZG93cyk8L3htcDpDcmVhdG9yVG9vbD4KICAgICAgICAgPHhtcDpDcmVhdGVEYXRlPjIwMTgtMDctMjVUMDE6MTI6MTMrMDI6MDA8L3htcDpDcmVhdGVEYXRlPgogICAgICAgICA8eG1wOk1vZGlmeURhdGU+MjAxOC0wNy0yNVQwMTozMDozNyswMjowMDwveG1wOk1vZGlmeURhdGU+CiAgICAgICAgIDx4bXA6TWV0YWRhdGFEYXRlPjIwMTgtMDctMjVUMDE6MzA6MzcrMDI6MDA8L3htcDpNZXRhZGF0YURhdGU+CiAgICAgICAgIDxkYzpmb3JtYXQ+aW1hZ2UvcG5nPC9kYzpmb3JtYXQ+CiAgICAgICAgIDxwaG90b3Nob3A6Q29sb3JNb2RlPjM8L3Bob3Rvc2hvcDpDb2xvck1vZGU+CiAgICAgICAgIDx4bXBNTTpJbnN0YW5jZUlEPnhtcC5paWQ6OGQzZjYwNTYtYzc1ZS1jZDRmLTgyZjEtN2MxNWM2MGE0YTA3PC94bXBNTTpJbnN0YW5jZUlEPgogICAgICAgICA8eG1wTU06RG9jdW1lbnRJRD54bXAuZGlkOjhkM2Y2MDU2LWM3NWUtY2Q0Zi04MmYxLTdjMTVjNjBhNGEwNzwveG1wTU06RG9jdW1lbnRJRD4KICAgICAgICAgPHhtcE1NOk9yaWdpbmFsRG9jdW1lbnRJRD54bXAuZGlkOjhkM2Y2MDU2LWM3NWUtY2Q0Zi04MmYxLTdjMTVjNjBhNGEwNzwveG1wTU06T3JpZ2luYWxEb2N1bWVudElEPgogICAgICAgICA8eG1wTU06SGlzdG9yeT4KICAgICAgICAgICAgPHJkZjpTZXE+CiAgICAgICAgICAgICAgIDxyZGY6bGkgcmRmOnBhcnNlVHlwZT0iUmVzb3VyY2UiPgogICAgICAgICAgICAgICAgICA8c3RFdnQ6YWN0aW9uPmNyZWF0ZWQ8L3N0RXZ0OmFjdGlvbj4KICAgICAgICAgICAgICAgICAgPHN0RXZ0Omluc3RhbmNlSUQ+eG1wLmlpZDo4ZDNmNjA1Ni1jNzVlLWNkNGYtODJmMS03YzE1YzYwYTRhMDc8L3N0RXZ0Omluc3RhbmNlSUQ+CiAgICAgICAgICAgICAgICAgIDxzdEV2dDp3aGVuPjIwMTgtMDctMjVUMDE6MTI6MTMrMDI6MDA8L3N0RXZ0OndoZW4+CiAgICAgICAgICAgICAgICAgIDxzdEV2dDpzb2Z0d2FyZUFnZW50PkFkb2JlIFBob3Rvc2hvcCBDQyAyMDE3IChXaW5kb3dzKTwvc3RFdnQ6c29mdHdhcmVBZ2VudD4KICAgICAgICAgICAgICAgPC9yZGY6bGk+CiAgICAgICAgICAgIDwvcmRmOlNlcT4KICAgICAgICAgPC94bXBNTTpIaXN0b3J5PgogICAgICAgICA8dGlmZjpPcmllbnRhdGlvbj4xPC90aWZmOk9yaWVudGF0aW9uPgogICAgICAgICA8dGlmZjpYUmVzb2x1dGlvbj43MjAwMDAvMTAwMDA8L3RpZmY6WFJlc29sdXRpb24+CiAgICAgICAgIDx0aWZmOllSZXNvbHV0aW9uPjcyMDAwMC8xMDAwMDwvdGlmZjpZUmVzb2x1dGlvbj4KICAgICAgICAgPHRpZmY6UmVzb2x1dGlvblVuaXQ+MjwvdGlmZjpSZXNvbHV0aW9uVW5pdD4KICAgICAgICAgPGV4aWY6Q29sb3JTcGFjZT42NTUzNTwvZXhpZjpDb2xvclNwYWNlPgogICAgICAgICA8ZXhpZjpQaXhlbFhEaW1lbnNpb24+MTQ0PC9leGlmOlBpeGVsWERpbWVuc2lvbj4KICAgICAgICAgPGV4aWY6UGl4ZWxZRGltZW5zaW9uPjE0NDwvZXhpZjpQaXhlbFlEaW1lbnNpb24+CiAgICAgIDwvcmRmOkRlc2NyaXB0aW9uPgogICA8L3JkZjpSREY+CjwveDp4bXBtZXRhPgogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAKICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIAogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAKICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIAogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAKICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIAogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAKICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIAogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAKICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIAogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAKICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIAogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAKICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIAogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAKICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIAogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAKICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIAogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAKICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIAogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAKICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIAogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAKICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIAogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAKICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIAogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAKICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIAogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAKICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIAogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAKICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIAogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAKICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIAogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAKICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIAogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAKICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIAogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAKICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIAogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAKICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIAogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAKICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIAogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAKICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIAogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAKICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIAogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAKICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIAogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAKICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIAogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAKICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIAogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAKICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIAogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAKICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIAogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAKICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIAogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAKICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIAogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAKICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIAogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAKICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIAogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAKICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIAogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAKICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIAogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAKICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIAogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAKICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIAogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAKICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIAogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAKICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIAogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAKICAgICAgICAgICAg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',
    }

    TriggerEvent('esx_phone:addSpecialContact', specialContact.name, specialContact.number, specialContact.base64Icon)
  end)
end

-- Create Blips
Citizen.CreateThread(function ()
  local blip = AddBlipForCoord(265.30, -1156.82, 29.02)

  SetBlipSprite (blip, 326)
  SetBlipDisplay(blip, 4)
  SetBlipScale  (blip, 1.0)
  SetBlipAsShortRange(blip, true)

  BeginTextCommandSetBlipName("STRING")
  AddTextComponentString(_U('moto_dealer'))
  EndTextCommandSetBlipName(blip)
end)

-- Display markers
Citizen.CreateThread(function ()
  while true do
    Wait(0)

    local coords = GetEntityCoords(GetPlayerPed(-1))

    for k,v in pairs(Config.Zones) do
      if(v.Type ~= -1 and GetDistanceBetweenCoords(coords, v.Pos.x, v.Pos.y, v.Pos.z, true) < Config.DrawDistance) then
        DrawMarker(v.Type, v.Pos.x, v.Pos.y, v.Pos.z, 0.0, 0.0, 0.0, 0, 0.0, 0.0, v.Size.x, v.Size.y, v.Size.z, Config.MarkerColor.r, Config.MarkerColor.g, Config.MarkerColor.b, 100, false, true, 2, false, false, false, false)
      end
    end
  end
end)

-- Enter / Exit marker events
Citizen.CreateThread(function ()
  while true do
    Wait(0)

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
      TriggerEvent('esx_motoshop:hasEnteredMarker', currentZone)
    end

    if not isInMarker and HasAlreadyEnteredMarker then
      HasAlreadyEnteredMarker = false
      TriggerEvent('esx_motoshop:hasExitedMarker', LastZone)
    end
  end
end)

-- Key controls
Citizen.CreateThread(function ()
  while true do
    Citizen.Wait(0)

    if CurrentAction ~= nil then
      SetTextComponentFormat('STRING')
      AddTextComponentString(CurrentActionMsg)
      DisplayHelpTextFromStringLabel(0, 0, 1, -1)

      if IsControlPressed(0, Keys['E']) and (GetGameTimer() - GUI.Time) > 300 then
        if CurrentAction == 'shop_menu' then
          OpenShopMenu()
        end

        if CurrentAction == 'reseller_menu' then
          OpenResellerMenu()
        end

        if CurrentAction == 'give_back_vehicle' then
          ESX.TriggerServerCallback('esx_motoshop:giveBackVehicle', function (isRentedVehicle)
            if isRentedVehicle then
              DeleteVehicle(CurrentActionData.vehicle)
              ESX.ShowNotification(_U('delivered'))
            else
              ESX.ShowNotification(_U('not_rental'))
            end
          end, GetVehicleNumberPlateText(CurrentActionData.vehicle))
        end

        if CurrentAction == 'resell_vehicle' then
          ESX.TriggerServerCallback('esx_motoshop:resellVehicle', function (isOwnedVehicle)
            if isOwnedVehicle then
              DeleteVehicle(CurrentActionData.vehicle)
              ESX.ShowNotification(_U('vehicle_sold'))
            else
              ESX.ShowNotification(_U('not_yours'))
            end
          end, GetVehicleNumberPlateText(CurrentActionData.vehicle), CurrentActionData.price)
        end

        if CurrentAction == 'boss_actions_menu' then
          OpenBossActionsMenu()
        end

        CurrentAction = nil
        GUI.Time      = GetGameTimer()
      end
    end
  end
end)
