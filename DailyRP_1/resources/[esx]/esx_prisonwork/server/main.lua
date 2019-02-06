ESX = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

RegisterServerEvent('esx_loffe_fangelse:Pay')
AddEventHandler('esx_loffe_fangelse:Pay', function()

    local _source = source
    local xPlayer = ESX.GetPlayerFromId(_source)

	xPlayer.addMoney(Config.Payment)
	sendNotification(_source, 'Zarobiles ' .. Config.Payment ..'$', 'success', 2500)

end)

--notification
function sendNotification(xSource, message, messageType, messageTimeout)
    TriggerClientEvent("pNotify:SendNotification", xSource, {
        text = message,
        type = messageType,
        queue = "lmao",
        timeout = messageTimeout,
        layout = "bottomCenter"
    })
end