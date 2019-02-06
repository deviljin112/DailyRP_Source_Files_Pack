ESX = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

RegisterServerEvent('esx-qalle-needs:sync')
AddEventHandler('esx-qalle-needs:sync', function(player, need, gender)
    TriggerClientEvent('esx-qalle-needs:syncCL', -1, player, need, gender)
end)

RegisterServerEvent('esx-qalle-needs:add')
AddEventHandler('esx-qalle-needs:add', function(need, amount)
    local src = tonumber(source)
    TriggerClientEvent('esx_status:add', src, need, amount)
end)
