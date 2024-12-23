extends CharacterBody2D

const speed = 300.0
var move = 0;

func _ready():
	Global.player = self;
	for p in get_node("SkeletonContainer/Parts").get_children():
		for p2 in Global.currentapparel.keys():
			if p.name==p2:
				p.texture=load("res://Sprites/Player/Customization/"+p2+"/"+Global.currentapparel[p2]);

func _physics_process(delta):

	velocity.x=move*speed;

	move_and_slide()


func _on_button_button_down():
	$AnimationPlayer.play("walk_left");
	move=-1;


func _on_button_2_button_down():
	$AnimationPlayer.play("walk");
	move=1;


func _on_button_button_up():
	if(move==-1):
		$AnimationPlayer.play("RESET");
		move=0


func _on_button_2_button_up():
	if(move==1):
		$AnimationPlayer.play("RESET");
		move=0
