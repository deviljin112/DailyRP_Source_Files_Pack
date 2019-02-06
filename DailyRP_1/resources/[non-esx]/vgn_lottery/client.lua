ESX = nil
TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)
    end
end)

RegisterNetEvent('vgn_lottery:buyTicket')
AddEventHandler('vgn_lottery:buyTicket', function()

end)