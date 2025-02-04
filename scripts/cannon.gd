extends Node2D

@onready var burst = $Burst
@onready var cannon_shot_sound = $"../CannonShotSound"

var is_reloading = false

const BULLET = preload("res://scenes/bullet.tscn")

func _ready():
	burst.visible = false

func get_input():
	look_at(get_global_mouse_position())
	
func _physics_process(delta):
	get_input()

func _process(delta):
	if Input.is_action_just_pressed("shoot") && !is_reloading:
		_shoot()

func _shoot():
	var bullet_instance = BULLET.instantiate()
	var canon_rotation_offset = 1.55
	
	bullet_instance.bullet_rotation = global_rotation + canon_rotation_offset
	bullet_instance.global_position = burst.global_position
	get_tree().current_scene.add_child(bullet_instance)
	cannon_shot_sound.play()
	
	_show_burst_effect()
	_reload()

func _show_burst_effect():
	burst.visible = true
	await get_tree().create_timer(0.2).timeout
	burst.visible = false
	
func _reload():
	is_reloading = true
	await get_tree().create_timer(1).timeout
	is_reloading = false
