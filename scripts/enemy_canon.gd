extends Node2D

@onready var bullet_container = $"../BulletContainer"
@onready var burst = $Burst
@onready var cannon_shot_sound = $"../CannonShotSound"

const ENEMY_BULLET = preload("res://scenes/enemy_bullet.tscn")
const PLAYER = preload("res://scenes/player.tscn")

func _ready():
	burst.visible = false
	
func _physics_process(delta):
	var player = get_player()
	
	if player != null:
		look_at(player.global_position)

	

func _on_shoot_timer_timeout():
	if get_player() != null:
		_shoot()

func _shoot():
	var bullet_instance = ENEMY_BULLET.instantiate()
	var canon_rotation_offset = 1.55
	var bullet_speed = 200
	
	bullet_instance.bullet_rotation = global_rotation + canon_rotation_offset
	bullet_instance.global_position = burst.global_position
	bullet_instance.speed = bullet_speed
	bullet_container.add_child(bullet_instance)
	cannon_shot_sound.play()
	
	burst.visible = true
	await get_tree().create_timer(0.2).timeout
	burst.visible = false

func get_player():
	var player_group = get_tree().get_nodes_in_group("player")
	
	if player_group != null && player_group.size() > 0:
		return player_group[0]
	else:
		return null
