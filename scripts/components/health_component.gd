extends Node

class_name HealthComponent

@export var max_health = 3
@onready var health: int = max_health
	
func is_dead():
	return health <= 0
