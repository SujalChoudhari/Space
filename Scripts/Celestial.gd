class_name Celestial extends Spatial

export (int) var major_axis = 200
export (int) var minor_axis 
var y_offset = rand_range(0,100)
export (int) var speed = 20
export (int) var epoch = 0
export (int) var direction = 1



var t =0
var x =0
var x2=0
var y = 0
var z =0
var z2 =0
var a2 =0
var b = 0

onready var gfx = $GFX

func create_planet():
	var _mesh = SphereMesh.new()
	_mesh.radius = rand_range(10,40)
	_mesh.height = 2 * _mesh.radius
	if minor_axis == 0:
		minor_axis = major_axis
	speed = 1/  pow(major_axis,0.7)
	var mat = SpatialMaterial.new()
	mat.texture
	gfx.mesh = _mesh

func create_moon():
	var _mesh = SphereMesh.new()
	_mesh.radius = rand_range(5 ,10)
	_mesh.height = 2 * _mesh.radius
	if minor_axis == 0:
		minor_axis = major_axis
	speed = 1/  pow(major_axis,0.6)
	
	gfx.mesh = _mesh
	
func orbit(a):
	a2 = a - b
	x2 = major_axis * sin(a2) 
	z2 = minor_axis * cos(a2) 
	translate(Vector3(-x ,-y,-z ))
	
	x = major_axis * sin(speed * a + epoch)
	z = minor_axis * cos(speed * a + epoch)
	y = y_offset * cos(speed * a + epoch)
	translate(Vector3(x,y,z))
	return 0
	
	
func _physics_process(delta):
	b = direction* 0.5 * PI * delta * speed
	t +=b
	orbit(t)
