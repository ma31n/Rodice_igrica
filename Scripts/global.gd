extends Node

var currentapparel = {
	"Hair": "hair1.png",
	"Eyes": "eyes1.png",
	"Mouth": "mouth.png",
	"Upper": "upper1.png"
}

var viewport = 0;

var furniture_edit = 2;

var houseSave = HouseSave.new()

func saveHouseState(scene):
	houseSave.furniture = scene;
	ResourceSaver.save(houseSave, "user://saveslot.tres");

func loadHouseState():
	if(is_instance_valid(ResourceLoader.load("user://saveslot.tres"))):
		houseSave = ResourceLoader.load("user://saveslot.tres");
	else:
		ResourceSaver.save(houseSave, "user://saveslot.tres");
