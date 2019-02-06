--[[ 
	DriveByLimit 
    Copyright (C) 2018  Thaisen

    This program is free software: you can redistribute it and/or modify
    it under the terms of the GNU Affero General Public License as published
    by the Free Software Foundation, either version 3 of the License, or
    (at your option) any later version.

    This program is distributed in the hope that it will be useful,
    but WITHOUT ANY WARRANTY; without even the implied warranty of
    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
    GNU Affero General Public License for more details.

    You should have received a copy of the GNU Affero General Public License
    along with this program.  If not, see <http://www.gnu.org/licenses/>.
 ]]




-- CONFIG --

-- Allow passengers to shoot
local passengerDriveBy = true


Citizen.CreateThread(function()
	while true do
		Wait(1)
		local vehicle = GetVehiclePedIsIn(GetPlayerPed(-1), false)
		local speed = GetEntitySpeed(vehicle)
		local kmh = 3.6
		local mph = 2.23694
		local vehicleClass = GetVehicleClass(vehicle)
		local vehicleModel = GetEntityModel(vehicle)
			
			
		if vehicleClass ~= 15 and 16 then
		GetEntitySpeed(GetPedInVehicleSeat(GetPlayerPed(-1), false)) 
		-- If you want mph, then replace kmh with mph under here. If you want more or less than 30 also change it here
		if math.floor(speed*mph) > 40 then
				SetPlayerCanDoDriveBy(PlayerId(), false)
			elseif passengerDriveBy then
				SetPlayerCanDoDriveBy(PlayerId(), true)
			else
				SetPlayerCanDoDriveBy(PlayerId(), false)
			end
		end
	end
end)




-- VEHICLE CLASSES
-- id = 0 --compacts
-- id = 1 --sedans
-- id = 2 --SUV's
-- id = 3, --coupes
-- id = 4 --muscle
-- id = 5 --sport classic
-- id = 6 --sport
-- id = 7 --super
-- id = 8 --motorcycle
-- id = 9 --offroad
-- id = 10 --industrial
-- id = 11 -utility
-- id = 12 --vans
-- id = 13 --bicycles
-- id = 14 --boats
-- id = 15, --helicopter
-- id = 16 --plane
-- id = 17 --service
-- id = 18 --emergency
-- id = 19 --military
