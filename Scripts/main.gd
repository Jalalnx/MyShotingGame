extends Spatial

var ray_origin = Vector3()
var ray_target = Vector3() 

func _physics_process(delta):
	var mouse_point = get_viewport().get_mouse_position()
#	print("Mouse Position :",mouse_point)
	
	ray_origin = $Camera.project_ray_origin(mouse_point)
	
	ray_target = ray_origin +$Camera.project_ray_normal(mouse_point) *2000
	
	var space_state = get_world().direct_space_state
	var intersection = space_state.intersect_ray(ray_origin,ray_target)
	
	if not intersection.empty():
		var pos =intersection.position
		var look_at_me = Vector3(pos.x,$Player.translation.y,pos.z)
		$Player.look_at(look_at_me,Vector3.UP)
	
