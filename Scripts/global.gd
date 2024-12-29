extends Node

var player;
var delay = 100000;
var currentapparel = {
	"Hair": "hair1.png",
	"Eyes": "eyes1.png",
	"Mouth": "mouth.png",
	"Upper": "upper1.png"
}

signal closing;

var viewport = 0;

var camera = 0;

var furniture_edit = 2;

var playerSave = PlayerSave.new();
var houseSave = HouseSave.new();

var currentScene;

func savePlayerState():
	ResourceSaver.save(playerSave, "user://saveslot.tres");

func loadPlayerState():
	if(is_instance_valid(ResourceLoader.load("user://saveslot.tres"))):
		playerSave = ResourceLoader.load("user://saveslot.tres");	
	else:
		savePlayerState()

func saveHouse():
	var save = PackedScene.new()
	var parent = currentScene.find_child("PlacedFurniture");
	for child in parent.get_children():
		child.set_owner(parent);
		child.disconnect("input_event", Callable(child, "_on_input_event"))
	save.pack(parent)

	houseSave.hallFurniture=save;
	if(playerSave.houses.size()<1): 
		print("first save house!")
		playerSave.houses.append(houseSave);
	else:
		playerSave.houses[0]=houseSave;
		print("existing save house")

func saveRoom(roomname):
	var save = PackedScene.new()
	var parent = currentScene.find_child("PlacedFurniture");
	for child in parent.get_children():
		child.set_owner(parent);
		child.disconnect("input_event", Callable(child, "_on_input_event"))
	save.pack(parent)

	houseSave.rooms[roomname]=save;

func _physics_process(delta: float) -> void:
	#ODE MOZES STAVIT CURRENTSCENE = GET_TREE().CURRENT_SCENE ZA POJEDNOSTAVNIT KOD
	pass


func _notification(what: int) -> void:

	if what == NOTIFICATION_WM_CLOSE_REQUEST or what == NOTIFICATION_APPLICATION_PAUSED:
		print("CLOSING GAME")
		if(currentScene.name=="House1_indoor"):
			saveHouse()
		elif("room" in currentScene.name):
			saveRoom(currentScene.roomname)
			get_tree().change_scene_to_file("res://Scenes/house_1_indoor.tscn");
			saveHouse()
		Global.savePlayerState() 
		while(delay!=0):
			delay=delay-1
		get_tree().quit()
