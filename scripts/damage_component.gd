extends Node2D

signal died()

@export var health_component: HealthComponent

const EXPLOSION = preload("res://scenes/explosion.tscn")

func take_damage(damage):
	health_component.health -= damage
	
	if health_component.is_dead():
		_explode()

func _explode():
	var explosion_instance = EXPLOSION.instantiate()
	explosion_instance.global_position = global_position
	get_tree().current_scene.add_child(explosion_instance)
	emit_signal("died")

