extends Area2D

func _on_body_entered(body):
	if body is Player:
		if Global.lives > 0:
			get_tree().reload_current_scene()
			Global.lives -= 1
		else:
			body.queue_free()
