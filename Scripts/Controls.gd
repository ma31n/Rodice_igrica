extends CanvasLayer

var initials = {
	"view": "",
	"button_right": "",
	"customization": ""
}

func _ready():
	initials["button_right"]=$Control/Button2.position.x;
	initials["customization"]=$Control/Customization.position.x
	initials["view"]=$Control.size.x;

func _process(delta):
	Global.camera = $"../Camera2D".get_screen_center_position();
	Global.viewport = $"../Camera2D".get_viewport_rect().size; 
	
	if(Global.furniture_edit==2):
		$Control.visible=true
	else:
		$Control.visible=false;
	
	var change = Global.viewport.x-initials["view"];
	
	$Control/Button2.position.x=Global.viewport.x-$Control/Button2.size.x;
	
	#$Player/CanvasLayer/Control/Customization.position.x=initials["customization"]+change;
