extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	Global.currentScene=get_tree().current_scene;

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _notification(what: int) -> void:
	pass
	#if what == NOTIFICATION_WM_CLOSE_REQUEST:
		#Global.savePlayerState();
