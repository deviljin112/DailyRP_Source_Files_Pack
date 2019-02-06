var ConfigObject = function() {
	var self = this;
	
	this.MarkerInfo = {
		MarkerType: 1,
		DrawDistance: 100.0,
		MarkerSize: {x:1.5,y:1.5,z:1.0},
		BlipSprite: 106,
		EnterExitDelay:0,
		EnterExitDelayMax:600,
		MarkerColor: {r : 0, g : 0, b : 0}
	}
	
	this.Markers = [[930.031, 43.287, 81.093]]; // [0,1,2]
	this.Locations = [[930.031, 43.287, 81.093]]; // [0,1,2]

	this.PlayingBlackJack = false;
	
	this.debugMode = true;
}
var Config = new ConfigObject();