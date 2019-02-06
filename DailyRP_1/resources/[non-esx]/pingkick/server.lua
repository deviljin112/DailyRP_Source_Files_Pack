-- CONFIG --

-- Ping Limit
pingLimit = 400

-- CODE --

RegisterServerEvent("checkMyPingBro")
AddEventHandler("checkMyPingBro", function()
	ping = GetPlayerPing(source)
	if ping >= pingLimit then
		DropPlayer(source, "Ping is too high (Limit: " .. pingLimit .. " Your Ping: " .. ping .. ")")
	end
end)