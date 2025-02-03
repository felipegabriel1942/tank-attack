extends Area2D

class_name BaseBullet

@export var speed: float = 300
@export var damage: int = 1

var bullet_rotation: float

const EXPLOSION = preload("res://scenes/explosion.tscn")

func _ready():
	visible = false

func _process(delta):
	_move(delta)
	
func _move(delta):
	var canon_rotation_offset = 1.55
	var foward_direction = Vector2(0, -1).rotated(bullet_rotation)
	
	rotation = bullet_rotation - canon_rotation_offset	
	position += foward_direction * speed * delta
	
	if visible == false:
		visible = true

func _on_visible_on_screen_notifier_2d_screen_exited():
	queue_free()

func _explode():
	var explosion_instance = EXPLOSION.instantiate()
	explosion_instance.global_position = global_position
	explosion_instance.scale = Vector2(0.5, 0.5)
	get_parent().add_child(explosion_instance)
