extends Button


func _ready() -> void:
	pass

func _on_pressed():
	if(self.name=="Back"):
		
		if(Global.currentScene.name=="House1_indoor"):
			saveHouse();
		
		get_tree().change_scene_to_file("res://Scenes/main.tscn");
	elif(self.name=="Customization"):
		get_tree().change_scene_to_file("res://Scenes/customization_scene.tscn");

func saveHouse():
	var save = PackedScene.new()
	var parent = Global.currentScene.find_child("PlacedFurniture");
	for child in parent.get_children():
		child.set_owner(parent);
	save.pack(parent)
	
	var houseSave = HouseSave.new();
	houseSave.hallFurniture=save;
	print(Global.playerSave.houses)
	if(Global.playerSave.houses.size()<1): 
		Global.playerSave.houses.append(houseSave);
	else:
		Global.playerSave.houses[0]=houseSave;
		
	print(Global.playerSave.houses);
	
