extends RigidBody2D

@onready var damage_component = $DamageComponent
@onready var blink_component = $BlinkComponent
@onready var health_component = $HealthComponent

func _on_damage_component_died():
	queue_free()

func _on_damage():
	blink_component.blink()
