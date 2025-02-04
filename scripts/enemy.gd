extends Area2D

@export var blink_duration: float = 0.5  
@export var blink_speed: float = 0.1     

@onready var damage_component = $DamageComponent

var tween: Tween

func _on_damage_component_died():
	queue_free()

func _on_damage_component_damaged():
	_blink()

#TODO: arranjar uma forma de fazer isso com composição
func _blink(color := Color.BLACK, reset_color := Color.WHITE):
	if tween:
		tween.kill()
	tween = create_tween()
	
	for i in range(int(blink_duration / blink_speed)):
		tween.tween_property(self, "modulate", color, blink_speed / 2)
		tween.tween_property(self, "modulate", reset_color, blink_speed / 2)
