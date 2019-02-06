Config                            = {}
Config.DrawDistance               = 100.0
Config.MarkerColor                = { r = 120, g = 120, b = 240 }
Config.EnablePlayerManagement     = true
Config.EnablePvCommand            = false
Config.EnableOwnedVehicles        = true
Config.EnableSocietyOwnedVehicles = false
Config.ResellPercentage           = 100
Config.Locale                     = 'en'

Config.Zones = {

  ShopEntering = {
    Pos   = { x = 1012.27, y = -3158.53, z = -39.91 },
    Size  = { x = 1.5, y = 1.5, z = 1.0 },
    Type  = 1,
  },

  ShopInside = {
    Pos     = { x = 1004.62, y = -3159.3, z = -39.91 },
    Size    = { x = 1.5, y = 1.5, z = 1.0 },
    Heading = 180.0,
    Type    = -1,
  },

  ShopOutside = {
    Pos     = { x = 999.77, y = -3171.79, z = -39.91 },
    Size    = { x = 1.5, y = 1.5, z = 1.0 },
    Heading = 90.0,
    Type    = -1,
  },

  BossActions = {
    Pos   = { x = 1008.92, y = -3170.04, z = -39.91 },
    Size  = { x = 1.5, y = 1.5, z = 1.0 },
    Type  = -1,
  },

  GiveBackVehicle = {
    Pos   = { x = 760.85, y = -740.77, z = 26.5 },
    Size  = { x = 3.0, y = 3.0, z = 1.0 },
    Type  = (Config.EnablePlayerManagement and 1 or -1),
  },

  ResellVehicle = {
    Pos   = { x = 760.88, y = -805.5, z = 25.34 },
    Size  = { x = 3.0, y = 3.0, z = 1.0 },
    Type  = 1,
  },

}
