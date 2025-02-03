extends BaseBullet

func _on_area_entered(area):
	area.damage_component.take_damage(damage)
	_explode()
	queue_free()
