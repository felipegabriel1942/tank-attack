extends CharacterBody2D

class_name Player

signal health_changed()

@export var move_speed = 75
@export var rotation_speed = 1.5

@onready var damage_component = $DamageComponent
@onready var blink_component = $BlinkComponent
@onready var sprite = $Sprite2D
@onready var health_component = $HealthComponent

func _physics_process(delta):
	var direction = Vector2.ZERO
	
	if health_component.is_dead():
		return
	
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
		sprite.rotation = lerp_angle(sprite.rotation, target_rotation, rotation_speed * delta)
		
	else:
		velocity = Vector2.ZERO
		
	move_and_slide()
	
func _on_damaged():
	blink_component.blink()
	health_changed.emit()

func _on_death():
	#queue_free()
	visible = false
