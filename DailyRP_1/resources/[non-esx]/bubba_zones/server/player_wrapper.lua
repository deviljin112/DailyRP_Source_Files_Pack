function CreateWrappedPlayer(identifier, job, name, loadout, lastPosition)
	local self = {}
	self.player       = player
	self.job          = job
	self.name		  = name
	self.loadout      = loadout
	self.lastPosition = lastPosition
	self.identifier   = identifier
	return self
end

function GetIdFromIdentifier(player)
	local players = ESX.GetPlayers()
	for i = 1, #players, 1 do
		local iPlayer = ESX.GetPlayerFromId(players[i])
		if iPlayer.identifier == player.identifier then
			return players[i]
		end
	end
	return 0
end