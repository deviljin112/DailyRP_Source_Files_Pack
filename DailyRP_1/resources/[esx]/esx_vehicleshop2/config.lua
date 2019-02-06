Config                            = {}
Config.DrawDistance               = 100.0
Config.MarkerColor                = { r = 120, g = 120, b = 240 }
Config.EnablePlayerManagement     = false -- enables the actual car dealer job. You'll need esx_addonaccount, esx_billing and esx_society
Config.EnablePvCommand            = false
Config.EnableOwnedVehicles        = true
Config.EnableSocietyOwnedVehicles = false -- use with EnablePlayerManagement disabled, or else it wont have any effects
Config.ResellPercentage           = 25
Config.Locale                     = 'pl'

-- looks like this: 'LLL NNN'
-- The maximum plate length is 8 chars (including spaces & symbols), don't go past it!
Config.PlateLetters  = 3
Config.PlateNumbers  = 3
Config.PlateUseSpace = true

Config.Zones = {

  ShopEntering = {
    Pos   = { x = -41.61, y = -1675.62, z = 28.42 },
    Size  = { x = 1.5, y = 1.5, z = 1.0 },
    Type  = 1,
  },

  ShopInside = {
    Pos     = { x = -53.71, y = -1683.27, z = 28.49 },
    Size    = { x = 1.5, y = 1.5, z = 1.0 },
    Heading = 313.0,
    Type    = -1,
  },

  ShopOutside = {
    Pos     = { x = -47.72, y = -1690.46, z = 28.42 },
    Size    = { x = 1.5, y = 1.5, z = 1.0 },
    Heading = 300.0,
    Type    = -1,
  },

  BossActions = {
    Pos   = { x = -34.09, y = -1676.98, z = 28.49 },
    Size  = { x = 1.5, y = 1.5, z = 1.0 },
    Type  = -1,
  },

  GiveBackVehicle = {
    Pos   = { x = -28.26, y = -1674.01, z = 28.49 },
    Size  = { x = 3.0, y = 3.0, z = 1.0 },
    Type  = (Config.EnablePlayerManagement and 1 or -1),
  },

  ResellVehicle = {
    Pos   = { x = -21.67, y = -1676.73, z = 28.3 },
    Size  = { x = 3.0, y = 3.0, z = 1.0 },
    Type  = 1,
  },

}
