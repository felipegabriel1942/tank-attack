extends BaseBullet

func _on_body_entered(body):
	body.take_damage(damage)
	_explode()
	queue_free()
