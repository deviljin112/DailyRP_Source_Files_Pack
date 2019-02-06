local TeleportFromTo = {
	["offshore-production"] = {
		positionFrom = { ['x'] = 397.1191, ['y'] = -1004.7134, ['z'] = -99.0040},
		positionTo = { ['x'] = 465.3196, ['y'] = -990.0330, ['z'] = 24.9148},
		positioninterrogatoire = { ['x'] = 405.8396, ['y'] = -1002.6697, ['z'] = -99.0040},
		positioninterrogatoire2 = { ['x'] = 415.1226, ['y'] =  -998.8822, ['z'] = -99.4041},
		positioninterrogatoire3 = { ['x'] = 415.8344, ['y'] = -998.0855, ['z'] = -99.4041},
		positioninterrogatoire4 = { ['x'] = 405.7509, ['y'] = -1000.4263, ['z'] = -99.0040},
		positionaccuse = { ['x'] = 405.8003, ['y'] = -992.4561, ['z'] = -99.0040},
		positionaccuseout = { ['x'] = 409.5350, ['y'] = -1000.8669, ['z'] = -99.0040},
		positionaccuseout2 = { ['x'] = 405.7934, ['y'] = -995.5761, ['z'] = -99.0040},
		positionenter = { ['x'] = 401.0436, ['y'] = -1004.2553, ['z'] = -99.0040},
	},
}

Drawing = setmetatable({}, Drawing)
Drawing.__index = Drawing


function Drawing.draw3DText(x,y,z,textInput,fontId,scaleX,scaleY,r, g, b, a)
    local px,py,pz=table.unpack(GetGameplayCamCoords())
    local dist = GetDistanceBetweenCoords(px,py,pz, x,y,z, 1)

    local scale = (1/dist)*20
    local fov = (1/GetGameplayCamFov())*100
    local scale = scale*fov

    SetTextScale(scaleX*scale, scaleY*scale)
    SetTextFont(fontId)
    SetTextProportional(1)
    SetTextColour(r, g, b, a)
    SetTextDropshadow(0, 0, 0, 0, 255)
    SetTextEdge(2, 0, 0, 0, 150)
    SetTextDropShadow()
    SetTextOutline()
    SetTextEntry("STRING")
    SetTextCentre(1)
    AddTextComponentString(textInput)
    SetDrawOrigin(x,y,z+2, 0)
    DrawText(0.0, 0.0)
    ClearDrawOrigin()
end

function Drawing.drawMissionText(m_text, showtime)
    ClearPrints()
    SetTextEntry_2("STRING")
    AddTextComponentString(m_text)
    DrawSubtitleTimed(showtime, 1)
end

function msginf(msg, duree)
    duree = duree or 500
    ClearPrints()
    SetTextEntry_2("STRING")
    AddTextComponentString(msg)
    DrawSubtitleTimed(duree, 1)
end

