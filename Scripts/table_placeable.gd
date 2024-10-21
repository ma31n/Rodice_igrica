extends Area2D

var grabbed = 0;
# Called when the node enters the scene tree for the first time.
func _ready():
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	
	var areas = self.get_overlapping_areas()
	for area in areas:
		if(area.name=="DeleteFurniture"):
			Global.furniture_edit=0;
			grabbed=0;
			self.queue_free()
			break;

func _on_input_event(viewport, event, shape_idx):

	if(Input.is_mouse_button_pressed(MOUSE_BUTTON_LEFT) and (Global.furniture_edit==0 or grabbed==1)):
		Global.furniture_edit=1;
		grabbed=1;
		self.position = get_global_mouse_position();
	elif(Input.is_action_just_released("Tap") and Global.furniture_edit!=2):
		Global.furniture_edit=0;
		grabbed=0;

	
