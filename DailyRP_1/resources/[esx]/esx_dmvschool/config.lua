Config                 = {}
Config.DrawDistance    = 100.0
Config.MaxErrors       = 3
Config.SpeedMultiplier = 2.23693629
Config.Locale          = 'en'

Config.Prices = {
  dmv         = 500,
  drive       = 1000,
  drive_bike  = 1000,
  drive_truck = 1000
}

Config.VehicleModels = {
  drive       = 'brioso',
  drive_bike  = 'sanchez',
  drive_truck = 'mule3'
}

Config.SpeedLimits = {
  residence = 20,
  town      = 50,
  freeway   = 80
}

Config.Zones = {

  DMVSchool = {
    Pos   = {x = -14.15, y = -152.2, z = 55.69},
    Size  = {x = 1.5, y = 1.5, z = 1.0},
    Color = {r = 204, g = 204, b = 0},
    Type  = 1
  },

  VehicleSpawnPoint = {
    Pos   = {x = 3.32, y = -148.72, z = 55.64},
    Size  = {x = 1.5, y = 1.5, z = 1.0},
    Color = {r = 204, g = 204, b = 0},
    Type  = -1
  },

}

Config.CheckPoints = {

  {
    Pos = {x = 50.28, y = -167.04, z = 53.42},
    Action = function(playerPed, vehicle, setCurrentZoneType)
	
	setCurrentZoneType('town')
	
      Citizen.CreateThread(function()
        DrawMissionText(_U('stop_look_left') .. Config.SpeedLimits['town'] .. 'mph', 5000)
        PlaySound(-1, 'RACE_PLACED', 'HUD_AWARDS', 0, 0, 1)
        FreezeEntityPosition(vehicle, true)
        Citizen.Wait(4000)
        FreezeEntityPosition(vehicle, false)
        DrawMissionText(_U('good_turn_right'), 5000)

      end)
    end
  },
  {
    Pos = {x = 34.44, y = -258.7, z = 46.02},
    Action = function(playerPed, vehicle, setCurrentZoneType)
      DrawMissionText(_U('stop_for_passing'), 5000)
      PlaySound(-1, 'RACE_PLACED', 'HUD_AWARDS', 0, 0, 1)
      FreezeEntityPosition(vehicle, true)
      Citizen.Wait(6000)
      FreezeEntityPosition(vehicle, false)
    end
  },
  {
    Pos = {x = -104.4, y = -609.85, z = 34.42},
    Action = function(playerPed, vehicle, setCurrentZoneType)
      DrawMissionText(_U('go_next_point'), 5000)
    end
  },
  {
    Pos = {x = -183.72, y = -868.86, z = 27.69},
    Action = function(playerPed, vehicle, setCurrentZoneType)
      Citizen.CreateThread(function()
        DrawMissionText(_U('stop_for_ped'), 5000)
        PlaySound(-1, 'RACE_PLACED', 'HUD_AWARDS', 0, 0, 1)
        FreezeEntityPosition(vehicle, true)
        Citizen.Wait(4000)
        FreezeEntityPosition(vehicle, false)
        DrawMissionText(_U('good_lets_cont'), 5000)

      end)
    end
  },
  {
    Pos = {x = -280.16, y = -1119.56, z = 21.36},
    Action = function(playerPed, vehicle, setCurrentZoneType)
      DrawMissionText(_U('watch_traffic_lightson'), 5000)
    end
  },
  {
    Pos = {x = -276.74, y = -1407.48, z = 29.69},
    Action = function(playerPed, vehicle, setCurrentZoneType)
      DrawMissionText(_U('good_turn_left'), 5000)
    end
  },
  {
    Pos = {x = -119.68, y = -1375.32, z = 27.76},
    Action = function(playerPed, vehicle, setCurrentZoneType)
      Citizen.CreateThread(function()
        DrawMissionText(_U('stop_for_passing'), 5000)
        PlaySound(-1, 'RACE_PLACED', 'HUD_AWARDS', 0, 0, 1)
        FreezeEntityPosition(vehicle, true)
        Citizen.Wait(4000)
        FreezeEntityPosition(vehicle, false)
        DrawMissionText(_U('good_turn_left'), 5000)

      end)
    end
  },
  {
    Pos = {x = -97.15, y = -1160.27, z = 24.14},
    Action = function(playerPed, vehicle, setCurrentZoneType)
      DrawMissionText(_U('good_lets_cont'), 5000)
    end
  },
  {
    Pos = {x = -33.93, y = -969.49, z = 27.76},
    Action = function(playerPed, vehicle, setCurrentZoneType)
      DrawMissionText(_U('go_next_point'), 5000)
    end
  },
  {
    Pos = {x = 36.22, y = -794.74, z = 29.88},
    Action = function(playerPed, vehicle, setCurrentZoneType)
      DrawMissionText(_U('good_turn_right'), 5000)
    end
  },
  {
    Pos = {x = 147.8, y = -814.5, z = 30.0},
    Action = function(playerPed, vehicle, setCurrentZoneType)
      DrawMissionText(_U('good_lets_cont'), 5000)
    end
  },
  {
    Pos = {x = 389.51, y = -866.05, z = 28.04},
    Action = function(playerPed, vehicle, setCurrentZoneType)
      Citizen.CreateThread(function()
        DrawMissionText(_U('stop_for_passing'), 5000)
        PlaySound(-1, 'RACE_PLACED', 'HUD_AWARDS', 0, 0, 1)
        FreezeEntityPosition(vehicle, true)
        Citizen.Wait(4000)
        FreezeEntityPosition(vehicle, false)
        DrawMissionText(_U('good_turn_right'), 5000)

      end)
    end
  },
  {
    Pos = {x = 394.85, y = -1021.63, z = 28.16},
    Action = function(playerPed, vehicle, setCurrentZoneType)
      DrawMissionText(_U('good_turn_left'), 5000)
    end
  },
  {
    Pos = {x = 760.76, y = -1009.26, z = 25.05},
    Action = function(playerPed, vehicle, setCurrentZoneType)
      DrawMissionText(_U('watch_traffic_lightson'), 5000)
    end
  },
  {
    Pos = {x = 976.82, y = -1000.45, z = 40.55},
    Action = function(playerPed, vehicle, setCurrentZoneType)
      DrawMissionText(_U('good_turn_left'), 5000)
    end
  },
  {
    Pos = {x = 947.32, y = -862.65, z = 42.64},
    Action = function(playerPed, vehicle, setCurrentZoneType)
      DrawMissionText(_U('good_turn_right'), 5000)
    end
  },
  {
    Pos = {x = 1005.06, y = -838.63, z = 46.8},
    Action = function(playerPed, vehicle, setCurrentZoneType)

      setCurrentZoneType('freeway')

      DrawMissionText(_U('hway_time') .. Config.SpeedLimits['freeway'] .. 'mph', 5000)
      PlaySound(-1, 'RACE_PLACED', 'HUD_AWARDS', 0, 0, 1)
	  FreezeEntityPosition(vehicle, true)
      Citizen.Wait(6000)
      FreezeEntityPosition(vehicle, false)
      DrawMissionText(_U('good_turn_left'), 5000)
    end
  },
  {
    Pos = {x = 810.08, y = -632.58, z = 39.23},
    Action = function(playerPed, vehicle, setCurrentZoneType)
      DrawMissionText(_U('good_lets_cont'), 5000)
    end
  },
  {
    Pos = {x = 612.08, y = -515.08, z = 45.23},
    Action = function(playerPed, vehicle, setCurrentZoneType)
      DrawMissionText(_U('go_next_point'), 5000)
    end
  },
  {
    Pos = {x = 585.34, y = -390.47, z = 42.93},
    Action = function(playerPed, vehicle, setCurrentZoneType)

      setCurrentZoneType('town')

      Citizen.CreateThread(function()
        DrawMissionText(_U('stop_look_left') .. Config.SpeedLimits['town'] .. 'mph', 5000)
        PlaySound(-1, 'RACE_PLACED', 'HUD_AWARDS', 0, 0, 1)
        FreezeEntityPosition(vehicle, true)
        Citizen.Wait(6000)
        FreezeEntityPosition(vehicle, false)
        DrawMissionText(_U('good_turn_left'), 5000)
      end)
    end
  },
  {
    Pos = {x = 433.77, y = -293.86, z = 48.78},
    Action = function(playerPed, vehicle, setCurrentZoneType)
      DrawMissionText(_U('gratz_stay_alert'), 5000)
      PlaySound(-1, 'RACE_PLACED', 'HUD_AWARDS', 0, 0, 1)
    end
  },
  {
    Pos = {x = 181.44, y = -196.59, z = 53.0},
    Action = function(playerPed, vehicle, setCurrentZoneType)
      DrawMissionText(_U('good_lets_cont'), 5000)
    end
  },
  {
    Pos = {x = -1.01, y = -147.4, z = 55.19},
    Action = function(playerPed, vehicle, setCurrentZoneType)
      ESX.Game.DeleteVehicle(vehicle)
    end
  },
  
  
  
  
--[[ 
  {
    Pos = {x = 255.139, y = -1400.731, z = 29.537},
    Action = function(playerPed, vehicle, setCurrentZoneType)
      DrawMissionText(_U('next_point_speed') .. Config.SpeedLimits['residence'] .. 'km/h', 5000)
    end
  },

  {
    Pos = {x = 271.874, y = -1370.574, z = 30.932},
    Action = function(playerPed, vehicle, setCurrentZoneType)
      DrawMissionText(_U('go_next_point'), 5000)
    end
  },

  {
    Pos = {x = 234.907, y = -1345.385, z = 29.542},
    Action = function(playerPed, vehicle, setCurrentZoneType)
      Citizen.CreateThread(function()
        DrawMissionText(_U('stop_for_ped'), 5000)
        PlaySound(-1, 'RACE_PLACED', 'HUD_AWARDS', 0, 0, 1)
        FreezeEntityPosition(vehicle, true)
        Citizen.Wait(4000)
        FreezeEntityPosition(vehicle, false)
        DrawMissionText(_U('good_lets_cont'), 5000)

      end)
    end
  },

  {
    Pos = {x = 217.821, y = -1410.520, z = 28.292},
    Action = function(playerPed, vehicle, setCurrentZoneType)

      setCurrentZoneType('town')

      Citizen.CreateThread(function()
        DrawMissionText(_U('stop_look_left') .. Config.SpeedLimits['town'] .. 'km/h', 5000)
        PlaySound(-1, 'RACE_PLACED', 'HUD_AWARDS', 0, 0, 1)
        FreezeEntityPosition(vehicle, true)
        Citizen.Wait(6000)
        FreezeEntityPosition(vehicle, false)
        DrawMissionText(_U('good_turn_right'), 5000)
      end)
    end
  },

  {
    Pos = {x = 178.550, y = -1401.755, z = 27.725},
    Action = function(playerPed, vehicle, setCurrentZoneType)
      DrawMissionText(_U('watch_traffic_lightson'), 5000)
    end
  },

  {
    Pos = {x = 113.160, y = -1365.276, z = 27.725},
    Action = function(playerPed, vehicle, setCurrentZoneType)
      DrawMissionText(_U('go_next_point'), 5000)
    end
  },

  {
    Pos = {x = -73.542, y = -1364.335, z = 27.789},
    Action = function(playerPed, vehicle, setCurrentZoneType)
      DrawMissionText(_U('stop_for_passing'), 5000)
      PlaySound(-1, 'RACE_PLACED', 'HUD_AWARDS', 0, 0, 1)
      FreezeEntityPosition(vehicle, true)
      Citizen.Wait(6000)
      FreezeEntityPosition(vehicle, false)
    end
  },

  {
    Pos = {x = -355.143, y = -1420.282, z = 27.868},
    Action = function(playerPed, vehicle, setCurrentZoneType)
      DrawMissionText(_U('go_next_point'), 5000)
    end
  },

  {
    Pos = {x = -439.148, y = -1417.100, z = 27.704},
    Action = function(playerPed, vehicle, setCurrentZoneType)
      DrawMissionText(_U('go_next_point'), 5000)
    end
  },

  {
    Pos = {x = -453.790, y = -1444.726, z = 27.665},
    Action = function(playerPed, vehicle, setCurrentZoneType)

      setCurrentZoneType('freeway')

      DrawMissionText(_U('hway_time') .. Config.SpeedLimits['freeway'] .. 'km/h', 5000)
      PlaySound(-1, 'RACE_PLACED', 'HUD_AWARDS', 0, 0, 1)
    end
  },

  {
    Pos = {x = -463.237, y = -1592.178, z = 37.519},
    Action = function(playerPed, vehicle, setCurrentZoneType)
      DrawMissionText(_U('go_next_point'), 5000)
    end
  },

  {
    Pos = {x = -900.647, y = -1986.28, z = 26.109},
    Action = function(playerPed, vehicle, setCurrentZoneType)
      DrawMissionText(_U('go_next_point'), 5000)
    end
  },

  {
    Pos = {x = 1225.759, y = -1948.792, z = 38.718},
    Action = function(playerPed, vehicle, setCurrentZoneType)
      DrawMissionText(_U('go_next_point'), 5000)
    end
  },

  {
    Pos = {x = 1225.759, y = -1948.792, z = 38.718},
    Action = function(playerPed, vehicle, setCurrentZoneType)

      setCurrentZoneType('town')

      DrawMissionText(_U('in_town_speed') .. Config.SpeedLimits['town'] .. 'km/h', 5000)
    end
  },

  {
    Pos = {x = 1163.603, y = -1841.771, z = 35.679},
    Action = function(playerPed, vehicle, setCurrentZoneType)
      DrawMissionText(_U('gratz_stay_alert'), 5000)
      PlaySound(-1, 'RACE_PLACED', 'HUD_AWARDS', 0, 0, 1)
    end
  },

  {
    Pos = {x = 235.283, y = -1398.329, z = 28.921},
    Action = function(playerPed, vehicle, setCurrentZoneType)
      ESX.Game.DeleteVehicle(vehicle)
    end
  },
]]--

}
