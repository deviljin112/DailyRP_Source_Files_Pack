
local speedBuffer  = {}
local velBuffer    = {}
local beltOn       = false
local wasInCar     = false

IsCar = function(veh)
		    local vc = GetVehicleClass(veh)
		    return (vc >= 0 and vc <= 7) or (vc >= 9 and vc <= 12) or (vc >= 17 and vc <= 20)
        end	

Fwv = function (entity)
		    local hr = GetEntityHeading(entity) + 90.0
		    if hr < 0.0 then hr = 360.0 + hr end
		    hr = hr * 0.0174533
		    return { x = math.cos(hr) * 2.0, y = math.sin(hr) * 2.0 }
      end

Citizen.CreateThread(function()
	Citizen.Wait(500)
	while true do

		local ped = GetPlayerPed(-1)
		local car = GetVehiclePedIsIn(ped)
		
		if car ~= 0 and (wasInCar or IsCar(car)) then
			
			wasInCar = true
			
			if beltOn then 
				DisableControlAction(0, 75)
			end

			--if not beltOn then
			--	beltstatus = "off"
			--	TriggerServerEvent('esx_customui:updateBelt2', beltstatus)					-- WYSWIETLA PASY NA CZERWONO (ODPIETE)
			--end
			
			speedBuffer[2] = speedBuffer[1]
			speedBuffer[1] = GetEntitySpeed(car)
			
			if speedBuffer[2] ~= nil 
			   and not beltOn
			   and GetEntitySpeedVector(car, true).y > 1.0  
			   and speedBuffer[1] > Cfg.MinSpeed 
			   and (speedBuffer[2] - speedBuffer[1]) > (speedBuffer[1] * Cfg.DiffTrigger) then
			   
				local co = GetEntityCoords(ped)
				local fw = Fwv(ped)
				SetEntityCoords(ped, co.x + fw.x, co.y + fw.y, co.z - 0.47, true, true, true)
				SetEntityVelocity(ped, velBuffer[2].x, velBuffer[2].y, velBuffer[2].z)
				Citizen.Wait(1)
				SetPedToRagdoll(ped, 1000, 1000, 0, 0, 0, 0)
			end
				
			velBuffer[2] = velBuffer[1]
			velBuffer[1] = GetEntityVelocity(car)
				
			if IsControlJustReleased(0, 20) then
				
				local playerPed = GetPlayerPed(-1)
				local vehicle = GetVehiclePedIsIn(playerPed, false)

				beltOn = not beltOn				  
				if beltOn then 
					-- TUTAJ WPIUSUJESZ ODNOSNIKI DO INNYCH SKRYPTOW (zapiete)
							Wait(0)
							beltstatus = "on"
							exports['esx_customui']:UpdateBeltStatus(beltstatus)		-- WYWOLUJE ZMIANE NA BIALO

				else
					-- TUTAJ WPIUSUJESZ ODNOSNIKI DO INNYCH SKRYPTOW (odpiete)
							Wait(0)
							beltstatus = "off"
							exports['esx_customui']:UpdateBeltStatus(beltstatus)		-- WYWOLUJE ZMIANE NA CZERWONO

				end 
			end
			
		elseif wasInCar then
			wasInCar = false
			beltOn = false
			beltstatus = "disable"
			exports['esx_customui']:UpdateBeltStatus(beltstatus)
			speedBuffer[1], speedBuffer[2] = 0.0, 0.0
		end
		Citizen.Wait(0)
	end
end)

-- FUNKCJA RYSOWANIA NA EKRANIE (nie ruszac chyba ze zmieniles odnosniki powyzej)
--[[
Citizen.CreateThread(function()
	while true do
		Wait(0)
		function Pasy(r,g,b)
			SetTextFont(0)
			SetTextProportional(1)
			SetTextScale(0.0, 0.50)
			SetTextColour(r, g, b, 255)
			SetTextDropshadow(1, 0, 0, 0, 255)
			SetTextEdge(1, 0, 0, 0, 255)
			SetTextDropShadow()
			SetTextOutline()
			SetTextEntry("STRING")
			AddTextComponentString("Pasy")
			DrawText(0.31, 0.945)
		end
	end
end)
]]--