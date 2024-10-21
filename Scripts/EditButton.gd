extends TextureButton


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_pressed():
	
	if(Global.furniture_edit==0):
		Global.furniture_edit=2;
		self.texture_normal=load("res://Sprites/UI/edit_button.png");
	else:
		Global.furniture_edit=0;
		self.texture_normal=load("res://Sprites/UI/done_button.png");
		
	print(Global.furniture_edit);
