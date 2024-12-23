extends Button


func _ready() -> void:
	pass

func _on_pressed():
	if(self.name=="Back"):
		if(Global.currentScene.name=="House1_indoor"):
			Global.saveHouse();
		get_tree().change_scene_to_file("res://Scenes/main.tscn");
		
	elif(self.name=="Customization"):
		get_tree().change_scene_to_file("res://Scenes/customization_scene.tscn");
	
	elif(self.name=="prevRoom"):
		Global.saveRoom(Global.currentScene.roomname)
		get_tree().change_scene_to_file("res://Scenes/house_1_indoor.tscn");
	
