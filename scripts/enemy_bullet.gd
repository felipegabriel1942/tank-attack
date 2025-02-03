extends BaseBullet

func _on_body_entered(body):
	body.damage_component.take_damage(damage)
	_explode()
	queue_free()
