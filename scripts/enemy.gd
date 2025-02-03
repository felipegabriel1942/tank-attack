extends Area2D

@onready var damage_component = $DamageComponent

func _on_damage_component_died():
	queue_free()
