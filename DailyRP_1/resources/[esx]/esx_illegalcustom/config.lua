Config              = {}
Config.DrawDistance = 100.0
Config.Locale = 'fr'
Config.IsMecanoJobOnly = false

Config.Zones = {
    ills1 = {
        Pos   = { x = -1358.030, y = -757.7526, z = 22.3050},
        Size  = {x = 3.0, y = 3.0, z = 0.2},
        Color = {r = 204, g = 204, b = 0},
        Marker= 1,
        Name  = "Illegal Custom",
        Hint  = _U('press_custom')
    },
}

Config.Menus = {
	main = {
		label = 'ILLEGAL CUSTOMS',
		parent = nil,
		upgrades = _U('upgrades')
	},
	upgrades = {
		label = _U('upgrades'),
		parent = 'main',
		modArmor = _U('armor'),
		modTurbo = _U('turbo')
	},
	modArmor = {
		label = _U('armor'),
		parent = 'upgrades',
		modType = 16,
		price = {69.77, 116.28, 139.54, 162.8, 186.06, 209.32}
	},
	modTurbo = {
		label = _U('turbo'),
		parent = 'upgrades',
		modType = 17,
		price = {55.81}
	}
}
