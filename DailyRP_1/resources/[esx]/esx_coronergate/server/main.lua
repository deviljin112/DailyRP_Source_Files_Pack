ESX = nil


TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

--------Prendre un esx_coronergate--------

RegisterServerEvent('esx_coronergate:disp')
AddEventHandler('esx_coronergate:disp', function()

	local xPlayer  = ESX.GetPlayerFromId(source)
	local xPlayers = ESX.GetPlayers()
	
	for i=1, #xPlayers, 1 do
	 local xPlayer = ESX.GetPlayerFromId(xPlayers[i])
		if xPlayer.job.name == 'ambulance' then
			
		end
	end
			
	xPlayer.addInventoryItem('journal', 1)
	
end)


-------Utiliser Le esx_coronergate------

-- ESX.RegisterUsableItem('esx_coronergate', function(source)
	-- TriggerClientEvent('esx_coronergate:esx_coronergate', source)
	
		-- local xPlayer  = ESX.GetPlayerFromId(source)

	-- xPlayer.removeInventoryItem('esx_coronergate', 1)
-- end)

-------------------------------------------------------------------- Hack les esx_coronergate-----------------------
ESX.RegisterUsableItem('journal', function(source)
  local _source = source
  local xPlayer = ESX.GetPlayerFromId(source)
  local qtehack = xPlayer.getInventoryItem('craking').count
  
  if qtehack > 0 then
      TriggerClientEvent('esx_coronergate:trycrack',_source)
  else
     TriggerClientEvent('esx:showNotification',_source, "Nie posiadasz ~r~modulu hakerskiego")
  end
end)

RegisterServerEvent('esx_coronergate:fail_esx_coronergate')
AddEventHandler('esx_coronergate:fail_esx_coronergate', function()
  local _source = source
  local xPlayer = ESX.GetPlayerFromId(source)
  if xPlayer.getInventoryItem('journal').count >= 1 then
    xPlayer.removeInventoryItem('journal', 1)
    TriggerClientEvent('esx:showNotification', _source, "Dokumenty sa zniszczone")
  end
end)

RegisterServerEvent('esx_coronergate:ouvrir_journal')
AddEventHandler('esx_coronergate:ouvrir_journal', function()
  local _source = source
  local xPlayer = ESX.GetPlayerFromId(source)
  if xPlayer.getInventoryItem('journal').count >= 1 then
	TriggerClientEvent('esx_coronergate:journal', source)
    TriggerClientEvent('esx:showNotification', _source, "Przeszukujesz Dokumenty")
    Wait(5000)
    xPlayer.removeInventoryItem('journal', 1)
	  TriggerClientEvent('esx:showNotification', _source, "Dokumenty przeszukane")
  else
    TriggerClientEvent('esx:showNotification', _source, "Musisz przeszukac archiwum")
  end
end)

RegisterServerEvent('atleastone')
AddEventHandler('atleastone', function()

  local xPlayers = ESX.GetPlayers()
  local bool = false 
  local source = source

  
  
   for i=1, #xPlayers, 1 do
    local xPlayer = ESX.GetPlayerFromId(xPlayers[i])
    if xPlayer.job.name == 'ambulance' then
     bool = true
	 --TriggerClientEvent('esx:showNotification', xPlayers[i], 'Alerte: Intrusion salle Archive')
	 TriggerClientEvent("esx_coronergate:showNotification", source, "~r~Wtargniecie do archiwum!")
    end
   end

   TriggerClientEvent('fouille', source, bool)

end)
