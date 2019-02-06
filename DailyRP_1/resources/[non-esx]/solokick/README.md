If you use deferrals, you must add "DropPlayer" 

```
AddEventHandler("playerConnecting",function(name,setMessage, deferrals)
	deferrals.defer()

	DropPlayer( source,"No steam login." )
	Citizen.Wait(1000)
	deferrals.done("No steam login" )
end)
```
