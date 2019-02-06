local Keys = {
	["ESC"] = 322, ["F1"] = 288, ["F2"] = 289, ["F3"] = 170, ["F5"] = 166, ["F6"] = 167, ["F7"] = 168, ["F8"] = 169, ["F9"] = 56, ["F10"] = 57, 
	["~"] = 243, ["1"] = 157, ["2"] = 158, ["3"] = 160, ["4"] = 164, ["5"] = 165, ["6"] = 159, ["7"] = 161, ["8"] = 162, ["9"] = 163, ["-"] = 84, ["="] = 83, ["BACKSPACE"] = 177, 
	["TAB"] = 37, ["Q"] = 44, ["W"] = 32, ["E"] = 38, ["R"] = 45, ["T"] = 245, ["Y"] = 246, ["U"] = 303, ["P"] = 199, ["["] = 39, ["]"] = 40, ["ENTER"] = 18,
	["CAPS"] = 137, ["A"] = 34, ["S"] = 8, ["D"] = 9, ["F"] = 23, ["G"] = 47, ["H"] = 74, ["K"] = 311, ["L"] = 182,
	["LEFTSHIFT"] = 21, ["Z"] = 20, ["X"] = 73, ["C"] = 26, ["V"] = 0, ["B"] = 29, ["N"] = 249, ["M"] = 244, [","] = 82, ["."] = 81,
	["LEFTCTRL"] = 36, ["LEFTALT"] = 19, ["SPACE"] = 22, ["RIGHTCTRL"] = 70, 
	["HOME"] = 213, ["PAGEUP"] = 10, ["PAGEDOWN"] = 11, ["DELETE"] = 178,
	["LEFT"] = 174, ["RIGHT"] = 175, ["TOP"] = 27, ["DOWN"] = 173,
	["NENTER"] = 201, ["N4"] = 108, ["N5"] = 60, ["N6"] = 107, ["N+"] = 96, ["N-"] = 97, ["N7"] = 117, ["N8"] = 61, ["N9"] = 118
}

ESX                             = nil

local GUI                       = {}
GUI.Time                        = 0




local options = {
 x = 0.900,
    y = 0.32,
    width = 0.2,
    height = 0.04,
    scale = 0.4,
    font = 2,
    menu_title = "Démarches",
    menu_subtitle = "Categories",
    color_r = 100,
    color_g = 130,
    color_b = 130,
}

function DemarchesMenu()
    ped = GetPlayerPed(-1);
	options.menu_subtitle = "Categories"
    ClearMenu()	
	Menu.addButton("~b~Humeurs", "demHumeurs", nil)
	Menu.addButton("~b~Attitudes", "demAttitudes", nil)
    Menu.addButton("~b~Autres", "demAutres", nil)
	Menu.addButton("~b~Spécial Femmes", "demFemmes", nil)
    Menu.addButton("~c~---------------------------", "quitter", nil)
    Menu.addButton("~o~Quitter", "quitter", nil)
end




function demHumeurs()
    options.menu_subtitle = "Humeurs"
    ClearMenu()
							Menu.addButton("Determiné", 	"humeurs1",nil)
							Menu.addButton("Triste",      	"humeurs2",nil)
							Menu.addButton("Depression", 	"humeurs4",nil)
							Menu.addButton("Enervé",  		"humeurs5",nil)
							Menu.addButton("Pressé",		"humeurs6",nil)
							Menu.addButton("Timide", 		"humeurs9",nil)
							Menu.addButton("Lunatique",  	"humeurs10",nil)
							Menu.addButton("Stressé",  		"humeurs11",nil)
							Menu.addButton("Flemme",    	"humeurs12",nil)

							Menu.addButton("~c~---------------------------", "DemarchesMenu", nil)
							Menu.addButton("~r~Reset", "reset", nil)
