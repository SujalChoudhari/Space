extends Spatial

export (int) var radius :int = 1
export (int) var energy :int = 1
export (Color) var color:= Color()
export (Texture) var texture = Texture


func create():
	# Geometry
	var mesh = SphereMesh.new()
	mesh.radius = radius
	mesh.height = radius * 2
	
	# Material
	var material = SpatialMaterial.new()
	material.emission = color
	material.emission_enabled = true
	material.emission_energy = energy
	material.albedo_color = color
	material.albedo_texture = texture
	
	mesh.material = material
	$GFX.mesh = mesh

