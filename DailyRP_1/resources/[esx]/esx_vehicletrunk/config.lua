Config = {}
Config.DirtyMoney = 'Dirty Cash'
Config.Cash = 'Cash'
Config.MaxItems = 12 --Maximum number of items. BE SURE TO EXTEND CONTENT COLUMN IN YOUR DB.
Config.MaxCount = 180 --absolute maximum for individual item count
Config.MaxDistance = 1.5 --max distance to access trunk
Config.VecOffset = 2.5 --how much behind the car trunk is located. Very cheap way of accomplishing the goal
Config.Radius = 4.5 --How far away to search for vehicles (only for GetClosestVehicle
Config.Ammo = 30 --Ammo to give player on weapon pull
Config.AllowEmpty = false --Allow empty weapons to be stored (no ammo system(too lazy) so you can get ammo by simply adding weapons inside the trunk)
Config.EnableDupeProtection = true --Delete trunk content if trunk was open and player leaves the server
Config.CheckForGlitchedTrunks = false --Release glitched trunks
Config.EnableDebugMarker = false --Debug marker (see github readme img)


Config.LinersTake = {
	"No otat sen nyt silti.",
	"Et osaa tehdä rationaalisia päätöksiä.",
	"Tiedän, että halusit sen kuitenkin.",
	"Älä jaksa...",
	"Siinä. Ei kestä kiittää.",
	"Ole hyvä. Vastalauseita ei kuunnella."
}
Config.LinersAdd = {
	"No haista vittu sitten.",
	"Ei ole tuommoisille tarvettakaan.",
	"Ensin haluat laittaa aseen ja nyt et?",
	"Hermothan tämmösessä vehtaamisessa menee.",
	"Ensikerralla voit jättää kontin suosiolla kiinni.",
}