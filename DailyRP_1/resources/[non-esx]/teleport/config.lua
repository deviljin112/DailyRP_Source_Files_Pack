Config = {}

-- E key by default
Config.actionKey = 38

-- markers AKA Teleporters
Config.zones = {
	
	weed = {
		x = -1111.24,
		y = 4937.37,
		z = 218.39,
		w = 2.0,
		h = 1.0,
		visible = false,
		t = 29,
		color = {
			r = 0,
			g = 102,
			b = 0
		}
		
	},
	
	weedwyjscie = {
		x = 1066.07,
		y = -3183.58,
		z = -39.01,
		w = 2.0,
		h = 1.0,
		visible = false,
		t = 29,
		color = {
			r = 0,
			g = 102,
			b = 0
		}
		
	},
	
	
	meth = {
		x = 3610.36,
		y = 3699.29,
		z = 43.49,
		w = 2.0,
		h = 1.0,		
		visible = false,
		t = 29,
		color = {
			r = 102,
			g = 0,
			b = 0
		}
	},

	methwyjscie = {
		x =  997.20,
		y = -3200.50,
		z = -36.70,
		w = 2.0,
		h = 1.0,		
		visible = false,
		t = 29,
		color = {
			r = 102,
			g = 0,
			b = 0
		}
	},
	
	meth2 = {
		x =  915.3,
		y = -1690.4,
		z = 43.15,
		w = 2.0,
		h = 1.0,		
		visible = true,
		t = 29,
		color = {
			r = 102,
			g = 0,
			b = 0
		}
	},

	methwyjscie2 = {
		x = 3529.15,
		y = 3697.91,
		z = 20.99,
		w = 2.0,
		h = 1.0,		
		visible = false,
		t = 29,
		color = {
			r = 102,
			g = 0,
			b = 0
		}
	},

	coke = {
		x = 1722.53,
		y = 4734.91,
		z = 42.13,
		w = 2.0,
		h = 1.0,		
		visible = false,
		t = 1,
		color = {
			r = 102,
			g = 0,
			b = 0
		}
	},
	
	cokewyjscie = {
		x = 1088.60,
		y = -3188.0,
		z = -39.40,
		w = 2.0,
		h = 1.0,		
		visible = false,
		t = 29,
		color = {
			r = 102,
			g = 0,
			b = 0
		}
	},

	randomwejscie = {
		x = 1069.0,
		y = -3099.8,
		z = -39.0,
		w = 2.0,
		h = 1.0,		
		visible = true,
		t = 0,
		color = {
			r = 255,
			g = 255,
			b = 0
		}
	},

	randomwyjscie = {
		x = 998.69,
		y = -3105.98,
		z = -39.0,
		w = 2.0,
		h = 1.0,		
		visible = true,
		t = 0,
		color = {
			r = 255,
			g = 255,
			b = 0
		}
	},
	
	pralnia = {
		x = 1196.77,
		y = -3253.84,
		z = 7.1,
		w = 2.0,
		h = 1.0,		
		visible = false,
		t = 0,
		color = {
			r = 255,
			g = 255,
			b = 0
		}
	},		
	
	pralnia1 = {
		x = 1138.53,
		y = -3198.99,
		z = -38.9,
		w = 2.0,
		h = 1.0,		
		visible = false,
		t = 24,
		color = {
			r = 0,
			g = 255,
			b = 0
		}
	}		
	
}

-- Landing point, keep the same name as markers
Config.point = {

	weed = {
		x = 1064.55,
		y = -3182.36,
		z = -39.16,
	},

	weedwyjscie = {
		x = -1111.24,
		y = 4937.37,
		z = 218.39,
	},
	
	weed2 = {
		x = -41.55,
		y = -142.36,
		z = 57.16
	},

	weedwyjscie2 = {
		x = -61.07,
		y = -174.58,
		z = -100.0,
	},	
	
	meth = {
		x = 997.5,
		y = -3200.6,
		z = -36.9
	},

	methwyjscie = {
		x = 3610.36,
		y = 3699.29,
		z = 43.49,
	},	
	
	meth2 = {
		x = 3529.15,
		y = 3697.91,
		z = 20.99,
	},

	methwyjscie2 = {
		x = 915.3,
		y = -1690.4,
		z = 43.15,
	},

	coke = {
		x = 1088.6,
		y = -3188.6,
		z = -39.2,
	},
	
	cokewyjscie = {
		x = 1722.53,
		y = 4734.91,
		z = 42.13,
	},

	randomwejscie = {
		x = 998.69,
		y = -3105.98,
		z = -39.0,
	},

	randomwyjscie = {
		x = 1069.0,
		y = -3099.8,
		z = -39.0,
	},
	
	pralnia = {
		x = 1138.53,
		y = -3198.99,
		z = -39.8,
	},	
	
	pralnia1 = {
		x = 1196.77,
		y = -3253.84,
		z = 7.1,
	}	
	
}


-- Automatic teleport list (no need to puseh E key in the marker)
Config.auto = {
	'weesd'
}