ESX                       = nil
local DisptachRequestId   = 0
local PhoneNumbers        = {}

TriggerEvent('esx:getSharedObject', function(obj)
  ESX = obj
end)

function GenerateUniquePhoneNumber()

  local foundNumber = false
  local phoneNumber = nil

  while not foundNumber do

    randomNumber = math.random(10000, 99999)
	phoneNumber = randomNumber

	local result = MySQL.Sync.fetchAll(
	  'SELECT COUNT(*) as count FROM users WHERE phone_number = @phoneNumber',
	  {
		['@phoneNumber'] = phoneNumber
	  }
	)

	local count  = tonumber(result[1].count)

	if count == 0 then
	  foundNumber = true
	end

  end

  return phoneNumber
end

function GetDistpatchRequestId()

  local requestId = DisptachRequestId

  if DisptachRequestId < 65535 then
	DisptachRequestId = DisptachRequestId + 1
  else
	DisptachRequestId = 0
  end

  return requestId

end

function EndCall(source, channel, target)

  local xPlayer = ESX.GetPlayerFromId(source)

  print('ROZMOWA ZAKONCZONA => ' .. channel)

  xPlayer.set('onCall', nil)

  TriggerClientEvent('esx_phone:endCall', source)

  if target ~= nil then

	local targetXPlayer = ESX.GetPlayerFromId(target)

	if targetXPlayer ~= nil then
	  targetXPlayer.set('onCall', nil)
	  TriggerClientEvent('esx_phone:endCall', target)
	end

  end

end

RegisterServerEvent('esx_phone:tryOpenPhone')
AddEventHandler('esx_phone:tryOpenPhone', function()
	local xPlayer = ESX.GetPlayerFromId(source)

	if xPlayer ~= nil then
		if xPlayer.getInventoryItem('blackberry').count >= 1 then
			TriggerClientEvent('esx_phone:openPhone', source)
		else
			sendNotification(source, 'Nie posiadasz Telefonu', 'warning', 2500)
		end
	end
end)

RegisterServerEvent('esx_phone:tryOpenPhoneCalling')
AddEventHandler('esx_phone:tryOpenPhoneCalling', function(target, channel, number)
	local xPlayer = ESX.GetPlayerFromId(source)
	local targetXPlayer = ESX.GetPlayerFromId(target)

	if xPlayer ~= nil then
		if xPlayer.getInventoryItem('blackberry').count >= 1 then
			TriggerClientEvent('esx_phone:openPhoneCalling', source, target, channel, number)
		else
			--sendNotification(targetXPlayer.source, 'Mottagaren kan inte svara nu', 'warning', 2500)
			TriggerClientEvent('esx_phone:endCall', targetXPlayer.source, 'Kontakt nie jest dostepny')
		end
	end
end)

RegisterServerEvent('esx_phone:startCall')
AddEventHandler('esx_phone:startCall', function(number)

  local _source     = source
  local xPlayer     = ESX.GetPlayerFromId(_source)
  local xPlayers    = ESX.GetPlayers()
  local channel     = _source + 1000
  local foundPlayer = false

  for i=1, #xPlayers, 1 do

	local targetXPlayer = ESX.GetPlayerFromId(xPlayers[i])

	if targetXPlayer.get('phoneNumber') == tonumber(number) then
	  foundPlayer = targetXPlayer
	  break
	end

  end

  if foundPlayer ~= false then

	xPlayer    .set('onCall', {channel = channel, target = foundPlayer.source})
	foundPlayer.set('onCall', {channel = channel, target = xPlayer.source})

	print('ROZMOWA ZACZETA => ' .. xPlayer.name .. '@' .. foundPlayer.name .. ' => ' .. channel)
   
	TriggerClientEvent('esx_phone:incomingCall', foundPlayer.source, xPlayer.source, channel, xPlayer.get('phoneNumber'))
 
  else
	TriggerClientEvent('esx_phone:endCall', _source, 'Kontakt jest Offline')
  end


end)

RegisterServerEvent('esx_phone:acceptCall')
AddEventHandler('esx_phone:acceptCall', function(target, channel)

  local _source = source

  print('ROZMOWA ZAAKCEPTOWANA => ' .. channel)

  TriggerClientEvent('esx_phone:onAcceptCall', target, channel, _source)
  
end)

