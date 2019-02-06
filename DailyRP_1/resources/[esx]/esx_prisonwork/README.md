# Fängelsejobb
Ett script för att kunna jobba när man sitter inne.
[Video](https://youtu.be/51Cau-kSsrI)
### KRAV

 - [pNotify](https://github.com/Nick78111/pNotify) krävs för notifikationer
 
 - [fivem-ipl](https://github.com/ESX-PUBLIC/fivem-ipl) krävs för att kunna gå in i lagerhuset
 
 - [Fängelse map mod](https://www.gta5-mods.com/maps/jail-stuart688) krävs för att teleporters ska vara på rätt ställe

### Config

 - ```Config.Payment = 10``` hur mycket pengar man får för att packa en låda
 - ```Config.TimeToPackBox = 20``` hur lång tid det tar att packa en låda i sekunder

### Installation

 - Ladda ner alla scripts under krav
 
 - Byt namn från ```esx_prisonwork-master``` till ```esx_prisonwork```
 
 - Lägg in alla scripten i din resources mapp
 
 - Gå in i server.cfg och skriv ``` start esx_prisonwork ```
 
 - För att ändra ställe man tpar till, gå in i esx_prisonwork/client/main.lua och ändra rad 120 & 125 
 
 ``` SetEntityCoords(GetPlayerPed(-1), 1798.39, 2482.91, -123.54) ``` X = 1798.39 Y = 2482.91 Z = -123.54 

# Prisonwork
A script that lets you carry boxes to earn some money when you are in prison.
[Video](https://youtu.be/51Cau-kSsrI)

### REQUIREMENTS

 - [pNotify](https://github.com/Nick78111/pNotify) for notifications
 
 - [fivem-ipl](https://github.com/ESX-PUBLIC/fivem-ipl) to enter the warehouse
 
 - [Prison map mod](https://www.gta5-mods.com/maps/jail-stuart688) for teleporters to work properly

### Config

 - ```Config.Payment = 10``` how much money you earn per box
 - ```Config.TimeToPackBox = 20``` how long time it takes to pack a box in seconds

### Installation

 - Download all scripts under requirements
 
 - Change name from ```esx_prisonwork-master``` to ```esx_prisonwork```
 
 - Extract esx_prisonwork
 
 - Add all scripts to your /resources folder
 
 - Add ``` start esx_fangelsejobb ``` to your server.cfg
 
 - To change location you teleport to, go to esx_prisonwork/client/main.lua and change row 120 & 125 
 
 ``` SetEntityCoords(GetPlayerPed(-1), 1798.39, 2482.91, -123.54) ``` X = 1798.39 Y = 2482.91 Z = -123.54 
