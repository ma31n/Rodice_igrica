extends Node2D

var roomname;
var roomSave=null;
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	Global.currentScene = get_tree().current_scene;
	loadRoom()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func loadRoom():
	if(Global.playerSave.houses.size()>0):
		for room in Global.houseSave.rooms.keys():
			if room == roomname:
				roomSave = Global.houseSave.rooms[room]
				print(roomSave)
		
	if(roomSave!=null):
		var temp = roomSave.instantiate()
		for child in temp.get_children():
			temp.remove_child(child)
			child.owner=null
			$PlacedFurniture.add_child(child);
