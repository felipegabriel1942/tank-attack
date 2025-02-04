extends Node2D

@export var blink_duration: float = 0.5  
@export var blink_speed: float = 0.1
@onready var root = $".."

func blink(color := Color.BLACK, reset_color := Color.WHITE):
	var tween = root.create_tween()
	
	for i in range(int(blink_duration / blink_speed)):
		tween.tween_property(root, "modulate", color, blink_speed / 2)
		tween.tween_property(root, "modulate", reset_color, blink_speed / 2)

