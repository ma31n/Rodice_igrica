extends Node2D

var houseSave = HouseSave.new()

func _ready():
	Global.currentScene=get_tree().current_scene;
	houseSave.name = self.name;
	loadHouse()

func _process(delta):
	pass
	
func loadHouse():
	if(Global.playerSave.houses.size()>0):
		print("Kuća pronađena, učitana!")
		houseSave = Global.playerSave.houses[0];
	else:
		Global.playerSave.houses.append(houseSave)

		
	if(houseSave.hallFurniture!=null):
		print("Učitajem hallFurniture")
		var temp = houseSave.hallFurniture.instantiate()
		for child in temp.get_children():
			temp.remove_child(child)
			child.owner=null
			$PlacedFurniture.add_child(child);
