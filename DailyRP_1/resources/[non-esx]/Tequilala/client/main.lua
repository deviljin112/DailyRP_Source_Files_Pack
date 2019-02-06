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

local PlayerData                = {}
local GUI                       = {}
local HasAlreadyEnteredMarker   = false
local LastStation               = nil
local LastPart                  = nil
local LastPartNum               = nil
local LastEntity                = nil
local CurrentAction             = nil
local CurrentActionMsg          = ''
local CurrentActionData         = {}

ESX                             = nil
GUI.Time                        = 0

Citizen.CreateThread(function()
  while ESX == nil do
    TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
    Citizen.Wait(10)
  end
end)



function OpenEntryPayment() -- Entrada

  ESX.UI.Menu.Open(
          'dialog', GetCurrentResourceName(), 'pay_money_amount_' .. society,
          {
            title = _U('take_amount')
          },
          function(data, menu)

            local amount = tonumber(data.value)

            if amount == nil or amount ~= Config.Pentry then --- Isto deve estar errado
              ESX.ShowNotification(_U('invalid_amount'))
            else
              menu.close()
              TriggerServerEvent('esx_club:payMoney', society, amount) --server
            end

          end,
          function(data, menu)
            menu.close()
          end
  )
end

function OpenTakeMoneyMenu() -- Levantar o dinheiro

  ESX.UI.Menu.Open(
          'dialog', GetCurrentResourceName(), 'take_money_amount_' .. society,
          {
            title = _U('take_amount')
          },
          function(data, menu)

            local amount = tonumber(data.value)

            if amount == nil then
              ESX.ShowNotification(_U('invalid_amount'))
            else
              menu.close()
              TriggerServerEvent('esx_club:takeMoney', society, amount) --server
            end

          end,
          function(data, menu)
            menu.close()
          end
  )
end

function OpenChangeEntrypay() -- Alterar Valor de entrada entre o max e o min na config

  ESX.UI.Menu.Open( 'dialog', GetCurrentResourceName(), 'entry_money_amount_' .. society,
          {
            title = _U('entry_amount')
          },
          function(data, menu)

            local amount = tonumber(data.value)

            if amount == nil then
              ESX.ShowNotification(_U('invalid_amount'))
            else
              menu.close()
              TriggerServerEvent('esx_club:entryMoney', society, amount) --server
            end

          end,
          function(data, menu)
            menu.close()
          end
  )
end

function OpenvaultMenu(station) -- Armario do club

  if Config.EnableVaultManagement then ---possivelmente retirar linha e tirar do config não há necessidade

    local elements = {
      {label = 'Levantar item',  value = 'get_stock'},
      {label = 'Depositar item',  value = 'put_stock'}
    }

    if PlayerData.job.grade_name == 'boss' then
      table.insert(elements, {label = 'Levantar dinheiro' , value = 'take_money'})
      table.insert(elements, {label = 'Alterar preço de entrada' , value = 'entry_payment'})
    end

    ESX.UI.Menu.CloseAll()

    ESX.UI.Menu.Open(
      'default', GetCurrentResourceName(), 'vault',
      {
        title    = _U('vault'),
        align    = 'bottom-right',
        elements = elements,
      },
      function(data, menu)

        if data.current.value == 'put_stock' then
          OpenPutStocksMenu()
        end

         if data.current.value == 'get_stock' then
           OpenGetStocksMenu()
         end

         if data.current.value == 'take_money' then
           OpenTakeMoneyMenu()
         end

         if data.current.value == 'entry_payment' then
          OpenChangeEntrypay()
         end
      end,
      function(data, menu)

        menu.close()

        CurrentAction     = 'menu_vault'
        CurrentActionMsg  = _U('open_vault')
        CurrentActionData = {station = station}
      end
    )

  end

end


function OpenGetStocksMenu() -- Tirar item

  ESX.TriggerServerCallback('esx_clubowner:getStockItems', function(items)

    print(json.encode(items))

    local elements = {}

    for i=1, #items, 1 do
      table.insert(elements, {label = 'x' .. items[i].count .. ' ' .. items[i].label, value = items[i].name})
    end

    ESX.UI.Menu.Open(
      'default', GetCurrentResourceName(), 'stocks_menu',
      {
        title    = _U('club_stock'),
        elements = elements
      },
      function(data, menu)

        local itemName = data.current.value

        ESX.UI.Menu.Open(
          'dialog', GetCurrentResourceName(), 'stocks_menu_get_item_count',
          {
            title = _U('quantity')
          },
          function(data2, menu2)

            local count = tonumber(data2.value)

            if count == nil then
              ESX.ShowNotification(_U('quantity_invalid'))
            else
              menu2.close()
              menu.close()
              OpenGetStocksMenu()

              TriggerServerEvent('clubowner:getStockItem', itemName, count)
            end

          end,
          function(data2, menu2)
            menu2.close()
          end
        )

      end,
      function(data, menu)
        menu.close()
      end
    )

  end)

end

function OpenPutStocksMenu() -- Colocar item

  ESX.TriggerServerCallback('esx_clubowner:getPlayerInventory', function(inventory)

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
        elements = elements
      },
      function(data, menu)

        local itemName = data.current.value

        ESX.UI.Menu.Open(
          'dialog', GetCurrentResourceName(), 'stocks_menu_put_item_count',
          {
            title = _U('quantity')
          },
          function(data2, menu2)

            local count = tonumber(data2.value)

            if count == nil then
              ESX.ShowNotification(_U('quantity_invalid'))
            else
              menu2.close()
              menu.close()
              OpenPutStocksMenu()

              TriggerServerEvent('esx_clubowner:putStockItems', itemName, count)
            end

          end,
          function(data2, menu2)
            menu2.close()
          end
        )

      end,
      function(data, menu)
        menu.close()
      end
    )

  end)

