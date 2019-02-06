local scores = {}
local canStart = true
ESX = nil
TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

function getIdentity(source, callback)
  local identifier = GetPlayerIdentifiers(source)[1]
  MySQL.Async.fetchAll("SELECT * FROM `users` WHERE `identifier` = @identifier", {['@identifier'] = identifier},
  function(result)
    if result[1]['firstname'] ~= nil then
      local data = {
        identifier    = result[1]['identifier'],
        firstname     = result[1]['firstname'],
        lastname      = result[1]['lastname'],
        dateofbirth   = result[1]['dateofbirth'],
        sex           = result[1]['sex'],
        height        = result[1]['height']
      }
      callback(data)
    else
      local data = {
        identifier    = '',
        firstname     = '',
        lastname      = '',
        dateofbirth   = '',
        sex           = '',
        height        = ''
      }
      callback(data)
    end
  end)
end


ESX.RegisterServerCallback('gunrange:canshoot',function(source,cb)
	if canStart then
		cb(true)
	else
		cb(false)
	end
end)

RegisterNetEvent('gunrange:startShooting')
AddEventHandler('gunrange:startShooting',function(wTime,targets)
	canStart = false
		SetTimeout((wTime*targets),function()
		canStart = true
	end)
end)


RegisterNetEvent('gunrange:showresulttoNearbyPlayers')
AddEventHandler('gunrange:showresulttoNearbyPlayers',function(difficulty,points,targets)
	getIdentity(source, function(data)
		TriggerClientEvent('gunrange:sendresultsforplayers',-1,data.firstname,data.lastname,difficulty,points,targets)
	end)
end)


RegisterNetEvent('gunrange:updateScoreboard')
AddEventHandler('gunrange:updateScoreboard',function(difficulty,points,targets)
  getIdentity(source, function(data)
    name = data.firstname..' '..data.lastname
    table.insert(scores,1,{name=name,dif=difficulty,tar=targets,score=points})
  end)

  if #scores > 10 then
    table.remove(scores,#scores)
  end
end)


ESX.RegisterServerCallback('gunrange:GetScores',function(source,cb)
  cb(scores)
end)