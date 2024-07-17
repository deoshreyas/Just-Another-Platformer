extends Area2D

func _on_body_entered(body):
	if body is Player:
		if Global.lives < Global.MAX_LIVES:
			Global.lives += 1 
		queue_free()