RegisterServerEvent('esx_phone:endCall')
AddEventHandler('esx_phone:endCall', function(channel, target)
  EndCall(source, channel, target)
end)

AddEventHandler('esx_phone:getDistpatchRequestId', function(cb)
  cb(GetDistpatchRequestId())
end)

AddEventHandler('onResourceStart', function(ressource)
  if ressource == 'esx_phone3' then
	TriggerEvent('esx_phone:ready')
  end
end)

AddEventHandler('esx:playerLoaded', function(source)

  local xPlayer = ESX.GetPlayerFromId(source)

  for num,v in pairs(PhoneNumbers) do
	if tonumber(num) == num then -- If phonenumber is a player phone number
	  for src,_ in pairs(v.sources) do
		TriggerClientEvent('esx_phone:setPhoneNumberSource', source, num, tonumber(src))
	  end
	end
  end

  MySQL.Async.fetchAll(
	'SELECT * FROM users WHERE identifier = @identifier',
	{
	  ['@identifier'] = xPlayer.identifier
	},
	function(result)

	  local phoneNumber = result[1].phone_number

	  if phoneNumber == nil then

		phoneNumber = GenerateUniquePhoneNumber()

		MySQL.Async.execute(
		  'UPDATE users SET phone_number = @phone_number WHERE identifier = @identifier',
		  {
			['@identifier']   = xPlayer.identifier,
			['@phone_number'] = phoneNumber
		  }
		)
	  end

	  TriggerClientEvent('esx_phone:setPhoneNumberSource', -1, phoneNumber, source)

	  PhoneNumbers[phoneNumber] = {
		type          = 'player',
		hashDispatch  = false,
		sharePos      = false,
		hideNumber    = false,
		hidePosIfAnon = false,
		sources       = {[source] = true}
	  }

	  xPlayer.set('phoneNumber', phoneNumber)

	  if PhoneNumbers[xPlayer.job.name] ~= nil then
		TriggerEvent('esx_phone:addSource', xPlayer.job.name, source)
	  end

	  local contacts = {}

	  MySQL.Async.fetchAll(
		'SELECT * FROM user_contacts WHERE identifier = @identifier ORDER BY name ASC',
		{
		  ['@identifier'] = xPlayer.identifier
		},
		function(result2)

		  for i=1, #result2, 1 do

			table.insert(contacts, {
			  name   = result2[i].name,
			  number = result2[i].number,
			})
		  end

		  xPlayer.set('contacts', contacts)

		  TriggerClientEvent('esx_phone:loaded', source, phoneNumber, contacts)

		end
	  )

	end
  )

end)

AddEventHandler('esx:playerDropped', function(source)

  local xPlayer = ESX.GetPlayerFromId(source)
  local onCall  = xPlayer.get('onCall')

  TriggerClientEvent('esx_phone:setPhoneNumberSource', -1, xPlayer.get('phoneNumber'), -1)

  PhoneNumbers[xPlayer.get('phoneNumber')] = nil

  if PhoneNumbers[xPlayer.job.name] ~= nil then
	TriggerEvent('esx_phone:removeSource', xPlayer.job.name, source)
  end

  if onCall ~= nil then
	EndCall(source, onCall.channel, onCall.target)
  end

end)

AddEventHandler('esx:setJob', function(source, job, lastJob)

  if PhoneNumbers[lastJob.name] ~= nil then
	TriggerEvent('esx_phone:removeSource', lastJob.name, source)
  end

  if PhoneNumbers[job.name] ~= nil then
	TriggerEvent('esx_phone:addSource', job.name, source)
  end

end)

RegisterServerEvent('esx_phone:reload')
AddEventHandler('esx_phone:reload', function(phoneNumber)

  local _source  = source
  local xPlayer  = ESX.GetPlayerFromId(_source)
  local contacts = xPlayer.get('contacts') or {}

  TriggerClientEvent('esx_phone:loaded', _source, phoneNumber, contacts)

end)

