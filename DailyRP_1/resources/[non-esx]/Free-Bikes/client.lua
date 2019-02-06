-- Scripted by Woopi/Lucas Miller
local table = { -- Here you can add more markers | markers is not the same as blips, blips are below!
    {x = -246.980,y = -339.820,z = 29.000},
    {x = -6.986,y = -1081.704,z = 25.500},
}

local blips = {
  -- Add your wanted blips to your wanted locations here! | Uses table to add more blips so it doesnt cause problems!

   {title="Free Bikes!", colour=2, id=376, x = -248.938, y = -339.955, z = 29.969},
   {title="Free Bikes!", colour=2, id=376, x = -6.892, y = -1081.734, z = 26.829},
}
--[[  IMPORTANT READ! IMPORTANT READ! IMPORTANT READ! IMPORTANT READ! IMPORTANT READ! IMPORTANT READ! IMPORTANT READ! IMPORTANT READ! IMPORTANT READ!
Do NOT change or modify the code below if you dont know what you are doing!
Do not complain in the forums if you do so, because i most likely will NOT help you!
]]

Citizen.CreateThread(function()

  for _, info in pairs(blips) do
    info.blip = AddBlipForCoord(info.x, info.y, info.z)
    SetBlipSprite(info.blip, info.id)
    SetBlipDisplay(info.blip, 4)
    SetBlipScale(info.blip, 1.0)
    SetBlipColour(info.blip, info.colour)
    SetBlipAsShortRange(info.blip, true)
    BeginTextCommandSetBlipName("STRING")
    AddTextComponentString(info.title)
    EndTextCommandSetBlipName(info.blip)
  end
end)

function hash_bike()
  local plyCoords = GetEntityCoords(GetPlayerPed(-1), false)
  local hash = GetHashKey("tribike2")  
  local ve =   CreateVehicle(hash,plyCoords, true, false)
  local ped = GetPlayerPed(-1)
  
  RequestModel(hash)
    while not HasModelLoaded(hash) do
        RequestModel(hash)
        Citizen.Wait(0)
    end
  
    if ve then
        SetPedIntoVehicle(ped, ve, -1)
    end
end

--TaskWarpPedIntoVehicle(GetPlayerPed(), tribike2, -1 )
--SetPedIntoVehicle(ped, vehicle, seatIndex)

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)
        for k in pairs(table) do
            -- Draw Marker Here --
            DrawMarker(1, table[k].x, table[k].y, table[k].z, 0, 0, 0, 0, 0, 0, 2.001, 2.0001, 0.501, 0, 0, 255, 200, 0, 0, 0, 0)
        end
    end
end)

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)
        for k in pairs(table) do
            local plyCoords = GetEntityCoords(GetPlayerPed(-1), false)
            local dist = Vdist(plyCoords.x, plyCoords.y, plyCoords.z, table[k].x, table[k].y, table[k].z)
            if dist <= 1.40 then
                AddTextEntry("FREE_BIKE", "Press ~r~~h~E~h~~w~ To Collect Your Free Bike!")
                DisplayHelpTextThisFrame("FREE_BIKE",false )
                if IsControlJustPressed(0,51) and IsPedOnFoot(PlayerPedId()) then
                    Citizen.Wait(100)  
                    hash_bike()
                end
            
            
            
            end
        end
    end
end)

-- Do not change this!!
print("Bike script is now working! - Scripted by Woopi/Lucas Miller")
