extends Node2D

class_name HealthComponent

@export var max_health = 3

var health: int

func _ready():
	health = max_health
	
func is_dead():
	return health <= 0
