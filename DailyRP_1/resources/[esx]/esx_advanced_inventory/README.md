# fxserver-esx_advanced_inventory
FXserver ESX Advanced Inventory

[REQUIREMENTS]

  * es_extended => https://github.com/ESX-Org/es_extended


  [WIP]
* Slow ped when carrying more than 50% of maxWeight

  [TODO]
* Add bag support (lot of comment, look at the code)
  
  [INSTALLATION]

1) CD in your resources/[esx] folder
2) Clone the repository
```
git clone https://github.com/Sylundef/esx_advanced_inventory
```
3) * Import esx_advanced_inventory.sql in your database

4) Add this in your server.cfg :

```
start esx_advanced_inventory
```

[FEATURES]
* Default weight.
* File based or Sql based.
* Negative weight support
