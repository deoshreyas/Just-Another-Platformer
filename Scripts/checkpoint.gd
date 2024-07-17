extends CharacterBody2D

var activated = false

func _ready():
	for checkpoint in Global.activated_checkpoints:
		if position==checkpoint:
			$AnimatedSprite2D.play("checked")
			position.y -= 9

func _on_area_2d_body_entered(body):
	if body is Player and not activated:
		activated = true
		Global.checkpoint = body.position
		Global.activated_checkpoints.append(position)
		$AnimatedSprite2D.play("checked")
		position.y -= 9
