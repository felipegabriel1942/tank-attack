extends CharacterBody2D

@export var move_speed = 75
@export var rotation_speed = 1.5

func _physics_process(delta):
	var direction = Vector2.ZERO
	
	if Input.is_action_pressed("move_up"):
		direction.y -= 1
		
	if Input.is_action_pressed("move_down"):
		direction.y += 1
	
	if Input.is_action_pressed("move_left"):
		direction.x -= 1
	
	if Input.is_action_pressed("move_right"):
		direction.x += 1
		
	if direction.length() > 0:
		direction = direction.normalized()
		velocity = direction * move_speed
		var target_rotation = velocity.angle()
		rotation = lerp_angle(rotation, target_rotation, rotation_speed * delta)
	else:
		velocity = Vector2.ZERO
	
	move_and_slide()
