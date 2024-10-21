extends Button


func _on_pressed():
	if(self.name=="Back"):
		
		if(self.get_parent().name=="House1_indoor"):
			saveHouse();
		
		get_tree().change_scene_to_file("res://Scenes/main.tscn");
	elif(self.name=="Customization"):
		get_tree().change_scene_to_file("res://Scenes/customization_scene.tscn");

func saveHouse():
	var save = PackedScene.new()
	var parent = get_parent().find_child("PlacedFurniture");
	for child in parent.get_children():
		child.set_owner(parent);
	save.pack(parent)
	Global.saveHouseState(save);
