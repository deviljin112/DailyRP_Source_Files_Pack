--###############################
--#								#
--# 	C 	O 	N 	F 	I 	G 	#
--#								#
--###############################
local SETTINGS = {
	rgba = {255,255,255, 185},
	pos = {
		x 	= 1.8,	--left/right
		y 	= 0.5,	--forward/backward
		z 	= 0.5	--up/down
	},
	speed_unit = "mph" -- or mph
}

local blacklist_class = {
	--10,--Industrioal
	--11,--Utility
	--12,--Vans
	14,--Boats
	--15,--Helicopter
	16,--Planes
	--20,--Commercial
	21,--Trains
}







--#######################
--#						#
--# 	C 	O 	D 	E 	#
--#						#
--#######################
local list = {} for i = 1, 0xA do list[i] = i + 9 end
local rot = {
	invert = 1,
	current = nil,
	[("%c%c%c%c%c"):format(0x72,0x69,0x67,0x68,0x74)] = 0x23,
	[("%c%c%c%c"):format(0x6C,0x65,0x66,0x74)] = -0x23, 
}

Citizen.CreateThread(function ()

	FixRot()

	while true do Citizen.Wait(0)
		local pPed = GetPlayerPed(-1)
		--NetworkOverrideClockTime(18, 0, 0) ----------------------------------------------------------------DELETE ME
		if IsPedInAnyVehicle(pPed, true) then
			local pVeh = GetVehiclePedIsUsing(pPed)
			local vPos = GetOffsetFromEntityInWorldCoords(pVeh, -0.3 + SETTINGS.pos.x, 
				0.2 * rot.invert + SETTINGS.pos.y, -0.25 + SETTINGS.pos.z)
			local vSpeed = GetEntitySpeed(pVeh)
			
			if SETTINGS.speed_unit == "kph" then
				vSpeed = vSpeed * 3.6
			else
				vSpeed = vSpeed * 2.23693629
			end

			if ClassCheck(pVeh) then
				if vSpeed > -1 and vSpeed < 10 then
					local a = math.floor(vSpeed)
	
					DrawMark(list[a+1], vPos.x, vPos.y, vPos.z, GetEntityHeading(pVeh) - (rot[rot.current] or 0), SETTINGS.face_camera)
				elseif vSpeed > 9 and vSpeed < 100 then
					local a = math.floor(vSpeed / 10)
					local b = math.floor(vSpeed % 10)
	
					vPos2 = GetOffsetFromEntityInWorldCoords(pVeh, 0.0 + SETTINGS.pos.x, 
						0.0 * rot.invert + SETTINGS.pos.y, -0.25 + SETTINGS.pos.z)
	
					DrawMark(list[a+1], vPos.x, vPos.y, vPos.z, GetEntityHeading(pVeh) - (rot[rot.current] or 0))
					DrawMark(list[b+1], vPos2.x, vPos2.y, vPos2.z, GetEntityHeading(pVeh) - (rot[rot.current] or 0))
				elseif vSpeed > 99 and vSpeed < 1000 --[[bestcheck2018]] then
					local a = math.floor(vSpeed / 100)
					local b = math.floor(vSpeed / 10 % 10)
					local c = math.floor(vSpeed % 10)
	
					vPos2 = GetOffsetFromEntityInWorldCoords(pVeh, 0.0 + SETTINGS.pos.x, 
						0.0 * rot.invert + SETTINGS.pos.y, -0.25 + SETTINGS.pos.z)
					vPos3 = GetOffsetFromEntityInWorldCoords(pVeh, 0.3 + SETTINGS.pos.x, 
						-0.2 * rot.invert + SETTINGS.pos.y, -0.25 + SETTINGS.pos.z)
	
					DrawMark(list[a+1], vPos.x, vPos.y, vPos.z, GetEntityHeading(pVeh) - (rot[rot.current] or 0))
					DrawMark(list[b+1], vPos2.x, vPos2.y, vPos2.z, GetEntityHeading(pVeh) - (rot[rot.current] or 0))
					DrawMark(list[c+1], vPos3.x, vPos3.y, vPos3.z, GetEntityHeading(pVeh) - (rot[rot.current] or 0))
				end
			end


		end--[[if-in-veh]]
	end
end)

function DrawMark(id, x,y,z, rot)
	r,g,b,alpha = table.unpack(SETTINGS.rgba)
	DrawMarker(id, x,y,z, 0, 0, 0, 0.0, 0.0, rot, 0.5, 0.5, 0.5, r, g, b, alpha, false, false, 0, false, 0, 0, false)
end

function ClassCheck(veh)
	for i = 1, #blacklist_class do
		if GetVehicleClass(veh) == blacklist_class[i] then
			return false
		end
	end
	return true
end

function FixRot()
	if SETTINGS.pos.x > 0 then 
		rot.current = 'right'
		rot.invert = 1
	elseif SETTINGS.pos.x < 0 then 
		rot.current = 'left'
		rot.invert = -1
	else 
		rot.invert = 0
		rot.current = nil 
	end
end