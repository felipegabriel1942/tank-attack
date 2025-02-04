extends Node2D

signal died()
signal damaged()

var tween: Tween

@export var health_component: HealthComponent

const EXPLOSION = preload("res://scenes/explosion.tscn")

func take_damage(damage):
	health_component.health -= damage
	
	damaged.emit()
	#_blink()
	
	if health_component.is_dead():
		_explode()

func _explode():
	var explosion_instance = EXPLOSION.instantiate()
	explosion_instance.global_position = global_position
	get_tree().current_scene.add_child(explosion_instance)
	died.emit()
	
#func _blink():
	#if tween:
		#tween.kill()
		#
	#tween = create_tween()
#
	#for i in range(int(0.5 / 0.1)):
		#tween.tween_property(self, "modulate", Color.BLACK, 0.1 /2)
		#tween.tween_property(self, "modulate", Color.WHITE, 0.1 / 2)
#