RegisterServerEvent('esx_phone:removePlayerContact')
AddEventHandler('esx_phone:removePlayerContact', function(phoneNumber)
	print('tar bort kontakt: ' .. phoneNumber)
	local xPlayer = ESX.GetPlayerFromId(source)

	local contacts = xPlayer.get('contacts') or {}

	for i=#contacts, 1, -1 do 
		if contacts[i].number == phoneNumber then
			table.remove(contacts, i)
		end
	end

	if xPlayer ~= nil then
		xPlayer.set('contacts', contacts)
		MySQL.Async.execute('DELETE FROM user_contacts WHERE identifier=@identifier AND number=@number', {['@identifier'] = xPlayer.identifier, ['@number'] = phoneNumber})

		sendNotification(source, 'Kontakt usuniety!', 'success', 2500)
	end
end)

RegisterServerEvent('esx_phone:send')
AddEventHandler('esx_phone:send', function(phoneNumber, message, anon, position, hideDispatch)

	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)
	local dispatchId = GetDistpatchRequestId()

	print('MESSAGE => ' .. xPlayer.name .. '@' .. phoneNumber .. ' : ' .. message)

	if PhoneNumbers[phoneNumber] ~= nil then
		for k,v in pairs(PhoneNumbers[phoneNumber].sources) do
			local numType          = PhoneNumbers[phoneNumber].type
			local numHasDispatch   = PhoneNumbers[phoneNumber].hasDispatch
			local numHide          = PhoneNumbers[phoneNumber].hideNumber
			local numHidePosIfAnon = PhoneNumbers[phoneNumber].hidePosIfAnon
			local numPosition      = (PhoneNumbers[phoneNumber].sharePos and position or false)
			local numSource        = tonumber(k)
			
			if numHidePosIfAnon and anon then
				--numPosition = false
			end

			if numHasDispatch and not hideDispatch then
				TriggerClientEvent('esx_phone:onMessage', numSource, xPlayer.get('phoneNumber'), message, numPosition, (numHide and true or anon), numType, dispatchId)
			else
				TriggerClientEvent('esx_phone:onMessage', numSource, xPlayer.get('phoneNumber'), message, numPosition, (numHide and true or anon), numType, false)
			end
		end
	end
end)

AddEventHandler('esx_phone:registerNumber', function(number, type, sharePos, hasDispatch, hideNumber, hidePosIfAnon)

  local hideNumber    = hideNumber    or false
  local hidePosIfAnon = hidePosIfAnon or false

  PhoneNumbers[number] = {
	type          = type,
	sharePos      = sharePos,
	hasDispatch   = (hasDispatch or false),
	hideNumber    = hideNumber,
	hidePosIfAnon = hidePosIfAnon,
	sources       = {}
  }

end)

AddEventHandler('esx_phone:addSource', function(number, source)
  PhoneNumbers[number].sources[tostring(source)] = true
end)

AddEventHandler('esx_phone:removeSource', function(number, source)
  PhoneNumbers[number].sources[tostring(source)] = nil
end)

RegisterServerEvent('esx_phone:addPlayerContact')
AddEventHandler('esx_phone:addPlayerContact', function(phoneNumber, contactName)

  local _source     = source
  local xPlayer     = ESX.GetPlayerFromId(_source)
  local foundNumber = false
  local foundPlayer = nil

  MySQL.Async.fetchAll(
	'SELECT phone_number FROM users WHERE phone_number = @number',
	{
	  ['@number'] = phoneNumber
	},
	function(result)

	  if result[1] ~= nil then
		foundNumber = true
	  end

	  if foundNumber then

		if phoneNumber == xPlayer.get('phoneNumber') then
		  TriggerClientEvent('esx:showNotification', _source, 'Nie mozesz dodac samego siebie')
		else

		  local hasAlreadyAdded = false
		  local contacts        = xPlayer.get('contacts')

		  for i=1, #contacts, 1 do
			if contacts[i].number == phoneNumber then
			  hasAlreadyAdded = true
			end
		  end

		  if hasAlreadyAdded then
			TriggerClientEvent('esx:showNotification', _source, 'Ten kontakt jest juz na liscie kontaktow')
		  else

			table.insert(contacts, {
			  name   = contactName,
			  number = phoneNumber,
			})

			xPlayer.set('contacts', contacts)

			MySQL.Async.execute(
			  'INSERT INTO user_contacts (identifier, name, number) VALUES (@identifier, @name, @number)',
			  {
				['@identifier'] = xPlayer.identifier,
				['@name']       = contactName,
				['@number']     = phoneNumber
			  },
			  function(rowsChanged)

				TriggerClientEvent('esx:showNotification', _source, 'Kontakt Dodany')

				TriggerClientEvent('esx_phone:addContact', _source, contactName, phoneNumber)
			  end
			)

		  end
		end

	  else
		TriggerClientEvent('esx:showNotification', source, 'Ten numer nie istnieje')
	  end

	end
  )

end)

