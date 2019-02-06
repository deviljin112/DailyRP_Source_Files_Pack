# esx-qalle-needs

[REQUIREMENTS]
  
* ESX Support
  * esx_basicneeds // for bars etc.
  * esx_status // for bars etc.
  
[INSTALLATION]

1) CD in your resources/[esx] folder

2) Add this in your server.cfg :
``start esx-qalle-needs``

3) Add this into the esx_basicneeds for bars:

	If you're lazy you could download my edited version of basicneeds here ``https://github.com/qalle-fivem/esx_basicneeds`` 

```lua
	--For Shit Bars
	TriggerEvent('esx_status:registerStatus', 'shit', 1000000, '#663300',
		function(status)
			return true
		end,
	function(status)
		status.remove(40)
	end)
	
	--For Pee Bars
	TriggerEvent('esx_status:registerStatus', 'pee', 1000000, '#FFFF00',
		function(status)
			return true
		end,
	function(status)
		status.remove(40)
	end)
```

