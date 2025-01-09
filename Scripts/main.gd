extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	get_tree().set_auto_accept_quit(false)
	Global.currentScene=get_tree().current_scene;
	if(Global.firstTimeLaunch==false):
		Global.loadPlayerState()
		Global.firstTimeLaunch=true;

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Input.is_action_just_pressed("ui_accept"):
		test()


func _on_button_pressed() -> void:
	test()


func test():
	print("TESTIRANJE PRIJE SPREMANJA")
	print(Global.playerSave)
	print("Kuća: "+str(Global.playerSave.houses[0]))
	print("Namještaj u hodniku:")
	var temp = Global.playerSave.houses[0].hallFurniture.instantiate()
	for child in temp.get_children():
		print(child)
		
	print("Količina soba: "+str(Global.playerSave.houses[0].rooms.size()))
	print("Soba: "+str(Global.playerSave.houses[0].rooms["room1"]))
	print(Global.playerSave.houses[0].rooms.keys())
	print("Namještaj u sobi:")
	var temp2 = Global.playerSave.houses[0].rooms["room1"].instantiate()
	for child2 in temp2.get_children():
		print(child2)