RegisterServerEvent('esx_phone:stopDispatch')
AddEventHandler('esx_phone:stopDispatch', function(dispatchRequestId, policeDispatch)
  TriggerClientEvent('esx_phone:stopDispatch', -1, dispatchRequestId, GetPlayerName(source), policeDispatch)
end)

RegisterServerEvent('esx_phone:billCall')
AddEventHandler('esx_phone:billCall', function(duration)

  local _source = source
  local xPlayer = ESX.GetPlayerFromId(_source)
  local amount  = math.floor(duration * 0.10)

  xPlayer.removeAccountMoney('bank', amount)

  TriggerClientEvent('esx:showNotification', _source, 'Koszt polaczenia wynosi ~r~' .. amount .. '~s~')

end)

RegisterServerEvent('esx_phone:bankTransfer')
AddEventHandler('esx_phone:bankTransfer', function(target, amount)

  local _source       = source
  local xPlayer       = ESX.GetPlayerFromId(_source)
  local targetXPlayer = ESX.GetPlayerFromId(target)

  if amount > 0 and amount <= xPlayer.getAccount('bank').money then
   
	xPlayer      .removeAccountMoney('bank', amount)
	targetXPlayer.addAccountMoney   ('bank', amount)

	TriggerClientEvent('esx:showNotification', _source, 'Przelales ~g~' .. amount .. '~s~ do ' .. targetXPlayer.name)

  else
	TriggerClientEvent('esx:showNotification', _source, 'Nieprawidlowa kwota')
  end

end)

-- CALLBACKS

ESX.RegisterServerCallback('esx_phone:getPhoneStatus', function(source, cb)
	local xPlayer = ESX.GetPlayerFromId(source)
	local hasPhone = false

	if xPlayer ~= nil then
		if xPlayer.getInventoryItem('blackberry').count >= 1 then
			hasPhone = true
		end
	end

	cb(hasPhone)
end)

ESX.RegisterServerCallback('esx_phone:getIdentity', function(source, cb)
	local identity = getIdentity(source)

	cb(identity)
end)

ESX.RegisterServerCallback('esx_remotecontrol:getIdentity', function(source, cb)
        local xPlayers = ESX.GetPlayers()
        identities = {}
        
        for i=1, #xPlayers, 1 do
            local xPlayer = ESX.GetPlayerFromId(xPlayers[i])
            local identifier = ESX.GetPlayerFromId(xPlayers[i]).identifier
            print(identifier)
			MySQL.Async.fetchAll("SELECT firstname, lastname, job FROM `users` WHERE `identifier` = @identifier",
			{
			    ['@identifier'] = identifier
			},
			function(result)
			    if result[1].firstname ~= nil then
			        table.insert(identities, { firstname = result[1].firstname, lastname = result[1].lastname, job = result[1].job})
			    end
			end)
        end
    cb(identities)
end)

function sendNotification(xSource, message, messageType, messageTimeout)
	TriggerClientEvent("pNotify:SendNotification", xSource, {
		text = message,
		type = messageType,
		queue = "qalle",
		timeout = messageTimeout,
		layout = "bottomCenter"
	})
end


function getIdentity(source)
	local identifier = GetPlayerIdentifiers(source)[1]
	local result = MySQL.Sync.fetchAll("SELECT * FROM users WHERE identifier = @identifier", {['@identifier'] = identifier})
	if result[1] ~= nil then
		local identity = result[1]
		return {
			job = identity['job'],
			firstname = identity['firstname'],
			lastname = identity['lastname']
		}
	else
		return nil
	end
end