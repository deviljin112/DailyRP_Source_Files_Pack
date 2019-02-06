Config                            = {}
Config.DrawDistance               = 100.0
Config.MarkerType                 = 1
Config.MarkerSize                 = { x = 1.5, y = 1.5, z = 1.0 }
Config.MarkerColor                = { r = 50, g = 50, b = 204 }
Config.EnablePlayerManagement     = true
Config.EnableArmoryManagement     = true
Config.EnableESXIdentity          = true -- only turn this on if you are using esx_identity
Config.EnableNonFreemodePeds      = false -- turn this on if you want custom peds
Config.EnableSocietyOwnedVehicles = false
Config.EnableLicenses             = true
Config.MaxInService               = -1
Config.Locale                     = 'en'

Config.StateStations = {

  State = {

    Blip = {
      Pos     = { x = -429.114, y = 1111.057, z = 327.694 },
      Sprite  = 419,
      Display = 4,
      Scale   = 1.2,
--      Colour  = 29,
    },

    AuthorizedWeapons = {
      { name = 'WEAPON_FLASHLIGHT',       price = 800 },
      { name = 'WEAPON_FIREEXTINGUISHER', price = 1200 },
    },

	  AuthorizedVehicles = {
		  { name = 'stretch',  label = 'Sortie VIP' },
		  { name = 'kuruma2',    label = 'Escorte Ville' },
		  { name = 'baller6',   label = 'Escorte Montagne' },
		  { name = 'volatus',      label = 'Transporte Hélico' },
		  { name = 'swift',   label = 'Transporte Hélico' },
		  { name = 'faggio3',   label = 'Détente' },
		  { name = 'dubsta2',       label = 'Sortie Ville/Montagne' },
	  },

    Cloakrooms = {
      { x = -467.487, y = 1128.903, z = 324.855 },
    },

    Armories = {
      { x = -432.849, y = 1111.557, z = 326.682 },
    },

    Vehicles = {
      {
        Spawner    = { x = -413.148, y = 1168.581, z = 324.854 },
        SpawnPoint = { x = -408.540, y = 1182.300, z = 324.568 },
        Heading    = 90.0,
      }
    },

    Helicopters = {
      {
        Spawner    = { x = 20.312, y = 535.667, z = 173.627 },
        SpawnPoint = { x = 3.40, y = 525.56, z = 177.919 },
        Heading    = 0.0,
      }
    },

    VehicleDeleters = {
      { x = -421.068, y = 1197.910, z = 324.641 },
    },

    BossActions = {
      { x = -425.213, y = 1109.755, z = 326.682 }
    },

  },

}