end




							function humeurs1()
								local pid = PlayerPedId()
	
								if not IsPedSittingInAnyVehicle(pid) then
								RequestAnimSet("move_m@brave")
								while (not HasAnimSetLoaded("move_m@brave")) do Citizen.Wait(0) end
								SetPedMovementClipset(GetPlayerPed(-1), "move_m@brave", -1)	
								
		
								end
	
							end

							function humeurs2()
								local pid = PlayerPedId()
	
								if not IsPedSittingInAnyVehicle(pid) then
								RequestAnimSet("move_m@sad@a")
								while (not HasAnimSetLoaded("move_m@sad@a")) do Citizen.Wait(0) end
								SetPedMovementClipset(GetPlayerPed(-1), "move_m@sad@a", -1)	

		
								end
							end

							
							
	
							
							function humeurs4()
								local pid = PlayerPedId()
	
								if not IsPedSittingInAnyVehicle(pid) then
								RequestAnimSet("move_m@depressed@a")
								while (not HasAnimSetLoaded("move_m@depressed@a")) do Citizen.Wait(0) end
								SetPedMovementClipset(GetPlayerPed(-1), "move_m@depressed@a", -1)	

		
								end
	
							end
							
							function humeurs5()
								local pid = PlayerPedId()
	
								if not IsPedSittingInAnyVehicle(pid) then
								RequestAnimSet("move_characters@michael@fire")
								while (not HasAnimSetLoaded("move_characters@michael@fire")) do Citizen.Wait(0) end
								SetPedMovementClipset(GetPlayerPed(-1), "move_characters@michael@fire", -1)	

		
								end
	
							end
							
							
							function humeurs6()
								local pid = PlayerPedId()
	
								if not IsPedSittingInAnyVehicle(pid) then
								RequestAnimSet("move_m@quick")
								while (not HasAnimSetLoaded("move_m@quick")) do Citizen.Wait(0) end
								SetPedMovementClipset(GetPlayerPed(-1), "move_m@quick", -1)	

		
								end
	
							end
							
							
						
							
							
							function humeurs9()
								local pid = PlayerPedId()
	
								if not IsPedSittingInAnyVehicle(pid) then
								RequestAnimSet("move_m@confident")
								while (not HasAnimSetLoaded("move_m@confident")) do Citizen.Wait(0) end
								SetPedMovementClipset(GetPlayerPed(-1), "move_m@confident", -1)	

		
								end
	
							end
							
							
							function humeurs10()
								local pid = PlayerPedId()
	
								if not IsPedSittingInAnyVehicle(pid) then
								RequestAnimSet("move_m@casual@b")
								while (not HasAnimSetLoaded("move_m@casual@b")) do Citizen.Wait(0) end
								SetPedMovementClipset(GetPlayerPed(-1), "move_m@casual@b", -1)	

		
								end
	
							end
							
							
							function humeurs11()
								local pid = PlayerPedId()
	
								if not IsPedSittingInAnyVehicle(pid) then
								RequestAnimSet("move_m@hurry@a")
								while (not HasAnimSetLoaded("move_m@hurry@a")) do Citizen.Wait(0) end
								SetPedMovementClipset(GetPlayerPed(-1), "move_m@hurry@a", -1)	

		
								end
	
							end
							
							
							function humeurs12()
								local pid = PlayerPedId()
	
								if not IsPedSittingInAnyVehicle(pid) then
								RequestAnimSet("move_characters@jimmy@slow@")
								while (not HasAnimSetLoaded("move_characters@jimmy@slow@")) do Citizen.Wait(0) end
								SetPedMovementClipset(GetPlayerPed(-1), "move_characters@jimmy@slow@", -1)	

		
								end
	
							end

		
							


function demAttitudes()
    options.menu_subtitle = "Attitudes"
    ClearMenu()
					Menu.addButton("Hautain",    						"attitude1",nil)
					Menu.addButton("Bad Boy",             				"attitude2",nil)
					Menu.addButton("Gangster",							"attitude3",nil)
					Menu.addButton("Fraquassé",							"attitude4",nil)
					Menu.addButton("Coquille vide",    					"attitude5",nil)
					Menu.addButton("Coincé",             				"attitude6",nil)
					Menu.addButton("Perdu",             				"attitude9",nil)
					Menu.addButton("Intimidant",						"attitude10",nil)
					Menu.addButton("Richissime",    					"attitude11",nil)
					Menu.addButton("Hargneux",							"attitude12",nil)
					Menu.addButton("Imposant",							"attitude13",nil)
					Menu.addButton("Frimeur",			"attitude14",nil)

					Menu.addButton("~c~---------------------------", "DemarchesMenu", nil)
					Menu.addButton("~r~Reset",								"reset", nil)

