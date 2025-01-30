extends Node2D

@onready var bullet_container = $"../BulletContainer"
@onready var burst = $Burst
@onready var cannon_shot_sound = $"../CannonShotSound"

const BULLET = preload("res://scenes/bullet.tscn")

func _ready():
	burst.visible = false

func get_input():
	look_at(get_global_mouse_position())
	
func _physics_process(delta):
	get_input()

func _process(delta):
	if Input.is_action_just_pressed("shoot"):
		_shoot()

func _shoot():
	var bullet_instance = BULLET.instantiate()
	var canon_rotation_offset = 1.55
	
	bullet_instance.bullet_rotation = global_rotation + canon_rotation_offset
	bullet_instance.global_position = burst.global_position
	bullet_container.add_child(bullet_instance)
	cannon_shot_sound.play()
	
	burst.visible = true
	await get_tree().create_timer(0.2).timeout
	burst.visible = false
