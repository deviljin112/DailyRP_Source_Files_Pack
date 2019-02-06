local function countPlayer() -- count all players
	local counter = 0
	for _ in pairs(GetPlayers()) do
		counter = counter + 1
	end
	return counter
end

RegisterServerEvent('sendSession:PlayerNumber')
AddEventHandler('sendSession:PlayerNumber', function(clientPlayerNumber)
	if source ~= nil then
		serverPlayerNumber = countPlayer()
		if serverPlayerNumber-clientPlayerNumber > 2 then 
			DropPlayer(source, '[Kick] Solo session.') -- Kick player
			print("sendSession:PlayerNumber clientPlayerNumber-"..clientPlayerNumber.." serverPlayerNumber-"..serverPlayerNumber) -- Debug
		end
	end
end)


-- Check for update
local CurrentVersion = [[3.5
]]
PerformHttpRequest('https://raw.githubusercontent.com/chaixshot/fivem/master/solokick/version', function(Error, NewestVersion, Header)
	if CurrentVersion ~= NewestVersion then
		print('\n')
		print('##')
		print('## Solo Kick')
		print('##')
		print('## Current Version: ' .. CurrentVersion)
		print('## Newest Version: ' .. NewestVersion)
		print('##')
		print('## Download')
		print('## https://github.com/chaixshot/fivem/tree/master/solokick')
		print('##')
		print('\n')
	end
end)
