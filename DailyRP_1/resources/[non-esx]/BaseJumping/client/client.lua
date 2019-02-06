--Script Name: BaseJumping for the ESX Framework.
--Description: This is a very simple script that in a nutshell gives you a parachute in exchange for $50 (this is configureable in the server.lua at line 28 and 30).
--There are locations on the map (that are marked with blips) so you know where they all are.
--Simply go to these locations, stand in the marker, press E and then jump. Make sure that when you jump, you left click to activate your Parachute.
--Author: Couga & the N3MTV Server.
--Modified by: BossManNz.
--Credits: Couga, N3MTV, American1, BossManNz..
--Additional Notes: Set the "enableFee" to false on line 14 of the server.lua if you wish to charge people for the parachute (great money sink for economy/role-play based servers in my opinion).

local para = {
	["parachute1"] = {
		position = { ['x'] = 454.8185, ['y'] = 5584.343, ['z'] = 781.2034 },
		name = "Base Jump",
	},
	["parachute2"] = {
		position = { ['x'] = -128.143, ['y'] = -596.1727, ['z'] = 201.7354 },
		name = "Base Jump",
	},
	["parachute3"] = {
		position = { ['x'] = -1136.317, ['y'] = 4659.592, ['z'] = 243.9243 },
		name = "Base Jump",
	},
	["parachute4"] = {
		position = { ['x'] = 1665.401, ['y'] = -27.96845, ['z'] = 196.9363 },
		name = "Base Jump",
	},
	["parachute5"] = {
		position = { ['x'] = -546.6611, ['y'] = -2229.825, ['z'] = 122.3656 },
		name = "Base Jump",
	},
	["parachute6"] = {
		position = { ['x'] = -119.712, ['y'] = -976.443, ['z'] = 296.197 },
		name = "Base Jump",
	},
}


-- blips
Citizen.CreateThread(function()
	for k,v in pairs(para) do
		local bjump = v.position

		local blip = AddBlipForCoord(bjump.x, bjump.y, bjump.z)
		SetBlipSprite(blip, 94)
		SetBlipColour(blip, 15)
		SetBlipScale(blip, 0.8)
		SetBlipAsShortRange(blip, true)
		BeginTextCommandSetBlipName("STRING")
		AddTextComponentString("Base Jump")
		EndTextCommandSetBlipName(blip)
	end
end)


function giveParachute()
    GiveWeaponToPed(GetPlayerPed(-1), GetHashKey("GADGET_PARACHUTE"), 150, true, true)
end

Citizen.CreateThread(function()
	while true do
		Citizen.Wait(2)
		local pos = GetEntityCoords(GetPlayerPed(-1), true)

		for k,v in pairs(para)do
			local pos2 = v.position

			if(Vdist(pos.x, pos.y, pos.z, pos2.x, pos2.y, pos2.z) < 15.0)then
					DrawMarker(1, v.position.x, v.position.y, v.position.z - 1, 0, 0, 0, 0, 0, 0, 1.0001, 1.0001, 1.5001, 1555, 0, 0,255, 0, 0, 0,0)

					if(Vdist(pos.x, pos.y, pos.z, pos2.x, pos2.y, pos2.z) < 1.0)then
                        ClearPrints()
                        SetTextEntry_2("STRING")
						AddTextEntry("BJ_Text",('Press ~INPUT_CONTEXT~ to take a Parachute. This will cost you $50.'))
					    DisplayHelpTextThisFrame("BJ_Text",false )
                        if IsControlJustPressed(1, 38) then
                            giveParachute()
							TriggerServerEvent('ogBj:baseJumpingCharge')
                        end
					end
			end
		end
	end
end)
