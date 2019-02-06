TriggerEvent('es:addCommand', 'hat', function(source, args, user)
	TriggerClientEvent('haton', source, {})
end, {help = "Put on your hat"})

TriggerEvent('es:addCommand', 'glasses', function(source, args, user)
	TriggerClientEvent('glasses', source, {})
end, {help = "Put on your sunglasses on"})
