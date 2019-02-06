ESX = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

function getPlayerFromId(source)
    local identifiers = GetPlayerIdentifiers(source)
    local player = getIdentifier(identifiers)
    return player
end

function getIdentifier(id)
    for _, v in ipairs(id) do
        return v
    end
end

AddEventHandler('playerConnecting', function(peerName, setKickReason)
    local numIds = GetNumPlayerIdentifiers(source)
	for i,allowedID in ipairs(cfg.AllowedIDs) do
        for i = 0, numIds-3 do
            if cfg.isOnMaintenance == true and getPlayerFromId(source) ~= allowedID then
                print('-----------------PRACE NA SERWERZE-----------')
                print('Sorry ogarniamy server: [' .. peerName ..']      ')
                print('-----------------PRACE NA SERWERZE-----------')
                
				setKickReason('Chwilowo sa prace na serwerze, zapraszamy potem!')
				CancelEvent()
			end
		end
    end
end)