end

							function attitude1()
								local pid = PlayerPedId()
	
								if not IsPedSittingInAnyVehicle(pid) then
								RequestAnimSet("move_m@business@a")
								while (not HasAnimSetLoaded("move_m@business@a")) do Citizen.Wait(0) end
								SetPedMovementClipset(GetPlayerPed(-1), "move_m@business@a", -1)	

		
								end
	
							end

							function attitude2()
								local pid = PlayerPedId()
	
								if not IsPedSittingInAnyVehicle(pid) then
								RequestAnimSet("move_m@casual@d")
								while (not HasAnimSetLoaded("move_m@casual@d")) do Citizen.Wait(0) end
								SetPedMovementClipset(GetPlayerPed(-1), "move_m@casual@d", -1)	

		
								end
							end

							
							
							function attitude3()
								local pid = PlayerPedId()
	
								if not IsPedSittingInAnyVehicle(pid) then
								RequestAnimSet("move_m@casual@e")
								while (not HasAnimSetLoaded("move_m@casual@e")) do Citizen.Wait(0) end
								SetPedMovementClipset(GetPlayerPed(-1), "move_m@casual@e", -1)	

		
								end
	
							end
							
							function attitude4()
								local pid = PlayerPedId()
	
								if not IsPedSittingInAnyVehicle(pid) then
								RequestAnimSet("move_m@buzzed")
								while (not HasAnimSetLoaded("move_m@buzzed")) do Citizen.Wait(0) end
								SetPedMovementClipset(GetPlayerPed(-1), "move_m@buzzed", -1)	

		
								end
	
							end
							
							function attitude5()
								local pid = PlayerPedId()
	
								if not IsPedSittingInAnyVehicle(pid) then
								RequestAnimSet("move_m@depressed@b")
								while (not HasAnimSetLoaded("move_m@depressed@b")) do Citizen.Wait(0) end
								SetPedMovementClipset(GetPlayerPed(-1), "move_m@depressed@b", -1)	

		
								end
	
							end

							function attitude6()
								local pid = PlayerPedId()
	
								if not IsPedSittingInAnyVehicle(pid) then
								RequestAnimSet("move_m@sassy")
								while (not HasAnimSetLoaded("move_m@sassy")) do Citizen.Wait(0) end
								SetPedMovementClipset(GetPlayerPed(-1), "move_m@sassy", -1)	

		
								end
							end

							
							
						
					
							
								
							

							function attitude9()
								local pid = PlayerPedId()
	
								if not IsPedSittingInAnyVehicle(pid) then
								RequestAnimSet("move_m@hobo@b")
								while (not HasAnimSetLoaded("move_m@hobo@b")) do Citizen.Wait(0) end
								SetPedMovementClipset(GetPlayerPed(-1), "move_m@hobo@b", -1)	

		
								end
							end

							
							
							function attitude10()
								local pid = PlayerPedId()
	
								if not IsPedSittingInAnyVehicle(pid) then
								RequestAnimSet("move_m@intimidation@1h")
								while (not HasAnimSetLoaded("move_m@intimidation@1h")) do Citizen.Wait(0) end
								SetPedMovementClipset(GetPlayerPed(-1), "move_m@intimidation@1h", -1)	

		
								end
	
							end
						
							
							function attitude11()
								local pid = PlayerPedId()
	
								if not IsPedSittingInAnyVehicle(pid) then
								RequestAnimSet("move_m@money")
								while (not HasAnimSetLoaded("move_m@money")) do Citizen.Wait(0) end
								SetPedMovementClipset(GetPlayerPed(-1), "move_m@money", -1)	

		
								end
	
							end

							

							
							
							function attitude12()
								local pid = PlayerPedId()
	
								if not IsPedSittingInAnyVehicle(pid) then
								RequestAnimSet("move_m@fire")
								while (not HasAnimSetLoaded("move_m@fire")) do Citizen.Wait(0) end
								SetPedMovementClipset(GetPlayerPed(-1), "move_m@fire", -1)	

		
								end
	
							end
							
							function attitude13()
								local pid = PlayerPedId()
	
								if not IsPedSittingInAnyVehicle(pid) then
								RequestAnimSet("move_m@gangster@generic")
								while (not HasAnimSetLoaded("move_m@gangster@generic")) do Citizen.Wait(0) end
								SetPedMovementClipset(GetPlayerPed(-1), "move_m@gangster@generic", -1)	

		
								end
	
							end
							
								function attitude14()
								local pid = PlayerPedId()
	
								if not IsPedSittingInAnyVehicle(pid) then
								RequestAnimSet("move_m@swagger")
								while (not HasAnimSetLoaded("move_m@swagger")) do Citizen.Wait(0) end
								SetPedMovementClipset(GetPlayerPed(-1), "move_m@swagger", -1)	

		
								end
	
							end
							
							

