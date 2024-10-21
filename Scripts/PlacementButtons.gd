extends Node2D

var loaded_names;
var loaded;
var dir = DirAccess;

# Called when the node enters the scene tree for the first time.
func _ready():
	loaded_names=[];
	loaded = dir.get_files_at("res://Sprites/FurnitureButtons");
	for i in range(loaded.size()):
		if(".import" in loaded[i]):
			loaded_names.append(loaded[i].replace(".import",""))

	for item in loaded_names:
		var newButton = TextureButton.new();
		newButton.name = item.replace(".png","");
		newButton.texture_normal=load("res://Sprites/FurnitureButtons/"+item);
		newButton.mouse_filter=Control.MOUSE_FILTER_PASS;
		newButton.pressed.connect(on_button_pressed.bind(newButton.name));
		$"ScrollContainer/HBoxContainer".add_child(newButton);


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if(Global.furniture_edit!=2):
		self.visible=true
	else:
		self.visible=false
	
func on_button_pressed(name):
	if(Global.furniture_edit!=2):
		var loadname = name+"_placeable.tscn";
		var newFurniture = load("res://Scenes/Furniture/"+loadname).instantiate();
		newFurniture.position=Vector2(Global.viewport.x/2,Global.viewport.y/2);
		$"../PlacedFurniture".add_child(newFurniture);
