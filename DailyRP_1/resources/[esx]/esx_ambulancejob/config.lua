Config                            = {}

Config.DrawDistance               = 100.0
Config.MarkerColor                = { r = 102, g = 0, b = 102 }
Config.MarkerSize                 = { x = 1.5, y = 1.5, z = 1.0 }
Config.ReviveReward               = 100  -- revive reward, set to 0 if you don't want it enabled
Config.AntiCombatLog              = true -- enable anti-combat logging?
Config.LoadIpl                    = true -- disable if you're using fivem-ipl or other IPL loaders
Config.Locale                     = 'pl'

local second = 1000
local minute = 60 * second

-- How much time before auto respawn at hospital
Config.RespawnDelayAfterRPDeath   = 10 * minute

Config.EnablePlayerManagement       = true
Config.EnableSocietyOwnedVehicles   = false

Config.RemoveWeaponsAfterRPDeath    = true
Config.RemoveCashAfterRPDeath       = true
Config.RemoveItemsAfterRPDeath      = true

-- Will display a timer that shows RespawnDelayAfterRPDeath as a countdown
Config.ShowDeathTimer               = true

-- Will allow respawn after half of RespawnDelayAfterRPDeath has elapsed.
Config.EarlyRespawn                 = true
-- The player will be fined for respawning early (on bank account)
Config.EarlyRespawnFine                  = true
Config.EarlyRespawnFineAmount            = 500

Config.Blip = {
	Pos     = { x = 307.76, y = -1433.47, z = 28.97 },
	Sprite  = 61,
	Display = 4,
	Scale   = 1.2,
	Colour  = 2,
}

Config.HelicopterSpawner = {
	SpawnPoint = { x = 313.33, y = -1465.2, z = 45.5 },
	Heading    = 0.0
}

-- https://wiki.fivem.net/wiki/Vehicles
Config.AuthorizedVehicles = {

	{
		model = 'ambulance',
		label = 'Ambulance'
	}

}

Config.Zones = {

	HospitalInteriorEntering1 = { -- Main entrance
		Pos	= { x = 343.55, y = -1398.23, z = 31.51 },
		Type = 1
	},

	HospitalInteriorInside1 = {
		Pos	= { x = 272.8, y = -1358.8, z = 23.5 },
		Type = -1
	},

	HospitalInteriorOutside1 = {
		Pos	= { x = 338.45, y = -1393.08, z = 31.51 },
		Type = -1
	},

	HospitalInteriorExit1 = {
		Pos	= { x = 275.7, y = -1361.5, z = 23.5 },
		Type = 1
	},

	HospitalInteriorEntering2 = { -- Lift go to the roof
		Pos	= { x = 247.1, y = -1371.4, z = 23.5 },
		Type = 1
	},

	HospitalInteriorInside2 = { -- Roof outlet
		Pos	= { x = 333.1,	y = -1434.9, z = 45.5 },
		Type = -1
	},

	HospitalInteriorOutside2 = { -- Lift back from roof
		Pos	= { x = 249.1,	y = -1369.6, z = 23.5 },
		Type = -1
	},

	HospitalInteriorExit2 = { -- Roof entrance
		Pos	= { x = 335.5, y = -1432.0, z = 45.5 },
		Type = 1
	},

	AmbulanceActions = { -- Cloakroom
		Pos	= { x = 268.4, y = -1363.330, z = 23.5 },
		Type = 1
	},

	VehicleSpawner = {
		Pos	= { x = 307.76, y = -1433.47, z = 28.97 },
		Type = 1
	},

	VehicleSpawnPoint = {
		Pos	= { x = 304.87, y = -1437.69, z = 28.80 },
		Type = -1
	},

	VehicleDeleter = {
		Pos	= { x = 327.67, y = -1481.1, z = 28.83 },
		Type = 1
	},

	Pharmacy = {
		Pos	= { x = 230.13, y = -1366.18, z = 38.53 },
		Type = 1
	},

	ParkingDoorGoOutInside = {
		Pos	= { x = 279.95, y = -1349.02, z = 23.54 },
		Type = 1
	},

	ParkingDoorGoOutOutside = {
		Pos	= { x = 296.73, y = -1445.13, z = 29.97 },
		Type = -1
	},

	ParkingDoorGoInInside = {
		Pos	= { x = 277.45, y = -1344.35, z = 24.54 },
		Type = -1
	},

	ParkingDoorGoInOutside = {
		Pos	= { x = 294.43, y = -1448.65, z = 28.97 },
		Type = 1
	},

	StairsGoTopTop = {
		Pos	= { x = 251.91, y = -1363.3, z = 38.53 },
		Type = -1
	},

	StairsGoTopBottom = {
		Pos	= { x = 237.45, y = -1373.89, z = 26.30 },
		Type = -1
	},

	StairsGoBottomTop = {
		Pos	= { x = 256.58, y = -1357.7, z = 37.30 },
		Type = -1
	},

	StairsGoBottomBottom = {
		Pos	= { x = 235.45, y = -1372.89, z = 26.30 },
		Type = -1
	}

}
