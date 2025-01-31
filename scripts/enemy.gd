extends Area2D

@export var health = 2

func take_damage(damage):
	health -= damage
	
	if health <= 0:
		queue_free()

func _on_shoot_timer_timeout():
	print("shoot")