end

RegisterNetEvent('esx:playerLoaded')
AddEventHandler('esx:playerLoaded', function(xPlayer)
  PlayerData = xPlayer
end)

RegisterNetEvent('esx:setJob')
AddEventHandler('esx:setJob', function(job)
  PlayerData.job = job
end)


AddEventHandler('esx_clubowner:hasEnteredMarker', function(station, part, partNum)

  if part == 'Entry' then
    CurrentAction     = 'menu_entry'
    CurrentActionMsg  = _U('open_cloackroom')
    CurrentActionData = {}
  end

  if part == 'Vault' then
    CurrentAction     = 'menu_vault'
    CurrentActionMsg  = _U('open_vault')
    CurrentActionData = {station = station}
  end
end)

AddEventHandler('esx_clubowner:hasExitedMarker', function(station, part, partNum)
  ESX.UI.Menu.CloseAll()
  CurrentAction = nil
end)


-- Display markers
Citizen.CreateThread(function()
  while true do

    Wait(0)

    if PlayerData.job ~= nil and PlayerData.job.name == 'biker' then

      local playerPed = GetPlayerPed(-1)
      local coords    = GetEntityCoords(playerPed)

      for k,v in pairs(Config.ClubStations) do

        for i=1, #v.Entry, 1 do
          if GetDistanceBetweenCoords(coords,  v.Entry[i].x,  v.Entry[i].y,  v.Entry[i].z,  true) < Config.DrawDistance then
            DrawMarker(Config.MarkerType, v.Entry[i].x, v.Entry[i].y, v.Entry[i].z, 0.0, 0.0, 0.0, 0, 0.0, 0.0, Config.MarkerSize.x, Config.MarkerSize.y, Config.MarkerSize.z, Config.MarkerColor.r, Config.MarkerColor.g, Config.MarkerColor.b, 100, false, true, 2, false, false, false, false)
          end
        end

        for i=1, #v.Vaults, 1 do
          if GetDistanceBetweenCoords(coords,  v.Vaults[i].x,  v.Vaults[i].y,  v.Vaults[i].z,  true) < Config.DrawDistance then
            DrawMarker(Config.MarkerType, v.Vaults[i].x, v.Vaults[i].y, v.Vaults[i].z, 0.0, 0.0, 0.0, 0, 0.0, 0.0, Config.MarkerSize.x, Config.MarkerSize.y, Config.MarkerSize.z, Config.MarkerColor.r, Config.MarkerColor.g, Config.MarkerColor.b, 100, false, true, 2, false, false, false, false)
          end
        end

      end

    end

  end
end)

-- Enter / Exit marker events
Citizen.CreateThread(function()

  while true do

    Wait(0)

    if PlayerData.job ~= nil and PlayerData.job.name == 'biker' then

      local playerPed      = GetPlayerPed(-1)
      local coords         = GetEntityCoords(playerPed)
      local isInMarker     = false
      local currentStation = nil
      local currentPart    = nil
      local currentPartNum = nil

      for k,v in pairs(Config.ClubStations) do

        for i=1, #v.Entry, 1 do
          if GetDistanceBetweenCoords(coords,  v.Entry[i].x,  v.Entry[i].y,  v.Entry[i].z,  true) < Config.MarkerSize.x then
            isInMarker     = true
            currentStation = k
            currentPart    = 'Entry'
            currentPartNum = i
          end
        end

        for i=1, #v.Vaults, 1 do
          if GetDistanceBetweenCoords(coords,  v.Vaults[i].x,  v.Vaults[i].y,  v.Vaults[i].z,  true) < Config.MarkerSize.x then
            isInMarker     = true
            currentStation = k
            currentPart    = 'Vault'
            currentPartNum = i
          end
        end

      local hasExited = false

      if isInMarker and not HasAlreadyEnteredMarker or (isInMarker and (LastStation ~= currentStation or LastPart ~= currentPart or LastPartNum ~= currentPartNum) ) then

        if
          (LastStation ~= nil and LastPart ~= nil and LastPartNum ~= nil) and
          (LastStation ~= currentStation or LastPart ~= currentPart or LastPartNum ~= currentPartNum)
        then
          TriggerEvent('esx_clubowner:hasExitedMarker', LastStation, LastPart, LastPartNum)
          hasExited = true
        end

        HasAlreadyEnteredMarker = true
        LastStation             = currentStation
        LastPart                = currentPart
        LastPartNum             = currentPartNum

        TriggerEvent('esx_clubowner:hasEnteredMarker', currentStation, currentPart, currentPartNum)
      end

      if not hasExited and not isInMarker and HasAlreadyEnteredMarker then

        HasAlreadyEnteredMarker = false

        TriggerEvent('esx_clubowner:hasExitedMarker', LastStation, LastPart, LastPartNum)
      end

     end
    end

  end
end)

-- Key Controls
Citizen.CreateThread(function()
  while true do

    Citizen.Wait(10)

    if CurrentAction ~= nil then

      SetTextComponentFormat('STRING')
      AddTextComponentString(CurrentActionMsg)
      DisplayHelpTextFromStringLabel(0, 0, 1, -1)

    if CurrentAction == 'mmenu_entry' then
      OpenEntryPayment()
    end

      if IsControlPressed(0,  Keys['E']) and PlayerData.job ~= nil and PlayerData.job.name == 'biker' and (GetGameTimer() - GUI.Time) > 150 then

        if CurrentAction == 'menu_vault' then
          OpenVaultMenu(CurrentActionData.station)
        end
       
        CurrentAction = nil
        GUI.Time      = GetGameTimer()

      end

    end

  end
end)

--- Alteração de trabalho na config (Config.Job)
