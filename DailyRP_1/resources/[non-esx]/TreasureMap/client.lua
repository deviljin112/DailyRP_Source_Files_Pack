---------------------------------------------------------------------------
-- Main Thread Loading All The Locations To Find The TreasureMap!
---------------------------------------------------------------------------
Citizen.CreateThread(function()
while true do 
    Citizen.Wait(0)
    if (isNearDrawMarkerLocation()) then
        drawText('You have found something magical, press ~r~E~s~ to see what it does!',0,1,0.5,0.8,0.6,255,255,255,255) 
        if IsControlJustPressed(1, 86) then
            Citizen.Trace("Sent message to check database!")
                TriggerServerEvent("TreasureMap:CheckBeforeAddingIntoDatabase")
            end
        end
    end
end)
---------------------------------------------------------------------------
-- Event Thread To Allow Blips On The Map!
---------------------------------------------------------------------------
RegisterNetEvent("TreasureMap:DisplayBlips")
AddEventHandler("TreasureMap:DisplayBlips", function()
Citizen.CreateThread(function()
    for _, item in pairs(rpMapLocations) do
        item.blip = AddBlipForCoord(item.x, item.y, item.z) 
        SetBlipSprite(item.blip, item.icon)
        SetBlipColour(item.blip, item.colour)
        SetBlipAsShortRange(item.blip, true)
        SetBlipScale(item.blip, item.blipSize)
        BeginTextCommandSetBlipName("STRING")
        AddTextComponentString(item.text)
        EndTextCommandSetBlipName(item.blip)
        end
    end)
end)
---------------------------------------------------------------------------
-- Running A Client Event To Make The Server Add The Player Information Into The Server
---------------------------------------------------------------------------
    RegisterNetEvent("TreasureMap:NeedsAddingIntoDatabase")
    AddEventHandler("TreasureMap:NeedsAddingIntoDatabase", function()
        TriggerEvent("TreasureMap:DisplayBlips")
        Citizen.Trace("Added to Database!")
        TriggerServerEvent("TreasureMap:AddIntoDataBase")
    end)
---------------------------------------------------------------------------
-- On Player Spawn it will check with the server/database to see if you have found it before, gang gang! SKRT SKRT!
---------------------------------------------------------------------------
    AddEventHandler("playerSpawned", function()
        Citizen.Trace("Player Spawned Init!")
        TriggerServerEvent("TreasureMap:CheckOnPlayerSpawn")
    end)
---------------------------------------------------------------------------
-- Functions
---------------------------------------------------------------------------
function isNearDrawMarkerLocation() 
    local pos = {}
	local distance = 69
	for a = 1, #drawMarkerLocations do
		local coords = GetEntityCoords(PlayerPedId(), 0)
		local currentDistance = Vdist(drawMarkerLocations[a].x, drawMarkerLocations[a].y, drawMarkerLocations[a].z, coords.x, coords.y, coords.z)
		if(currentDistance < distance) then
			distance = currentDistance
			pos = drawMarkerLocations[a]
        end
    end

    if(distance < 30) then
        DrawMarker(1, pos.x, pos.y, pos.z,0,0,0,0,0,0,3.001,3.0001,0.5001,0,155,255,200,0,0,0,0)
    end
    if(distance < 2) then
        return true
    end
end

function drawText(text,font,centre,x,y,scale,r,g,b,a)
    SetTextFont(font)
	SetTextProportional(0)
	SetTextScale(scale, scale)
	SetTextColour(r, g, b, a)
	SetTextDropShadow(0, 0, 0, 0,255)
	SetTextEdge(1, 0, 0, 0, 255)
	SetTextDropShadow()
	SetTextOutline()
	SetTextCentre(centre)
	SetTextEntry("STRING")
	AddTextComponentString(text)
    DrawText(x , y)
end