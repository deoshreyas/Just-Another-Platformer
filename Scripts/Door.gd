extends Area2D

@export var Next_Level : PackedScene

func _on_body_entered(body):
	if body is Player and body.is_on_floor():
		if Global.can_go_to_next_level:
			modulate = Color.BLACK
			Global.can_go_to_next_level = false
			Global.change_level(Next_Level)
