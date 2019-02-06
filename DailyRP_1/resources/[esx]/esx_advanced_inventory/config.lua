Config	=	{}

 -- Limit, unit can be whatever you want. Originally grams (as average people can hold 25kg)
Config.Limit = 25000

-- Default weight for an item:
	-- weight == 0 : The item do not affect character inventory weight
	-- weight > 0 : The item cost place on inventory
	-- weight < 0 : The item add place on inventory. Smart people will love it.
Config.DefaultWeight = 0 

-- WIP Holding more and more stuff make you slower and slower (Do not work at this time.. Try some native, look at client/main.lua)
Config.userSpeed = false

-- TODO, see server/main.lua
--Config.Config.BagIsSkin = true

-- If true, ignore rest of file
Config.WeightSqlBased = true

-- I Prefer to edit weight on the config.lua and I have switched Config.WeightSqlBased to false:
Config.localWeight = {
	
    alive_chicken = 1000,
    bangade = 10,
    barszcz = 500,
    beer = 200,
    blackberry = 270,
    blowpipe = 10000,
    bolcacahuetes = 200,
    bolchips = 200,
    bolnoixcajou = 200,
    bolpistache = 200,
    bread = 200,
    carokit = 3000,
    carotool = 3000,
    chocolate = 200,
    cigarett = 10,
    cisowianka = 200,
    clothe = 2000,
    cocacola = 200,
    coke = 50,
    coke_pooch = 100,
    copper = 200,
    croquettes = 200,
    cupcake = 200,
    cutted_wood = 200,
    diamond = 200,
    drill = 10000,
    drpepper = 200,
    energy = 200,
    essence = 200,
    fabric = 200,
    fish = 200,
    fixkit = 5000,
    fixtool = 5000,
    gazbottle = 5000,
    gold = 200,
    golem = 200,
    gps = 200,
    grand_cru = 1000,
    grapperaisin = 1000,
    hamburger = 200,
    ice = 200,
    icetea = 200,
    iron = 200,
    jager = 200,
    jagerbomb = 200,
    jagercerbere = 200,
    jus_raisin = 500,
    jusfruit = 200,
    kebab = 200,
    lighter = 200,
    limonade = 200,
    martini = 200,
    medikit = 500,
    menthe = 200,
    meth = 50,
    meth_pooch = 100,
    metreshooter = 200,
    milk = 200,
    mixapero = 200,
    mojito = 200,
    opium = 5000,
    opium_pooch = 10000,
    packaged_chicken = 500,
    packaged_plank = 5000,
    petrol = 1,
    petrol_raffin = 1000,
    pizza = 200, 
    raisin = 150,
    rebull = 200,
    rhum = 200,
    rhumcoca = 200,
    rhumfruit = 200,
    sandwich = 200,
    saucisson = 200,
    schabowy = 200,
    slaughtered_chicken = 500,
    soda = 200,
    spaghetti = 200,
    stone = 1500,
    teqpaf = 200,
    tequilla = 200,
    vine = 150,
    vodka = 200,
    vodkaenergy = 200,
    vodkafruit = 200,
    washed_stone = 1500,
    water = 200,
    weed = 50,
    weed_pooch = 100,
    whisky = 200,
    whiskycoca = 200,
    whool = 200,
    wine = 150,
    wrap = 200,
    xanax = 200,

    WEAPON_COMBATPISTOL = 50, -- waga amunicji
    WEAPON_PISTOL = 50,
    WEAPON_MICROSMG = 50,
    WEAPON_CARBINERIFLE = 50,
    WEAPON_PISTOL50 = 50,
    WEAPON_VINTAGEPISTOL = 50,
    WEAPON_REVOLVER = 50,
    WEAPON_SAWNOFFSHOTGUN = 50,
    WEAPON_ADVANCEDRIFLE = 50,
    WEAPON_SWITCHBLADE = 50,
    WEAPON_MARKSMANRIFLE = 50,
    WEAPON_STUNGUN = 50,

	black_money = 1, -- poids pour un argent
}
