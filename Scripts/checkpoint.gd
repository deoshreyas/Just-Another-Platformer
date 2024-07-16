extends CharacterBody2D

var activated = false

func _on_area_2d_body_entered(body):
	if body is Player and not activated:
		activated = true
		Global.checkpoint = body.position
		$AnimatedSprite2D.play("checked")
		position.y -= 9
