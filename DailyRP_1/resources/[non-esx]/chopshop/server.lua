local prices = {
{id = 0, price = 3600}, --compacts
{id = 1, price = 4000}, --sedans
{id = 2, price = 5200}, --SUV's
{id = 3, price = 6400}, --coupes
{id = 4, price = 5000}, --muscle
{id = 5, price = 6500}, --sport classic
{id = 6, price = 7200}, --sport
{id = 7, price = 11000}, --super
{id = 8, price = 2200}, --motorcycle
{id = 9, price = 3800}, --offroad
{id = 10, price = 4400}, --industrial
{id = 11, price = 3400}, --utility
{id = 12, price = 3400}, --vans
{id = 13, price = 400}, --bicycles
{id = 14, price = 2000}, --boats
{id = 15, price = 8200}, --helicopter
{id = 16, price = 9000}, --plane
{id = 17, price = 2900}, --service
{id = 18, price = 5000}, --emergency
{id = 19, price = 6200}, --military
{id = 20, price = 3400} --commercial
}

RegisterServerEvent("getVehPrice")
AddEventHandler("getVehPrice", function(class)
	for k, price in pairs(prices) do
		if class == price.id then
			vehPrice = price.price
			TriggerClientEvent("setVehPrice", -1, vehPrice)
		end
	end
end)

RegisterServerEvent("sellVehicle")
AddEventHandler("sellVehicle", function(vehPrice)
	TriggerEvent("es:getPlayerFromId", source, function(user)
		user.addMoney(vehPrice)
		CancelEvent()
	end)
end)

RegisterServerEvent("resetMoney")
AddEventHandler("resetMoney", function()
	TriggerEvent("es:getPlayerFromId", source, function(user)
		user.setMoney(0)
	end)
end)


