extends Node2D

var test;

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	Global.currentScene = get_tree().current_scene;
	print(test);


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
