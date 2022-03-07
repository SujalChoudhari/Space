extends Node

func generate():
	var template_celestial = preload("res://Scenes/Celestial.tscn")
	var template_star = preload("res://Scenes/Star.tscn")
	
	# Create Star
	var new = template_star.instance()
	var _temp = rand_range(10,40)
	new.radius = _temp
	new.energy = _temp / 10
	new.color = Color(0.8,0.6,0.4)
	add_child(new)
	new.create()
	
	# Create Planets
	var new_planet = template_celestial.instance()
	_temp = rand_range(10,20)
	if randi() > 0.6:
		new_planet # ...
	
	

func _ready():
	generate() 

