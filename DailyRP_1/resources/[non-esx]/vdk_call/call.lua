local callActive = false
local haveTarget = false
local isCall = false
local work = {}
local target = {}

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(1)
        -- if IsControlJustPressed(1, 56) then
        --     local plyPos = GetEntityCoords(GetPlayerPed(-1), true)
        --     TriggerServerEvent("call:makeCall", "uber", {x=plyPos.x,y=plyPos.y,z=plyPos.z})
        -- end

        -- Press Y key to get the call
        if IsControlJustPressed(1, 246) and callActive then
			if isCall == false then
				TriggerServerEvent("call:getCall", work)
				SendNotification("~b~Odebrales rozmowe !")
				target.blip = AddBlipForCoord(target.pos.x, target.pos.y, target.pos.z)
				SetBlipRoute(target.blip, true)
				haveTarget = true
				isCall = true
				callActive = false
			else
				SendNotification("~r~Masz juz polaczenie w toku !")
			end
        -- Press L key to decline the call
        elseif IsControlJustPressed(1, 249) and callActive then
            SendNotification("~r~Odrzuciles rozmowe !")
            callActive = false
        end
        if haveTarget then
            DrawMarker(1, target.pos.x, target.pos.y, target.pos.z-1, 0, 0, 0, 0, 0, 0, 2.001, 2.0001, 0.5001, 255, 255, 0, 200, 0, 0, 0, 0)
            local playerPos = GetEntityCoords(GetPlayerPed(-1), true)
            if Vdist(target.pos.x, target.pos.y, target.pos.z, playerPos.x, playerPos.y, playerPos.z) < 2.0 then
                RemoveBlip(target.blip)
                haveTarget = false
				isCall = false
            end
        end
    end
end)

RegisterNetEvent("call:cancelCall")
AddEventHandler("call:cancelCall", function()
	if haveTarget then
		RemoveBlip(target.blip)
        haveTarget = false
		isCall = false
	else
		TriggerEvent("itinerance:notif", "~r~Nie masz polaczenia w toku !")
	end
end)

RegisterNetEvent("call:callIncoming")
AddEventHandler("call:callIncoming", function(job, pos, msg)
    callActive = true
    work = job
    target.pos = pos
	SendNotification("Nacisnij ~b~Y~s~ aby odebrac lub ~r~N~s~ aby odrzucic")
	if work == "police" then
		SendNotification("~b~ROZMOWA W TOKU:~w~ " ..tostring(msg))
		--SendNotification("Appuyez sur ~g~Y~s~ pour prendre l'appel ou ~g~L~s~ pour le refuser")
	elseif work == "mecano" then
		SendNotification("~o~ROZMOWA W TOKU:~w~ " ..tostring(msg))
	elseif work == "taxi" then
		SendNotification("~y~ROZMOWA W TOKU:~w~ " ..tostring(msg))
		--SendNotification("Appuyez sur ~g~Y~s~ pour prendre l'appel ou ~g~L~s~ pour le refuser")
	elseif work == "ambulance" then
		SendNotification("~r~ROZMOWA W TOKU:~w~ " ..tostring(msg))
	elseif work == "fib" then
		SendNotification("~r~ROZMOWA W TOKU:~w~ " ..tostring(msg))
	elseif work == "pilot" then
		SendNotification("~r~ROZMOWA W TOKU:~w~ " ..tostring(msg))
	elseif work == "epicerie" then
		SendNotification("~r~ROZMOWA W TOKU:~w~ " ..tostring(msg))
	elseif work == "brinks" then
		SendNotification("~r~ROZMOWA W TOKU:~w~ " ..tostring(msg))
	elseif work == "army" then
		SendNotification("~r~ROZMOWA W TOKU:~w~ " ..tostring(msg))
	elseif work == "realestateagent" then
		SendNotification("~r~ROZMOWA W TOKU:~w~ " ..tostring(msg))
	elseif work == "unicorn" then
		SendNotification("~r~ROZMOWA W TOKU:~w~ " ..tostring(msg))
	elseif work == "journaliste" then
		SendNotification("~r~ROZMOWA W TOKU:~w~ " ..tostring(msg))
	elseif work == "state" then
		SendNotification("~r~ROZMOWA W TOKU:~w~ " ..tostring(msg))
	end
end)

RegisterNetEvent("call:taken")
AddEventHandler("call:taken", function()
    callActive = false
    SendNotification("Polaczenie zostalo wykonane")
end)

RegisterNetEvent("target:call:taken")
AddEventHandler("target:call:taken", function(taken)
    if taken == 1 then
        SendNotification("~b~Rozmowa przychodzaca !")
    elseif taken == 0 then
        SendNotification("~r~Polaczenie niemozliwe !")
    elseif taken == 2 then
        SendNotification("~o~Sprobuj ponownie za chwile.")
    end
end)

-- If player disconnect, remove him from the inService server table
AddEventHandler('playerDropped', function()
	TriggerServerEvent("player:serviceOff", nil)
end)

function SendNotification(message)
    SetNotificationTextEntry('STRING')
    AddTextComponentString(message)
    DrawNotification(false, false)
end
