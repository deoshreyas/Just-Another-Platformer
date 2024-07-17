extends Area2D

func _on_body_entered(body):
	if body is Player:
		if Global.can_go_to_next_level:
			modulate = Color.BLACK
