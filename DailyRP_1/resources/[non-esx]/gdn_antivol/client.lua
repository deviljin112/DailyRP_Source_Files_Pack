-- Script édité le 08.06.2017 par [GDN]Ashgal
-- Script modifié avec facteur random le 12.06.2017 par [GDN]Ashgal

Citizen.CreateThread(function() 
    while true do   

        Citizen.Wait(0)  

            if DoesEntityExist(GetVehiclePedIsTryingToEnter(PlayerPedId())) then
            local veh = GetVehiclePedIsTryingToEnter(PlayerPedId())
            local lock = GetVehicleDoorLockStatus(veh)
            local x = math.random(1,25) -- Taux de réussite des vols et carjack (Exemple : (1,2) = 50% / (1,5) = 20%) // (2,2) = disable 
                
                if lock == 7 then --Lock 7 = lock mais fracturable
                    if x ~= 1 then -- On recupère le random s'il différent de 1
                    SetVehicleDoorsLocked(veh, 2) -- On lock en 2, impossible à fracturé
                    StartVehicleAlarm(veh) -- déclanche l'alarme si active sur le véhicule
                    else
                    SetVehicleDoorsLocked(veh, 0) -- Si le randome est 1, on lock à 0, soit ouvert
                    StartVehicleAlarm(veh) -- déclanche l'alarme si active sur le véhicule
                    end
                end     
            local ped = GetPedInVehicleSeat(veh, -1)

                if ped then
                    if x ~= 1 then -- On recupère le random s'il différent de 1
                    SetPedCanBeDraggedOut(ped, false) --on empeche le pedd d'etre sorti
                    Citizen.Wait(2000)
                    SetPedCanBeDraggedOut(ped, true)  --on autorise le pedd d'etre sorti, sinon, le player ne sera plus sortable non plus
                    else
                    Citizen.Wait(3000)
	
                    end
                end
            end   
    end
end)

