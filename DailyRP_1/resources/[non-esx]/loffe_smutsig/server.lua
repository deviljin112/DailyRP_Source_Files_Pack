RegisterServerEvent('loffe_smutsig:sync')
AddEventHandler('loffe_smutsig:sync', function(player, sync, x, y, z)
	if sync == 'flugor' then
		TriggerClientEvent('loffe_smutsig:syncFlugor', -1, player)
	elseif sync == 'vatten' then
		TriggerClientEvent('loffe_smutsig:syncVatten', -1, player, x, y, z)
	elseif sync == 'spya' then
		TriggerClientEvent('loffe_smutsig:syncSpya', -1, player)
	end
end)