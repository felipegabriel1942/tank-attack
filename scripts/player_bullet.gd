extends BaseBullet

func _on_area_entered(area):
	area.take_damage(damage)
	_explode()
	queue_free()
