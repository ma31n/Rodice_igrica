extends Node2D

func _ready():
	Global.loadHouseState()
	if(Global.houseSave.furniture!=null):
		var temp = Global.houseSave.furniture.instantiate()
		for child in temp.get_children():
			temp.remove_child(child)
			#child.owner=null
			$PlacedFurniture.add_child(child);

func _process(delta):
	pass
