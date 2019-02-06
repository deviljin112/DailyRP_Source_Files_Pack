local listsize = 25
local activeai = false
local stockspopulated = false
local debug = false

local serverdata = {}
serverdata.Stocks = { }


---------------------------------------------

-- send data to client
function refreshclients()
    local data = json.encode(serverdata)
    TriggerClientEvent('vn_stocks:currentstocks',-1,data)
end

function repopulatestocks()
    for i=1, #serverdata.Stocks, 1 do
        local stockchange = 0
        local randomstockvalue = math.random(0,Config.maxstockvaluechange)
        --print(randomstockvalue)
        local stock = serverdata.Stocks[i]
        local stocktype = stock.type
        local stockname = stock.name
        local stockvalue = stock.value
        --print(stockvalue)

        local randomnum = math.random(1,3)

        if randomnum == 1 then
            stockchange = stockvalue - randomstockvalue
        elseif randomnum == 2 then
            stockchange = stockvalue
        elseif randomnum == 3 then
            stockchange = stockvalue + randomstockvalue
        end
        if stockchange < 0 then
            stockchange = 0
        end
        serverdata.Stocks[i].value = stockchange
        if debug then
            print('stock number:'.. i ..' stock type: '.. stocktype ..' stock name: '.. stockname ..' current value: '..serverdata.Stocks[i].value)
        end
        Wait(1)
    end
    stockspopulated = true
    if debug then
        local data = json.encode(serverdata)
        print('-----------------------------------------------------------------\n'..data)
    end
    refreshclients()
end

-------------------------------------------------

RegisterServerEvent('playerSpawn')
AddEventHandler('playerSpawn', function()
    local data = json.encode(serverdata)
    TriggerClientEvent('vn_stocks:currentstocks',source,data)
    print('data sent to '..source)
end)

-- what to do with player buying said stock
RegisterServerEvent('vn_stocks:buystock')
AddEventHandler('vn_stocks:buystock', function(stockname)
    print('['..source..'] buystock: '..stockname)
end)

-- what to do with player selling said stock
RegisterServerEvent('vn_stocks:sellstock')
AddEventHandler('vn_stocks:sellstock', function(stockname)
    print('['..source..'] sellstock: '..stockname)
end)


-- turn automatic refresh on (server window)
RegisterCommand("aion", function(source, args, raw)
    if source == 0 then --server only command
        activeai = true
    end
end, false)

-- turn automatic refresh off (server window)
RegisterCommand("aioff", function(source, args, raw)
    if source == 0 then --server only command
        activeai = false
    end
end, false)

-- post data to (server window)
RegisterCommand("encode", function(source, args, raw)
    if source == 0 then
        local data = json.encode(serverdata)
        print(data)
    end
end, false)

-- reset stocks
RegisterCommand("populatestocks", function(source, args, raw)
    if source == 0 then
        repopulatestocks()
    end
end, false)

Citizen.CreateThread(function()
    serverdata = Config
    while true do
        Wait(0)
        if stockspopulated == false then
            repopulatestocks()
        elseif stockspopulated then
            if activeai then
                repopulatestocks()
                Wait(Config.minute * Config.stockRefresh)
            end
        end
    end
end)