# esx_eden_boatgarage
Boat Garage based on ESX

I did NOT create the Code. I only edited the code to create this.

This Garage Script only takes into account the Boats Purchased in the Boat Shop. Players can also go to the Boat Pound to retrieve their Boat if its lost or Destroyed for a Fee. During a reboot all Vehicles go back home.

# Requirement:

* Boat Shop
  * esx_boatshop => https://github.com/HumanTree92/esx_boatshop

# Installation

1) CD in your resources/[esx] folder
2) Clone the repository
3) Import eden_boatgarage.sql in your database

4) Add this in your server.cfg :

```
start esx_eden_boatgarage
```

# KNOWN BUG:

- It is Possible to Duplicate Vehicles but do note that if said Person Duplicates a Vehicle & takes 1 of them & sell thems the other one is useless & can NOT be stored or sold.

# How to use my version
To store the Boat in the Garage:
- Pull into the red dot
- Open the menu
- Select Return Vehicle

To take a Boat back out:
- Walk into the green dot
- Open the menu
- Select View Vehicle List

To retrieve a Boat from the Pound:
- Walk into the blue dot
- Open the menu
- Select the Boat from the list

# Credits/Original Code
* snyx95 => https://github.com/snyx95
  * esx_eden_garage => https://github.com/snyx95/esx_eden_garage

# Other
If you like this please check out some of my other stuff like
* esx_aircraftshop => https://github.com/HumanTree92/esx_aircraftshop
* esx_boatshop => https://github.com/HumanTree92/esx_boatshop
* esx_eden_aircraftgarage => https://github.com/HumanTree92/esx_eden_aircraftgarage
* esx_eden_boatgarage => https://github.com/HumanTree92/esx_eden_boatgarage
* esx_eden_garage => https://github.com/HumanTree92/esx_eden_garage
* esx_panicbutton => https://github.com/HumanTree92/esx_panicbutton
