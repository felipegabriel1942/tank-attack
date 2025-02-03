extends Area2D

@export var health = 2

const EXPLOSION = preload("res://scenes/explosion.tscn")

func take_damage(damage):
	health -= damage
	
	if health <= 0:
		_explode()

func _explode():
	var explosion_instance = EXPLOSION.instantiate()
	explosion_instance.global_position = global_position
	get_parent().add_child(explosion_instance)
	queue_free()
