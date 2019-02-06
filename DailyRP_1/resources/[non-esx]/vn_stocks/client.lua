local stocktable = {}
local debug = true

ESX                             = nil

Citizen.CreateThread(function()
  while ESX == nil do
    TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
    Citizen.Wait(0)
  end
end)

------------------------------------------------------------------

-- update from server

RegisterNetEvent('vn_stocks:currentstocks')
AddEventHandler('vn_stocks:currentstocks', function(stock)     
    stocktable = json.decode(stock)
    if debug then
        print('Stocks Updated')
        print(json.encode(stock))
    end
end)

-------------------------------------------------------------------

-- chat command /stocks

RegisterCommand("stocks", function(source, args, raw)
    local elements = {}
    local elements2 = {}
    for i=1, #stocktable.Stocks, 1 do
        local ldata = stocktable.Stocks
        local stockvalue = ldata[i].value
        local stockname = ldata[i].name
        local stocktype = ldata[i].type
        print('stock number:'.. i ..' stock type: '.. stocktype ..' stock name: '.. stockname ..' current value: '..stockvalue)
        table.insert(elements2, {label = stockname, value = stockname, price = stockvalue})
    end
    ESX.UI.Menu.CloseAll()
    ESX.UI.Menu.Open(
        'default', GetCurrentResourceName(), 'stock_info',
        {
        title    = 'Stocks',
        align    = 'bottom-right',
        elements = elements2,
        },
        function(data, menu)
        
        local currentstock = data.current.value
        local currentstockvalue = data.current.price
        if debug then
            print('current selected stock: '..currentstock)
        end
        ESX.UI.Menu.CloseAll()
        ESX.UI.Menu.Open(
            'default', GetCurrentResourceName(), 'stock_buy_info',
            {
            title    = currentstock .. ' $'..currentstockvalue,
            align    = 'bottom-right',
            elements = {
                {label = 'Buy', value = 'Buy_Stock' },
                {label = 'Sell', value = 'Sell_Stock' },
                {label = 'Close', value = 'Close_Menu' },
                },
            },
            function(data, menu)
            
            if data.current.value == 'Buy_Stock' then
                TriggerServerEvent('vn_stocks:buystock',currentstock)
            elseif data.current.value == 'Sell_Stock' then
                TriggerServerEvent('vn_stocks:sellstock',currentstock)
            end
            if debug then
                print(data.current.value)
            end
            ESX.UI.Menu.CloseAll()
        
        end)
    
    end)
end, false)

-------------------------------------------------------------------