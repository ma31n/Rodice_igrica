extends Node2D

var houseSave = HouseSave.new()

func _ready():
	Global.currentScene=get_tree().current_scene;
	houseSave.name = self.name;
#RADI PROBLEM KAD TRIBA UCITAT PLAYERSTATE IZ NEKE DRUGE SKRIPTE POZIVAJUCI GLOBAL.LOADPLAYERSTATE()
	print(Global.playerSave.houses)
	loadHouseState()

func _process(delta):
	pass
	
func loadHouseState():
	if(Global.playerSave.houses.size()>0):
		houseSave = Global.playerSave.houses[0];
		
	if(houseSave.hallFurniture!=null):
		var temp = houseSave.hallFurniture.instantiate()
		for child in temp.get_children():
			temp.remove_child(child)
			child.owner=null
			$PlacedFurniture.add_child(child);
	
