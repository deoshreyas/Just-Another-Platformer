extends Area2D

var activated = false

func _on_body_entered(body):
	if body is Player and not activated:
		if body.has_key:
			activated = true 
			$AnimatedSprite2D.play("activated")
			Global.can_go_to_next_level = true 
