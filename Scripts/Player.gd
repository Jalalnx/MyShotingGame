extends KinematicBody

var speed = 14
var velocity = Vector3.ZERO

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	
	velocity = Vector3.ZERO
	if Input.is_action_just_pressed("ui_right"):
		velocity.x += 1
	if Input.is_action_just_pressed("ui_left"):
		velocity.x -= 1
	if Input.is_action_just_pressed("ui_up"):
		velocity.z += 1
	if Input.is_action_just_pressed("ui_down"):
		velocity.z -= 1
		
	if velocity != Vector3.ZERO:
		velocity = velocity.normalized()
		$".".look_at(translation + velocity, Vector3.UP)
		
		
	velocity = velocity.normalized() * speed
	move_and_slide(velocity)
