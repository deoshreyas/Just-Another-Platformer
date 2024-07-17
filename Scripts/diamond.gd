extends Area2D

func _on_body_entered(body):
	if body is Player:
		Global.diamonds += 1 
		queue_free()
