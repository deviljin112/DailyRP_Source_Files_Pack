 -- Love me plz lemme be dev, plz ill send newds

Config = {}

-- 'bone' use bonetag https://pastebin.com/D7JMnX1g
-- x,y,z are offsets
Config.RealWeapons = {

	{name = 'WEAPON_NIGHTSTICK', 			bone = 58271, x = -0.20, y = 0.1,  z = -0.10, xRot = -55.0,  yRot = 90.00, zRot = 5.0, category = 'melee', 		model = 'w_me_nightstick'},
	{name = 'WEAPON_HAMMER', 				bone = 24818, x = 0.1, y = -0.15, z = 0.0, xRot = 0.0, yRot = 265.0, zRot = 0.0, category = 'melee', 		model = 'prop_tool_hammer'},
	{name = 'WEAPON_BAT', 				bone = 24818, x = 0.1, y = -0.15, z = 0.0, xRot = 0.0, yRot = 265.0, zRot = 0.0, 		category = 'melee', 		model = 'w_me_bat'},
	{name = 'WEAPON_GOLFCLUB', 			bone = 24818, x = 0.1, y = -0.15, z = 0.0, xRot = 0.0, yRot = 265.0, zRot = 0.0, category = 'melee', 		model = 'w_me_gclub'},
	{name = 'WEAPON_HATCHET', 				bone = 24818, x = 0.1, y = -0.15, z = 0.0, xRot = 0.0, yRot = 265.0, zRot = 0.0, category = 'melee', 		model = 'w_me_hatchet'},
	{name = 'WEAPON_MACHETE', 				bone = 24818, x = 0.1, y = -0.15, z = 0.0, xRot = 0.0, yRot = 265.0, zRot = 0.0, category = 'melee', 		model = 'prop_ld_w_me_machette'},


	{name = 'WEAPON_SMGMk2', 			bone = 24818, x = 0.10,    y = -0.15, 	z = 0.0,     xRot = 10.0, yRot = 50.0, zRot = 0.0, category = 'machine', 	model = 'w_sb_smgmk2'},
	{name = 'WEAPON_SMG', 				bone = 24818, x = 0.10,    y = -0.15, 	z = 0.0,     xRot = 10.0, yRot = 50.0, zRot = 0.0, category = 'machine', 	model = 'w_sb_smg'},
	{name = 'WEAPON_MG', 				bone = 24818, x = 65536.0, y = 65536.0, z = 65536.0, xRot = 0.0, yRot = 0.0, zRot = 0.0, category = 'machine', 	model = 'w_mg_mg'},
	{name = 'WEAPON_COMBATMG', 			bone = 24818, x = 65536.0, y = 65536.0, z = 65536.0, xRot = 0.0, yRot = 0.0, zRot = 0.0, category = 'machine', 	model = 'w_mg_combatmg'},
	{name = 'WEAPON_GUSENBERG', 		bone = 24818, x = 0.1, y = -0.15, z = 0.0, xRot = 0.0, yRot = 0.0, zRot = 0.0, category = 'machine', 	model = 'w_sb_gusenberg'},
	{name = 'WEAPON_COMBATPDW', 		bone = 24818, x = 0.10,    y = -0.15, 	z = 0.0,     xRot = 10.0, yRot = 50.0, zRot = 0.0, category = 'machine', 	model = 'w_sb_pdw'},
	{name = 'WEAPON_ASSAULTSMG', 		bone = 24818, x = 0.10,    y = -0.15, 	z = 0.0,     xRot = 10.0, yRot = 50.0, zRot = 0.0, category = 'machine', 	model = 'w_sb_assaultsmg'},
	{name = 'WEAPON_MINISMG', 			bone = 24818, x = 65536.0, y = 65536.0, z = 65536.0, xRot = 0.0, yRot = 0.0, zRot = 0.0, category = 'machine', 	model = 'wb_sb_minismg'},

	{name = 'WEAPON_ASSAULTRIFLE', 		bone = 24818, x = 0.10,    y = -0.15, 	z = 0.0,     xRot = 10.0, yRot = 50.0, zRot = 0.0, category = 'assault', 	model = 'w_ar_assaultrifle'},
	{name = 'WEAPON_CARBINERIFLE', 		bone = 24818, x = 0.15,    y = -0.15, 	z = 0.0,     xRot = 0.0, yRot = 0.0, zRot = 0.0, category = 'assault', 	model = 'w_ar_carbinerifle'},
	{name = 'WEAPON_CARBINERIFLE_Mk2', 	bone = 24818, x = 0.15,    y = -0.15, 	z = 0.0,     xRot = 0.0, yRot = 0.0, zRot = 0.0, category = 'assault', 	model = 'w_ar_carbineriflemk2'},
	{name = 'WEAPON_ADVANCEDRIFLE', 	bone = 24818, x = 65536.0, y = 65536.0, z = 65536.0, xRot = 0.0, yRot = 0.0, zRot = 0.0, category = 'assault', 	model = 'w_ar_advancedrifle'},
	{name = 'WEAPON_SPECIALCARBINE', 	bone = 24818, x = 0.10, y = -0.15,     z = 0.0,     xRot = 0.0, yRot = 50.0, zRot = 0.0, category = 'assault', 	model = 'w_ar_specialcarbine'},
	{name = 'WEAPON_BULLPUPRIFLE', 		bone = 24818, x = 65536.0, y = 65536.0, z = 65536.0, xRot = 0.0, yRot = 0.0, zRot = 0.0, category = 'assault', 	model = 'w_ar_bullpuprifle'},
	{name = 'WEAPON_COMPACTRIFLE', 		bone = 24818, x = 65536.0, y = 65536.0, z = 65536.0, xRot = 0.0, yRot = 0.0, zRot = 0.0, category = 'assault', 	model = 'wr_ar_compact'},
	{name = 'WEAPON_SPECIALCARBINE_Mk2', bone = 24818, x = 0.10, y = -0.15,     z = 0.0,     xRot = 0.0, yRot = 50.0, zRot = 0.0, category = 'assault', 	model = 'w_ar_specialcarbinemk2'},


	{name = 'WEAPON_PUMPSHOTGUN', 		bone = 24818, x = 0.1, y = -0.15, z = 0.0, xRot = 0.0, yRot = 135.0, zRot = 0.0, category = 'shotgun', 	model = 'w_sg_pumpshotgun'},
	{name = 'WEAPON_BULLPUPSHOTGUN', 	bone = 24818, x = 0.1, y = -0.15, z = 0.0, xRot = 0.0, yRot = 135.0, zRot = 0.0, category = 'shotgun', 	model = 'w_sg_bullpupshotgun'},
	{name = 'WEAPON_ASSAULTSHOTGUN', 	bone = 24818, x = 0.1, y = -0.15, z = 0.0, xRot = 0.0, yRot = 0.0, zRot = 0.0, category = 'shotgun', 	model = 'w_sg_assaultshotgun'},
	{name = 'WEAPON_MUSKET', 			bone = 24818, x = 0.1, y = -0.15, z = 0.0, xRot = 0.0, yRot = 0.0, zRot = 0.0, category = 'shotgun', 	model = 'w_ar_musket'},
	{name = 'WEAPON_HEAVYSHOTGUN', 		bone = 24818, x = 0.1, y = -0.15, z = 0.0, xRot = 0.0, yRot = 225.0, zRot = 0.0, category = 'shotgun', 	model = 'w_sg_heavyshotgun'},

	{name = 'WEAPON_SNIPERRIFLE', 		bone = 24818, x = 65536.0, y = 65536.0, z = 65536.0, xRot = 0.0, yRot = 0.0, zRot = 0.0, category = 'sniper', 	model = 'w_sr_sniperrifle'},
	{name = 'WEAPON_HEAVYSNIPER', 		bone = 24818, x = 0.1, y = -0.15, z = 0.0, xRot = 0.0, yRot = 135.0, zRot = 0.0, category = 'sniper', 	model = 'w_sr_heavysniper'},
	{name = 'WEAPON_MARKSMANRIFLE', 	bone = 24818, x = 0.1, y = -0.15, z = 0.0, xRot = 0.0, yRot = 135.0, zRot = 0.0, category = 'sniper', 	model = 'w_sr_marksmanrifle'},

	{name = 'WEAPON_FIREEXTINGUISHER', 	bone = 24818, x = 65536.0, y = 65536.0, z = 65536.0, xRot = 0.0, yRot = 0.0, zRot = 0.0, category = 'thrown', 	model = 'w_am_fire_exting'},
	{name = 'WEAPON_PETROLCAN', 		bone = 24818, x = 65536.0, y = 65536.0, z = 65536.0, xRot = 0.0, yRot = 0.0, zRot = 0.0, category = 'thrown', 	model = 'w_am_jerrycan'},

	{name = 'WEAPON_HANDCUFFS', 		bone = 24818, x = 65536.0, y = 65536.0, z = 65536.0, xRot = 0.0, yRot = 0.0, zRot = 0.0, category = 'others', 	model = ''}
}
