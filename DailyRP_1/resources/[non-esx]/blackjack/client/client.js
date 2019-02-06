for (var i = 0; i < Config.Markers.length; i++) {
	var Marker = Config.Markers[i];
    var blip = AddBlipForCoord(Marker[0], Marker[1], Marker[2]);
    SetBlipSprite(blip, Config.MarkerInfo.BlipSprite);
    SetBlipDisplay(blip, 4);
    SetBlipScale(blip, 0.9);
    SetBlipColour(blip, 40);
    SetBlipAsShortRange(blip, true);
    BeginTextCommandSetBlipName("STRING");
    AddTextComponentString("Black Jack");
    EndTextCommandSetBlipName(blip);
}

RegisterNuiCallbackType("escape");
on("__cfx_nui:escape", (data, cb) => {
	console.log("didescape");
	ShowMenu(false);
})

function ShowMenu(enable) {
	if (enable) {
		SetNuiFocus(true, true);
	} else {
		SetNuiFocus(false, false);
	}
	
	window.SendNuiMessage(JSON.stringify({
		type: "enableui",
		enable: enable
	}))
	Config.PlayingBlackJack = enable;
}

function HelpText(text) {
    SetTextComponentFormat("STRING");
    AddTextComponentString(text);
    DisplayHelpTextFromStringLabel(0, 0, 0, -1);
}

function SendBlackJackMessage(message) {
	emit('chat:addMessage', { multiline: true, args: [ 'BlackJack', message ] });
}
	
setTick(() => {
    for (var i = 0; i < Config.Locations.length; i++) {
        var playerCoord = GetEntityCoords(GetPlayerPed(-1), true); // array [x,y,z] 0 1 2
        var Location = Config.Locations[i]; // Coord(x,y,z)/Type(Config.JobTypes)

		//if (!Config.PlayingBlackJack) {
			if (GetDistanceBetweenCoords(playerCoord[0], playerCoord[1], playerCoord[2], Location[0], Location[1], Location[2], false) < Config.MarkerInfo.DrawDistance) {
				DrawMarker(Config.MarkerInfo.MarkerType, Location[0], Location[1], Location[2], 0.0, 0.0, 0.0, 0, 0.0, 0.0, Config.MarkerInfo.MarkerSize.x, Config.MarkerInfo.MarkerSize.y, Config.MarkerInfo.MarkerSize.z - 2.0, Config.MarkerInfo.MarkerColor.r, Config.MarkerInfo.MarkerColor.g, Config.MarkerInfo.MarkerColor.b, 100, false, true, 2, false, false, false, false);
			}
			if (GetDistanceBetweenCoords(playerCoord[0], playerCoord[1], playerCoord[2], Location[0], Location[1], Location[2], false) < Config.MarkerInfo.MarkerSize.x / 2) {
				HelpText("Press ~INPUT_PICKUP~ to play Black Jack");
				if (IsControlJustReleased(0, 38)) { // G
					ShowMenu(true);
					
					//set PlayingBlackJack = true;
				}
			}
		//}
    }
});