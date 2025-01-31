extends Area2D

@export var speed = 300
@export var damage = 1

var bullet_rotation;

func _ready():
	visible = false

func _process(delta):
	var canon_rotation_offset = 1.55
	var foward_direction = Vector2(0, -1).rotated(bullet_rotation)
	
	rotation = bullet_rotation - canon_rotation_offset	
	position += foward_direction * speed * delta
	
	if visible == false:
		visible = true

func _on_area_entered(area):
	area.take_damage(damage)
	queue_free()


func _on_body_entered(body):
	body._take_damage(1)
	queue_free()
