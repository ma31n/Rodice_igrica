extends Node

var currentapparel = {
	"Hair": "hair1.png",
	"Eyes": "eyes1.png",
	"Mouth": "mouth.png",
	"Upper": "upper1.png"
}

var viewport = 0;

var camera = 0;

var furniture_edit = 2;

var playerSave = PlayerSave.new()
var currentScene;

func savePLayerState(scene):
	playerSave.furniture = scene;
	ResourceSaver.save(playerSave, "user://saveslot.tres");

func loadPlayerState():
	if(is_instance_valid(ResourceLoader.load("user://saveslot.tres"))):
		playerSave = ResourceLoader.load("user://saveslot.tres");
	else:
		ResourceSaver.save(playerSave, "user://saveslot.tres");
