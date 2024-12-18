extends Node2D

var dir = DirAccess;

var categories = ["Eyes","Hair","Mouth","Upper"]

var cat = 0;

var current = {
	"Eyes":0,
	"Hair":0,
	"Mouth":0,
	"Upper":0
}

var part;

var loaded = dir.get_files_at("res://Sprites/Player/Customization/Hair");
var loaded_names = []


func _ready():
	Global.currentScene=get_tree().current_scene
	load_category();
	

func _process(delta):
	$Control/Category.text=categories[cat];



func _on_previous_pressed():
	current[categories[cat]]-=1;
	if(current[categories[cat]]<0):
		current[categories[cat]]=loaded_names.size()-1;

	part.texture=load("res://Sprites/Player/Customization/"+categories[cat]+"/"+loaded_names[current[categories[cat]]]);
	Global.currentapparel[categories[cat]]=loaded_names[current[categories[cat]]];

func _on_next_pressed():
	current[categories[cat]]+=1;
	if(current[categories[cat]]>loaded_names.size()-1):
		current[categories[cat]]=0;

	part.texture=load("res://Sprites/Player/Customization/"+categories[cat]+"/"+loaded_names[current[categories[cat]]]);
	Global.currentapparel[categories[cat]]=loaded_names[current[categories[cat]]];


func _on_category_previous_pressed():
	cat-=1
	if(cat<0):
		cat=categories.size()-1;
	load_category()

func _on_category_next_pressed():
	cat+=1;
	if(cat>categories.size()-1):
		cat=0;
	load_category()

func load_category():
	loaded_names=[];
	loaded = dir.get_files_at("res://Sprites/Player/Customization/"+categories[cat]);
	for i in range(loaded.size()):
		if(".import" in loaded[i]):
			loaded_names.append(loaded[i].replace(".import",""))
	for p in get_node("Player/SkeletonContainer/Parts").get_children():
		if(p.name==categories[cat]):
			part=p;
			break
