extends MeshInstance

export (int) var major_axis = 200
export (int) var minor_axis 
export (int) var speed = 1
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


func _ready():
	var _mesh : SphereMesh = mesh
	_mesh.radius = rand_range(10,50)
	_mesh.height = 2 * _mesh.radius
	if minor_axis == 0:
		minor_axis = major_axis
	speed = 1/  pow(major_axis,0.7)


	
func orbit(a):
	a2 = a - b
	x2 = major_axis * sin(a2) 
	z2 = minor_axis * cos(a2) 
	translate(Vector3(-x ,-y,-z ))
	
	x = major_axis * sin(speed * a + epoch)
	z = minor_axis * cos(speed * a + epoch)
	y = minor_axis * cos(speed * a + epoch)
	translate(Vector3(x,y,z))
	return 0
	
	
func _physics_process(delta):
	b = direction* 0.5 * PI * delta * speed
	t +=b
	orbit(t)
