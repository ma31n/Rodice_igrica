extends Node2D
var realname;
var roomname;
var roomSave=null;
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	self.name=realname
	Global.currentScene = get_tree().current_scene;
	loadRoom()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func loadRoom():
	print("UCITAVANJE SOBE")
	var tempo = Global.playerSave.houses[0].hallFurniture.instantiate()
	for child in tempo.get_children():
		print(child)
	if(Global.playerSave.houses.size()>0):
		Global.houseSave.rooms=Global.playerSave.houses[0].rooms
		print("Pronađena kuća, učitajem u kojoj smo sobi!")
		print(Global.houseSave.rooms.keys())
		print(roomname)
		for room in Global.houseSave.rooms.keys():
			print(room)
			if room == roomname:
				roomSave = Global.houseSave.rooms[room]
				print(roomSave)
		
	if(roomSave!=null):
		var temp = roomSave.instantiate()
		for child in temp.get_children():
			temp.remove_child(child)
			child.owner=null
			$PlacedFurniture.add_child(child);