Citizen.CreateThread(function()
	while true do
		Citizen.Wait(2)
		local pos = GetEntityCoords(GetPlayerPed(-1), true)
		
		for k, j in pairs(TeleportFromTo) do
		
			--msginf(k .. " " .. tostring(j.positionFrom.x), 15000)
			if(Vdist(pos.x, pos.y, pos.z, j.positionFrom.x, j.positionFrom.y, j.positionFrom.z) < 150.0)then
				if(Vdist(pos.x, pos.y, pos.z, j.positionFrom.x, j.positionFrom.y, j.positionFrom.z) < 1.5)then
					if IsPedInAnyVehicle(GetPlayerPed(-1), false) and (GetPedInVehicleSeat(GetVehiclePedIsIn(GetPlayerPed(-1), false), -1) == GetPlayerPed(-1)) then
					  	 entity = GetVehiclePedIsIn(GetPlayerPed(-1), false)
							else
 							entity = GetPlayerPed(-1)
						end
					if(Vdist(pos.x, pos.y, pos.z, j.positionFrom.x, j.positionFrom.y, j.positionFrom.z) < 2.0)then
						ClearPrints()
							DoScreenFadeOut(1000)
							Citizen.Wait(2000)
							SetEntityCoords(GetPlayerPed(-1), j.positionTo.x, j.positionTo.y, j.positionTo.z - 1)
							DoScreenFadeIn(1000)
					end
				end
			end
			
			if(Vdist(pos.x, pos.y, pos.z, j.positionTo.x, j.positionTo.y, j.positionTo.z) < 150.0)then
				if(Vdist(pos.x, pos.y, pos.z, j.positionTo.x, j.positionTo.y, j.positionTo.z) < 1.5)then
					if IsPedInAnyVehicle(GetPlayerPed(-1), false) and (GetPedInVehicleSeat(GetVehiclePedIsIn(GetPlayerPed(-1), false), -1) == GetPlayerPed(-1)) then
 						 entity = GetVehiclePedIsIn(GetPlayerPed(-1), false)
						 	else
 						 	entity = GetPlayerPed(-1)
						end
					if(Vdist(pos.x, pos.y, pos.z, j.positionTo.x, j.positionTo.y, j.positionTo.z) < 0.5)then
						ClearPrints()
						SetTextEntry_2("STRING")
						AddTextComponentString("Appuyez sur la touche ~r~E~w~ pour aller dans la salle d'interrogatoire")
						DrawSubtitleTimed(0, 1)
						if IsControlJustPressed(1, 38) then
							DoScreenFadeOut(1000)
							Citizen.Wait(2000)
							SetEntityCoords(GetPlayerPed(-1), j.positionenter.x, j.positionenter.y, j.positionenter.z - 1)
							DoScreenFadeIn(1000)
						end
					end
				end
			end

			if(Vdist(pos.x, pos.y, pos.z, j.positioninterrogatoire.x, j.positioninterrogatoire.y, j.positioninterrogatoire.z) < 150.0)then
				if(Vdist(pos.x, pos.y, pos.z, j.positioninterrogatoire.x, j.positioninterrogatoire.y, j.positioninterrogatoire.z) < 1.5)then
					if IsPedInAnyVehicle(GetPlayerPed(-1), false) and (GetPedInVehicleSeat(GetVehiclePedIsIn(GetPlayerPed(-1), false), -1) == GetPlayerPed(-1)) then
 						 entity = GetVehiclePedIsIn(GetPlayerPed(-1), false)
						 	else
 						 	entity = GetPlayerPed(-1)
						end
					if(Vdist(pos.x, pos.y, pos.z, j.positioninterrogatoire.x, j.positioninterrogatoire.y, j.positioninterrogatoire.z) < 1.0)then
						ClearPrints()
					        DoScreenFadeOut(1000)
							Citizen.Wait(2000)
							SetEntityCoords(GetPlayerPed(-1), j.positioninterrogatoire2.x, j.positioninterrogatoire2.y, j.positioninterrogatoire2.z - 1)
							DoScreenFadeIn(1000)
					end
				end
			end

			if(Vdist(pos.x, pos.y, pos.z, j.positionaccuse.x, j.positionaccuse.y, j.positionaccuse.z) < 150.0)then
				if(Vdist(pos.x, pos.y, pos.z, j.positionaccuse.x, j.positionaccuse.y, j.positionaccuse.z) < 1.5)then
					if(Vdist(pos.x, pos.y, pos.z, j.positionaccuse.x, j.positionaccuse.y, j.positionaccuse.z) < 2.0)then
							DoScreenFadeOut(1000)
							Citizen.Wait(2000)
							SetEntityCoords(GetPlayerPed(-1), j.positionaccuseout.x, j.positionaccuseout.y, j.positionaccuseout.z - 1)
							DoScreenFadeIn(1000)
					end
				end
			end

			if(Vdist(pos.x, pos.y, pos.z, j.positionaccuseout.x, j.positionaccuseout.y, j.positionaccuseout.z) < 150.0)then
				if(Vdist(pos.x, pos.y, pos.z, j.positionaccuseout.x, j.positionaccuseout.y, j.positionaccuseout.z) < 1.5)then
					if IsPedInAnyVehicle(GetPlayerPed(-1), false) and (GetPedInVehicleSeat(GetVehiclePedIsIn(GetPlayerPed(-1), false), -1) == GetPlayerPed(-1)) then
					  	 entity = GetVehiclePedIsIn(GetPlayerPed(-1), false)
							else
 							entity = GetPlayerPed(-1)
						end
					if(Vdist(pos.x, pos.y, pos.z, j.positionaccuseout.x, j.positionaccuseout.y, j.positionaccuseout.z) < 0.5)then
						ClearPrints()
						SetTextEntry_2("STRING")
						AddTextComponentString("Appuyez sur la touche ~r~E~w~ pour retourner dans le couloir")
						DrawSubtitleTimed(0, 1)
						if IsControlJustPressed(1, 38) then
							DoScreenFadeOut(1000)
							Citizen.Wait(2000)
							SetEntityCoords(GetPlayerPed(-1), j.positionaccuseout2.x, j.positionaccuseout2.y, j.positionaccuseout2.z - 1)
							DoScreenFadeIn(1000)
						end
					end
				end
			end

			if(Vdist(pos.x, pos.y, pos.z, j.positioninterrogatoire3.x, j.positioninterrogatoire3.y, j.positioninterrogatoire3.z) < 150.0)then
				if(Vdist(pos.x, pos.y, pos.z, j.positioninterrogatoire3.x, j.positioninterrogatoire3.y, j.positioninterrogatoire3.z) < 1.5)then
					if IsPedInAnyVehicle(GetPlayerPed(-1), false) and (GetPedInVehicleSeat(GetVehiclePedIsIn(GetPlayerPed(-1), false), -1) == GetPlayerPed(-1)) then
					  	 entity = GetVehiclePedIsIn(GetPlayerPed(-1), false)
							else
 							entity = GetPlayerPed(-1)
						end
					if(Vdist(pos.x, pos.y, pos.z, j.positioninterrogatoire3.x, j.positioninterrogatoire3.y, j.positioninterrogatoire3.z) < 0.3)then
						ClearPrints()
						SetTextEntry_2("STRING")
						AddTextComponentString("Appuyez sur la touche ~r~E~w~ pour retourner dans le couloir")
						DrawSubtitleTimed(0, 1)
						if IsControlJustPressed(1, 38) then
							DoScreenFadeOut(1000)
							Citizen.Wait(2000)
							SetEntityCoords(GetPlayerPed(-1), j.positioninterrogatoire4.x, j.positioninterrogatoire4.y, j.positioninterrogatoire4.z - 1)
							DoScreenFadeIn(1000)
						end
					end
				end
			end
		end
	end
end)