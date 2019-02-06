Config                            = {}
Config.DrawDistance               = 100.0
Config.MarkerColor                = { r = 120, g = 120, b = 240 }
Config.EnablePlayerManagement     = true -- If set to true, you need esx_addonaccount, esx_billing and esx_society
Config.EnablePbCommand            = false
Config.EnableOwnedVehicles        = true
Config.EnableSocietyOwnedVehicles = false
Config.ResellPercentage           = 50
Config.Locale                     = 'en'

Config.Zones = {

  ShopEntering = {
    Pos   = { x = -714.357421875, y = -1297.3057861328, z = 4.1019196510315 },
    Size  = { x = 1.5, y = 1.5, z = 1.0 },
    Type  = 1,
  },

  ShopInside = {
    Pos     = { x = -710.36, y = -1339.86, z = 1.00 },
    Size    = { x = 1.5, y = 1.5, z = 1.0 },
    Heading = 140,
    Type    = -1,
  },

  ShopOutside = {
    Pos     = { x = -717.73089599609, y = -1339.2368164063, z = -0.39563521742821 },
    Size    = { x = 1.5, y = 1.5, z = 1.0 },
    Heading = 90.0,
    Type    = -1,
  },

  BossActions = {
    Pos   = { x = -704.38391113281, y = -1287.1623535156, z = 4.0776014328003 },
    Size  = { x = 1.5, y = 1.5, z = 1.0 },
    Type  = -1,
  },

  GiveBackVehicle = {
    Pos   = { x = -719.07598876953, y = -1320.7919921875, z = -0.49754849076271 },
    Size  = { x = 3.0, y = 3.0, z = 1.0 },
    Type  = (Config.EnablePlayerManagement and 1 or -1),
  },

  ResellVehicle = {
    Pos   = { x = -725.38537597656, y = -1327.8604736328, z = -0.47477427124977 },
    Size  = { x = 3.0, y = 3.0, z = 1.0 },
    Type  = 1,
  },

}
