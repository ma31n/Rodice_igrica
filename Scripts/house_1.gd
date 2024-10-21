extends Area2D


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _on_input_event(viewport, event, shape_idx):
	if(Input.is_mouse_button_pressed(MOUSE_BUTTON_LEFT) and $"../Player".move==0):
		get_tree().change_scene_to_file("res://Scenes/house_1_indoor.tscn");
