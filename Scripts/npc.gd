extends CharacterBody2D

var speed = 30;
func _ready() -> void:
	$MarginContainer.modulate=Color(Color.WHITE,0);
	
func _physics_process(delta: float) -> void:
	velocity.x=speed;
	move_and_slide()
	
	var bodies = $Area2D.get_overlapping_bodies();
	if(len(bodies)>0):
		for body in bodies:
			if(body.name=="Player"):
				var tween = create_tween()
				tween.tween_property($MarginContainer,"position",Vector2(33,-112),0.2);
				tween.tween_property($MarginContainer,"modulate",Color(Color.WHITE,1),0.2);
				break;
	else:
		var tween = create_tween()
		tween.tween_property($MarginContainer,"position",Vector2(33,-90),0.2);
		tween.tween_property($MarginContainer,"modulate",Color(Color.WHITE,0),0.2);

func _on_timer_timeout() -> void:
	var rand = randi_range(0,1);
	match rand:
		0:	
			speed=speed*(-1);
		1:
			speed=speed*(1);
