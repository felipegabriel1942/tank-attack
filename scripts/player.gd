extends CharacterBody2D

@export var move_speed = 75
@export var rotation_speed = 1.5
@export var blink_duration: float = 0.5  
@export var blink_speed: float = 0.1     

@onready var damage_component = $DamageComponent

var tween: Tween

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
	
func _on_damaged():
	_blink()

func _on_death():
	queue_free()

#TODO: arranjar uma forma de fazer isso com composição
func _blink(color := Color.BLACK, reset_color := Color.WHITE):
	if tween:
		tween.kill()
	tween = create_tween()
	
	for i in range(int(blink_duration / blink_speed)):
		tween.tween_property(self, "modulate", color, blink_speed / 2)
		tween.tween_property(self, "modulate", reset_color, blink_speed / 2)