function demAutres()
    options.menu_subtitle = "Autres"
    ClearMenu()
					Menu.addButton("Randonneur",		"autres1",nil)
					Menu.addButton("Blessé",    		"autres2",nil)
					Menu.addButton("Obèse",				"autres3",nil)
					Menu.addButton("Mal aux fesses", 	"autres4",nil)
					Menu.addButton("Detente",		"autres6",nil)


					Menu.addButton("~c~---------------------------", "DemarchesMenu", nil)
					Menu.addButton("~r~Reset",							"reset", nil)

end


							function autres1()
								local pid = PlayerPedId()
	
								if not IsPedSittingInAnyVehicle(pid) then
								RequestAnimSet("move_m@hiking")
								while (not HasAnimSetLoaded("move_m@hiking")) do Citizen.Wait(0) end
								SetPedMovementClipset(GetPlayerPed(-1), "move_m@hiking", -1)	

		
								end
	
							end

							function autres2()
								local pid = PlayerPedId()
	
								if not IsPedSittingInAnyVehicle(pid) then
								RequestAnimSet("move_m@injured")
								while (not HasAnimSetLoaded("move_m@injured")) do Citizen.Wait(0) end
								SetPedMovementClipset(GetPlayerPed(-1), "move_m@injured", -1)	

		
								end
							end

							
							
							function autres3()
								local pid = PlayerPedId()
	
								if not IsPedSittingInAnyVehicle(pid) then
								RequestAnimSet("move_m@fat@a")
								while (not HasAnimSetLoaded("move_m@fat@a")) do Citizen.Wait(0) end
								SetPedMovementClipset(GetPlayerPed(-1), "move_m@fat@a", -1)	

		
								end
	
							end
							
							function autres4()
								local pid = PlayerPedId()
	
								if not IsPedSittingInAnyVehicle(pid) then
								RequestAnimSet("move_characters@orleans@core@")
								while (not HasAnimSetLoaded("move_characters@orleans@core@")) do Citizen.Wait(0) end
								SetPedMovementClipset(GetPlayerPed(-1), "move_characters@orleans@core@", -1)	

		
								end
	
							end
							
							
						
							
							function autres6()
								local pid = PlayerPedId()
	
								if not IsPedSittingInAnyVehicle(pid) then
								RequestAnimSet("move_m@swagger@b")
								while (not HasAnimSetLoaded("move_m@swagger@b")) do Citizen.Wait(0) end
								SetPedMovementClipset(GetPlayerPed(-1), "move_m@swagger@b", -1)	

		
								end
	
							end
							
							function demFemmes()
    options.menu_subtitle = "Special Femmes"
    ClearMenu()
					Menu.addButton('Arrogante',    						"femmes1",nil)
					Menu.addButton('Classique',							"femmes3",nil)
					Menu.addButton('Fragile',             			"femmes5",nil)
					Menu.addButton('Enervée',							"femmes6",nil)
					Menu.addButton('Femme fatale',             				"femmes8",nil)
					Menu.addButton('Fuite',    							"femmes10",nil)
					Menu.addButton('Tristesse',             			"femmes11",nil)
					Menu.addButton('Rebelle',							"femmes12",nil)
					Menu.addButton('Serieuse',    							"femmes13",nil)
					Menu.addButton('Roule des fesses',             				"femmes14",nil)
					Menu.addButton('Hautaine',							"femmes15",nil)
					Menu.addButton("~c~---------------------------", "DemarchesMenu", nil)
					Menu.addButton('~r~Reset',							"reset", nil)

