ESX = nil
local CurrentActionData   = {}
local lastTime            = 0
local inprog = false
local HasAlreadyEnteredMarker = false
local LastZone                = nil



Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		Citizen.Wait(0)
	end
end)

--------------------------------  OPEN disp  --------------------------------
archiveaction = {
	{237.58204650879,  -1358.3923339844,  38.534332275391},
}


RegisterNetEvent('fouille')
AddEventHandler('fouille', function(test)

 if(test)then
	 	Citizen.CreateThread(function()
	 	local playerPed = GetPlayerPed(-1)
	 	TaskStartScenarioInPlace(playerPed, "PROP_HUMAN_BUM_BIN", 0, true)
	 	
	 	Citizen.Wait(90000)
	 	TriggerServerEvent('esx_coronergate:disp')
	 	ClearPedTasksImmediately(playerPed)
	 	end)
	 else 
	 	TriggerEvent('esx:showNotification', 'Brak dostepu bez lekarza w miescie!')	
	   end

end)


function OpenDisp()

  local playerPed = GetPlayerPed(-1)

  TriggerServerEvent('atleastone')
    
	
  

end

AddEventHandler('esx_coronergate:newsdispEnteredEntityZone', function(entity)
  
    local playerPed = GetPlayerPed(-1)
	       
	  CurrentAction     = 'open_disp'
      CurrentActionMsg  = 'Nacisnij ~INPUT_TALK~ aby przeszukac archiwa'
      
  end)

AddEventHandler('esx_coronergate:newsdisphasExitedEntityZone', function(entity)
  
   -- if CurrentAction == 'open_disp' then
      CurrentAction = nil
  --  end
  
end)


Citizen.CreateThread(function()
	while true do

		Citizen.Wait(0)
	
		local coords    = GetEntityCoords(playerPed)
		local playerPed = GetPlayerPed(-1)
		
		local isInMarker  = false
		local currentZone = nil
		
		for i = 1, #archiveaction do
				archiveCoords2 = archiveaction[i]
				DrawMarker(1, archiveCoords2[1], archiveCoords2[2], archiveCoords2[3], 1, 0, 0, 0, 0, 0, 0.5, 0.5, 2.0, 0, 0, 0, 155, 0, 0, 2, 0, 0, 0, 0)
				if GetDistanceBetweenCoords(GetEntityCoords(GetPlayerPed(-1)), archiveCoords2[1], archiveCoords2[2], archiveCoords2[3], true ) < 3 then
				TriggerEvent('esx_coronergate:newsdispEnteredEntityZone', entity)
				isInMarker  = true
				currentZone = k
				end

		end
		
		
		if (isInMarker and not HasAlreadyEnteredMarker) or (isInMarker and LastZone ~= currentZone) then			
				HasAlreadyEnteredMarker = true
				LastZone                = currentZone


		end

		if not isInMarker and HasAlreadyEnteredMarker then
				HasAlreadyEnteredMarker = false
				TriggerEvent('esx_coronergate:newsdisphasExitedEntityZone', entity)
		end
		end
	end)
	
--------------Hack les esx_coronergate pour lire---------------------
function lockcbv(success)
	if success then
		TriggerEvent('mhacking:hide')
    TriggerEvent('esx:showNotification', 'Odszyfrowywanie dokumentow udane!')
    TriggerServerEvent("esx_coronergate:ouvrir_journal")
    inprog = false
	else
		TriggerEvent('mhacking:hide')
    TriggerEvent('esx:showNotification', 'Odszyfrowyanie dokumentow sie nie powiodlo!')
    TriggerServerEvent('esx_coronergate:fail_journal')
    inprog = false
	end
end


RegisterNetEvent('esx_coronergate:trycrack')
AddEventHandler('esx_coronergate:trycrack', function()
	if inprog == false then
			inprog = true
	    TriggerEvent("mhacking:show")
	    TriggerEvent("mhacking:start",7,30,lockcbv)
	else
		 ESX.ShowNotification('Odszyfrowywanie dokumentow w toku!')
	end
end)


---------------------------------utiliser le esx_coronergate---------------------------------

RegisterNetEvent('esx_coronergate:journal')
AddEventHandler('esx_coronergate:journal', function()
  Citizen.CreateThread(function()
    local display = true
    local startTime = GetGameTimer()
    local delay = 180000 

    TriggerEvent('esx_coronergate:display', true)

    while display do
      Citizen.Wait(1)
      ShowInfo('~w~ Nacisnij ~INPUT_CONTEXT~ aby zamknac archiwum', 0)
      if (GetTimeDifference(GetGameTimer(), startTime) > delay) then
        display = false
        TriggerEvent('esx_coronergate:display', false)
      end
      if (IsControlJustPressed(1, 51)) then
        display = false
        TriggerEvent('esx_coronergate:display', false)
      end
    end
  end)
end)

RegisterNetEvent('esx_coronergate:display')
AddEventHandler('esx_coronergate:display', function(value)
  SendNUIMessage({
    type = "disclaimer",
    display = value
  })
end)

function ShowInfo(text, state)
  SetTextComponentFormat("STRING")
  AddTextComponentString(text)
  DisplayHelpTextFromStringLabel(0, state, 0, -1)
end


--------------- KEY CONTROLS -----------------

Citizen.CreateThread(function()
  while true do
      Citizen.Wait(0)

      if CurrentAction ~= nil then
         
        SetTextComponentFormat('STRING')
        AddTextComponentString(CurrentActionMsg)
        DisplayHelpTextFromStringLabel(0, 0, 1, -1)
        
      if IsControlJustReleased(0, 38) then             
        if CurrentAction == 'open_disp' then
          if GetGameTimer() - lastTime >= 15000 then 
            OpenDisp()
            lastTime = GetGameTimer()
          end
        end

          CurrentAction = nil               
      end
	  
    end
	
  end
  
end)
-------------------- Image notification
function Notification(message)
    SetNotificationTextEntry("STRING")
    AddTextComponentString(message)
    SetNotificationMessage("CHAR_LJT", "CHAR_LJT", true, 1, "~r~ALARM:~s~", "SZPITAL"); --- Here for changed your notification --- Here for changed your notification
    DrawNotification(false, true);
end

RegisterNetEvent('esx_coronergate:showNotification')
AddEventHandler('esx_coronergate:showNotification', function(notify)
    Notification(notify)
end)
