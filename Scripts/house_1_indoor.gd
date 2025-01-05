extends Node2D

func _ready():
	Global.currentScene=get_tree().current_scene;
	Global.houseSave.name = self.name;
	loadHouse()
	print(Global.playerSave.houses[0].rooms.keys())

func _process(delta):
	pass
	
func loadHouse():
	if(Global.playerSave.houses.size()>0):
		print("Kuća pronađena, učitana!")
		Global.houseSave = Global.playerSave.houses[0];
	else:
		Global.playerSave.houses.append(HouseSave.new())

		
	if(Global.houseSave.hallFurniture!=null):
		print("Učitajem hallFurniture")
		var temp = Global.houseSave.hallFurniture.instantiate()
		for child in temp.get_children():
			temp.remove_child(child)
			child.owner=null
			$PlacedFurniture.add_child(child);
