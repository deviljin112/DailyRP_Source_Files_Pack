# FXserver-esx_coronergate
FXServer ESX coronergate

First, the initial Jounal script was made by GTAVTRP: https://github.com/GTAVFTRP/journal/ 
Thanks to them for sharing!

I add Hacking fonction and modify the preview.

To access to the Archive Room, One ambulance have to be on town.
An alerte will popup to the ambulance when someone search on the ArchiveRoom

You can change to more ambulance if you want.

Contributor: **Poro#9494** **Pando#0843**

[REQUIREMENTS]

* mhacking => https://forum.fivem.net/t/release-simple-hacking-minigame/62095

* Add item journal on your Database
```
INSERT INTO `items` (`name`, `label`, `limit`) VALUES  
    ('journal', 'Secret Documents', 1)
;
```

[INSTALLATION]

1) CD in your resources/[esx] folder
2) Copy the repository
4) Add this in your server.cfg :

```
start esx_esx_coronergate
```

[Change Document]

If you want to change the picture and so all the information, you juste have to change the link on:esx_coronergate\ui\style.css line 81:

```
background:url("https://i.imgur.com/HaC5Ewa.png") no-repeat center fixed;
```

#Exemple:

https://www.youtube.com/watch?v=48akH7z9dh8
