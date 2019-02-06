RegisterServerEvent("kickForBeingAnAFKDouchebag")
AddEventHandler("kickForBeingAnAFKDouchebag", function()
	DropPlayer(source, "You were AFK for too long.")
end)