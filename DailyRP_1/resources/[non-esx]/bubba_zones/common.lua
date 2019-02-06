function IsGangMember(player)
	local isGangMember = false
	for k,v in pairs(Gangs) do
		if player.job ~= nil and player.job.name ~= nil and player.job.name == v then
			isGangMember = true
		elseif player.job == v then
			isGangMember = true
		end
	end
	return isGangMember
end

function IsOwner(zone, player)
	if zone.owner ~= nil then
		if zone.owner.identifier == player.identifier then
			return true
		elseif IsGangMember(player) and zone.owner.job.name == player.job.name then
			return true
		end
	end
	return false
end