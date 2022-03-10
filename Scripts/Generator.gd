extends Node


var template_celestial = preload("res://Scenes/Celestial.tscn")
var template_star = preload("res://Scenes/Star.tscn")
func create_star():
	# Create Star
	var star :Star = template_star.instance()
	var _temp = rand_range(10,40)
	star.radius = _temp
	star.energy = _temp / 10
	star.color = Color(0.8,0.6,0.4)
	add_child(star)
	star.create()
	
	create_planet(star)

# Create Planet
func create_planet(star):
	var _temp = rand_range(10,40)
	for i in rand_range(2,8):
		i +=1
		var planet:Celestial = template_celestial.instance()
		_temp = rand_range(10,20)
		planet.major_axis = i * _temp * 20
		planet.minor_axis = i  * _temp * 20
		planet.epoch = _temp * 9
		if randi() > 0.7: planet.direction = -1
		else: planet.direction = 1
		star.add_child(planet)
		planet.create_planet()
		
		create_moon(planet)

# Create Moon
func create_moon(planet):
	var _temp = rand_range(1,8)
	for i in rand_range(0,5):
		i +=1
		if randf() > 0.5: continue
		var moon:Celestial = template_celestial.instance()
		_temp = rand_range(10,20)
		moon.major_axis = i *  _temp * 10
		moon.minor_axis = i *  _temp * 10
		moon.epoch = _temp * 9
		if randi() > 0.7: moon.direction = -1
		else: planet.direction = 1
		planet.add_child(moon)
		moon.create_moon()

func _ready():
	create_star()

