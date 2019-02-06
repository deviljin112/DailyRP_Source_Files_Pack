## ESX_HOSPITAL
This resource allows medics (or police when medics not online) to place a player in the hospital.  There are 3 beds available in case you have more than one victim.  This resource is for RP purposes and does not actually heal or revive anyone.
<br>
This resource forces the player to stay in bed for their entire stay.  If they try to get out of bed too many times, they will be forced to stay longer.
<br>
This resource also stops combat logging using MySQL.  So when you put someone in the hospital and they relog to try to shorten their hospital stay, they will be force to continue their hospital stay.
<br>
## Original Credits
The original script was created by Albo1125.  Then edited to be database driven to stop combat loggers by SSPU1W as well as include a fine system and pNotify.  The original script by Albo1125 can be found here - https://forum.fivem.net/t/release-fx-jailer-1-1-0-0/41963 and the modified version of his by SSPU1W can be found here- https://forum.fivem.net/t/release-esx-database-jail-script-with-pnotify-no-more-combat-logging/69556.  Finally, edited by myself to force hospital stay to RP healing time.
<br>
## Required Dependencies
>[pNotify](https://forum.fivem.net/t/release-pnotify-in-game-js-notifications-using-noty/20659)
>[MySQL Async](https://forum.fivem.net/t/release-mysql-async-library-v3-0-0-fxserver/21881)
>MySQL Database

## Installation

- Simply upload esx_hospital to your **resources** folder
- In your **server.cfg** add:
- start esx_hospital
- import the **hospital.sql** to your database

## Edits

server.lua
<br>
Find:
<br>
**if xPlayer.job.name == 'police' or  xPlayer.job.name == 'fire' then**<br>
on lines 19, 32, 70, 108, and 131.<br>
Change **'fire'** to your EMT job name.

## Usage

- bed1 PlayerID Minutes
- bed2 PlayerID Minutes
- bed3 PlayerID Minutes

**NOTE**

It is very important you do your time in **MINUTES** and not seconds.  If you put in 120 for the time, you will hospitalize them for 120 minutes when you intended to only put them in the hospital for 2 minutes.<br>

**/NOTE**

<br>

For those not using ESX or VRP, to charge your player for the hospital bill:<br>

/hbill PlayerID Amount


## Known Issue

None 
