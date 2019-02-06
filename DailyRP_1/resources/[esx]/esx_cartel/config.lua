Config                            = {}
Config.DrawDistance               = 100.0
Config.MarkerType                 = 1
Config.MarkerSize                 = { x = 1.5, y = 1.5, z = 1.0 }
Config.MarkerColor                = { r = 50, g = 50, b = 204 }
Config.EnablePlayerManagement     = true
Config.EnableArmoryManagement     = false
Config.EnableESXIdentity          = true -- only turn this on if you are using esx_identity
Config.EnableNonFreemodePeds      = false -- turn this on if you want custom peds
Config.EnableSocietyOwnedVehicles = false
Config.EnableLicenses             = true
Config.MaxInService               = -1
Config.Locale                     = 'en'

Config.CartelStations = {

  Cartel = {

    Blip = {
--      Pos     = { x = 425.130, y = -979.558, z = 30.711 },
      Sprite  = 60,
      Display = 4,
      Scale   = 1.2,
      Colour  = 29,
    },

    AuthorizedWeapons = {
     -- { name = 'WEAPON_SAWNOFFSHOTGUN',       price = 9000 },
      { name = 'WEAPON_PISTOL',     price = 30000 },
     -- { name = 'WEAPON_BULLPUPSHOTGUN',       price = 1125000 },
     -- { name = 'WEAPON_COMPACTRIFLE',     price = 1500000 },
     -- { name = 'WEAPON_PUMPSHOTGUN',      price = 600000 },
     -- { name = 'WEAPON_STUNGUN',          price = 50000 },
     -- { name = 'WEAPON_FLASHLIGHT',       price = 800 },
     -- { name = 'WEAPON_FIREEXTINGUISHER', price = 1200 },
     -- { name = 'WEAPON_FLAREGUN',         price = 6000 },
     -- { name = 'GADGET_PARACHUTE',        price = 3000 },
	 -- { name = 'WEAPON_BAT'		,        price = 3000 },
     -- { name = 'WEAPON_STICKYBOMB',       price = 200000 },
   --   { name = 'WEAPON_SNIPERRIFLE',      price = 2200000 },
     -- { name = 'WEAPON_FIREWORK',         price = 30000 },
     -- { name = 'WEAPON_GRENADE',          price = 180000 },
     -- { name = 'WEAPON_BZGAS',            price = 120000 },
    --  { name = 'WEAPON_SMOKEGRENADE',     price = 100000 },
      --{ name = 'WEAPON_APPISTOL',         price = 70000 },
      --{ name = 'WEAPON_CARBINERIFLE',     price = 1100000 },
   --   { name = 'WEAPON_HEAVYSNIPER',      price = 2000000 },
    --  { name = 'WEAPON_MINIGUN',          price = 700000 },
     -- { name = 'WEAPON_RAILGUN',          price = 2500000 },
    },

	  AuthorizedVehicles = {
		  { name = 'cognoscenti2',  label = 'Véhicule Blindé' },
		  { name = 'Manchez',    label = 'Moto' },
		  { name = 'Contender',   label = '4X4' },
		  { name = 'felon',      label = 'Véhicule Civil' },
	  },

    Cloakrooms = {
      { x = 1172.7686767575, y = 2636.0771484375, z = 36.78857421875},
    },

    Armories = {
      { x = 1172.2673339844, y = 2639.7021484375, z = 36.7903175354},
    },

    Vehicles = {
      {
        Spawner    = { x = 1175.3450927734, y = 2640.8159179688, z = 36.753826141357 },
        SpawnPoint = { x = 1180.6805419922, y = 2652.4738769531, z = 36.809921264648 },
        Heading    = 296.36,
      }
    },

    Helicopters = {
      {
        Spawner    = { x = 113.30500793457, y = -3109.3337402344, z = 6.0060696601868 },
        SpawnPoint = { x = 112.94457244873, y = -3102.5942382813, z = 6.0050659179688 },
        Heading    = 0.0,
      }
    },

    VehicleDeleters = {
      { x = 1182.5756835938, y = 2638.5278320313, z = 36.79508972168 },
      
    },

    BossActions = {
      { x = 1187.8504638672, y = 2636.2543945313, z = 37.401874542236 },
    },

  },

}