end

							function femmes1()
								local pid = PlayerPedId()
	
								if not IsPedSittingInAnyVehicle(pid) then
								RequestAnimSet("move_f@arrogant@a")
								while (not HasAnimSetLoaded("move_f@arrogant@a")) do Citizen.Wait(0) end
								SetPedMovementClipset(GetPlayerPed(-1), "move_f@arrogant@a", -1)	

			
								end
	
							end

							
							
							
							function femmes3()
								local pid = PlayerPedId()
	
								if not IsPedSittingInAnyVehicle(pid) then
								RequestAnimSet("move_characters@amanda@bag")
								while (not HasAnimSetLoaded("move_characters@amanda@bag")) do Citizen.Wait(0) end
								SetPedMovementClipset(GetPlayerPed(-1), "move_characters@amanda@bag", -1)	

		
								end
	
							end
							
							
							function femmes5()
								local pid = PlayerPedId()
	
								if not IsPedSittingInAnyVehicle(pid) then
								RequestAnimSet("move_f@femme@")
								while (not HasAnimSetLoaded("move_f@femme@")) do Citizen.Wait(0) end
								SetPedMovementClipset(GetPlayerPed(-1), "move_f@femme@", -1)	

		
								end
	
							end
							
							
							function femmes6()
								local pid = PlayerPedId()
	
								if not IsPedSittingInAnyVehicle(pid) then
								RequestAnimSet("move_f@gangster@ng")
								while (not HasAnimSetLoaded("move_f@gangster@ng")) do Citizen.Wait(0) end
								SetPedMovementClipset(GetPlayerPed(-1), "move_f@gangster@ng", -1)	

		
								end
	
							end
							
						
							
							
							
							function femmes8()
								local pid = PlayerPedId()
	
								if not IsPedSittingInAnyVehicle(pid) then
								RequestAnimSet("move_f@heels@c")
								while (not HasAnimSetLoaded("move_f@heels@c")) do Citizen.Wait(0) end
								SetPedMovementClipset(GetPlayerPed(-1), "move_f@heels@c", -1)	

		
								end
	
							end
							
							
							
							
							
							function femmes10()
								local pid = PlayerPedId()
	
								if not IsPedSittingInAnyVehicle(pid) then
								RequestAnimSet("move_f@hurry@b")
								while (not HasAnimSetLoaded("move_f@hurry@b")) do Citizen.Wait(0) end
								SetPedMovementClipset(GetPlayerPed(-1), "move_f@hurry@b", -1)	

		
								end
	
							end
							
							
							function femmes11()
								local pid = PlayerPedId()
	
								if not IsPedSittingInAnyVehicle(pid) then
								RequestAnimSet("move_f@sad@a")
								while (not HasAnimSetLoaded("move_f@sad@a")) do Citizen.Wait(0) end
								SetPedMovementClipset(GetPlayerPed(-1), "move_f@sad@a", -1)	

		
								end
	
							end
							
							
							function femmes12()
								local pid = PlayerPedId()
	
								if not IsPedSittingInAnyVehicle(pid) then
								RequestAnimSet("move_f@sassy")
								while (not HasAnimSetLoaded("move_f@sassy")) do Citizen.Wait(0) end
								SetPedMovementClipset(GetPlayerPed(-1), "move_f@sassy", -1)	

		
								end
	
							end
							
							function femmes13()
								local pid = PlayerPedId()
	
								if not IsPedSittingInAnyVehicle(pid) then
								RequestAnimSet("move_f@sexy@a")
								while (not HasAnimSetLoaded("move_f@sexy@a")) do Citizen.Wait(0) end
								SetPedMovementClipset(GetPlayerPed(-1), "move_f@sexy@a", -1)	

		
								end
	
							end
							
							
							function femmes14()
								local pid = PlayerPedId()
	
								if not IsPedSittingInAnyVehicle(pid) then
								RequestAnimSet("move_f@tough_guy@")
								while (not HasAnimSetLoaded("move_f@tough_guy@")) do Citizen.Wait(0) end
								SetPedMovementClipset(GetPlayerPed(-1), "move_f@tough_guy@", -1)	

		
								end
	
							end
							
							
							function femmes15()
								local pid = PlayerPedId()
	
								if not IsPedSittingInAnyVehicle(pid) then
								RequestAnimSet("move_f@tool_belt@a")
								while (not HasAnimSetLoaded("move_f@tool_belt@a")) do Citizen.Wait(0) end
								SetPedMovementClipset(GetPlayerPed(-1), "move_f@tool_belt@a", -1)	

		
								end
	
							end



		  	
	


function reset()
local pid = PlayerPedId()
ResetPedMovementClipset(GetPlayerPed(-1), 0)
quitter()
end

function quitter ()
Menu.hidden = true
end



-- Key Controls


Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)
		if IsControlJustPressed(1, Keys["BACKSPACE"]) then -- Si touche retour on cache
			Menu.hidden = true
		end
		Menu.renderGUI(options) -- Draw menu on each tick if Menu.hidden = false
    end
end)

function openMarches()
	DemarchesMenu()
	Menu.hidden = not Menu.hidden
end