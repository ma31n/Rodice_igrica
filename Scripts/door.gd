extends Node2D
@export var roomName = "";
@export var roomSize = "";

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _on_area_2d_input_event(viewport: Node, event: InputEvent, shape_idx: int) -> void:
	if(Input.is_mouse_button_pressed(MOUSE_BUTTON_LEFT) and Global.player.move==0):
		print("IDEMO U SOBU")
		Global.saveHouse()
		var temp = Global.playerSave.houses[0].hallFurniture.instantiate()
		for child in temp.get_children():
			print(child)
		var room = preload("res://Scenes/small_room.tscn").instantiate();
		room.roomname=roomName;
		get_tree().root.add_child(room);
		get_tree().current_scene.queue_free()
		get_tree().current_scene = room;
		Global.currentScene=get_tree().current_scene
		
		
		
