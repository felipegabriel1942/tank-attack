extends CharacterBody2D

@export var move_speed = 75
@export var rotation_speed = 1.5

#@onready var health_component = $HealthComponent

@onready var damage_component = $DamageComponent



#const EXPLOSION = preload("res://scenes/explosion.tscn")

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

#func take_damage(damage):
	#health_component.health -= damage
	#
	#if health_component.is_dead():
		#_explode()
#
#func _explode():
	#var explosion_instance = EXPLOSION.instantiate()
	#explosion_instance.global_position = global_position
	#get_tree().current_scene.add_child(explosion_instance)
	#queue_free()

func _on_damage_component_died():
	queue_free()
