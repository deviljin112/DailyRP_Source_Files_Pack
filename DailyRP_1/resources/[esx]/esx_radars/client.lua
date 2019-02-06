--===============================================--===============================================
--= stationary radars based on  https://github.com/DreanorGTA5Mods/StationaryRadar           =
--===============================================--===============================================



ESX              = nil
local PlayerData = {}

Citizen.CreateThread(function()
    while ESX == nil do
        TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
        Citizen.Wait(0)
    end
end)

RegisterNetEvent('esx:playerLoaded')
AddEventHandler('esx:playerLoaded', function(xPlayer)
    PlayerData = xPlayer
end)

RegisterNetEvent('esx:setJob')
AddEventHandler('esx:setJob', function(job)
    PlayerData.job = job
end)

local radares = {
    {x = 379.68807983398, y = -1048.3527832031, z = 29.250692367554},
    {x = -253.10794067383, y = -630.20385742188, z = 33.002685546875},
    {x = 133.07, y = -904.45, z = 29.250692367554}, -- town center
    {x = 143.53, y = -920.76, z = 29.250692367554}, -- town center
    {x = 321.14, y = -1515.41, z = 29.34}, --szpital
    {x = -271.38, y = -1141.26, z = 23.08}, --skrzyrzowanie obok car dealera
    {x = -120.0, y = -721.48, z = 34.43}, -- skrzyrzowanie stary garaz
    {x = 401.26, y = -954.25, z = 29.04}, -- skrzyrzowanie na lewo od komisarjatu
    {x = 206.54, y = 201.94, z = 105.18}, -- skrzyrzowanie bank 1a
    {x = 196.58, y = 191.76, z = 105.2}, -- skrzyrzowanie bank 1b
    {x = -1600.0, y = -947.78, z = 12.71}, -- molo
    {x = -627.85, y = -843.01, z = 24.68}, -- skrzyrzowanie sklep z narzedziami
    {x = -644.16, y = -831.31, z = 24.47}, -- skrzyrzowanie sklep z narzedziami
	
}

Citizen.CreateThread(function()
    while true do
        Wait(0)
        for k,v in pairs(radares) do
            local player = GetPlayerPed(-1)
            local coords = GetEntityCoords(player, true)
            if Vdist2(radares[k].x, radares[k].y, radares[k].z, coords["x"], coords["y"], coords["z"]) < 20 then
                if PlayerData.job ~= nil and not (PlayerData.job.name == 'police' or PlayerData.job.name == 'ambulance') then
                    checkSpeed()
                end
            end
        end
    end
end)

function checkSpeed()
    local pP = GetPlayerPed(-1)
    local speed = GetEntitySpeed(pP)
    local vehicle = GetVehiclePedIsIn(pP, false)
    local driver = GetPedInVehicleSeat(vehicle, -1)
    local plate = GetVehicleNumberPlateText(vehicle)
    local maxspeed = 50
    local mphspeed = math.ceil(speed*2.236936)
	local fineamount = nil
	local finelevel = nil
	local truespeed = mphspeed
    if mphspeed > maxspeed and driver == pP then
        Citizen.Wait(250)
        TriggerServerEvent('fineAmount', mphspeed)
	if truespeed >= 50 and truespeed <= 60 then
	fineamount = Config.Fine
	finelevel = '10mph Ponad Limit'
	end
	if truespeed >= 60 and truespeed <= 70 then
	fineamount = Config.Fine2
	finelevel = '20mph Ponad Limit'
	end
	if truespeed >= 70 and truespeed <= 80 then
	fineamount = Config.Fine3
	finelevel = '30mph Ponad Limit'
	end
	if truespeed >= 80 and truespeed <= 500 then
	fineamount = Config.Fine4
	finelevel = '40mph Ponad Limit'
	end
        exports.pNotify:SetQueueMax("left", 1)
        exports.pNotify:SendNotification({
            text = "<h2><center>Foto Radar</center></h2>" .. "</br>Dostales mandat za szybka jazde!</br>Rejestracja: " .. plate .. "</br>Suma Mandatu: $" .. fineamount .. "</br>Przewinienie: " .. finelevel .. "</br>Limit Predkosci: " .. maxspeed .. "</br>Twoja Predkosc: " ..mphspeed,
            type = "error",
            timeout = 9500,
            layout = "centerLeft",
            queue = "left"
        })
    end
end

