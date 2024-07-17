extends Area2D

var player = preload("res://Scenes/player.tscn")
var had_key = false

func _on_body_entered(body):
	if body is Player:
		if Global.lives > 0:
			if body.has_key:
				had_key = true
			body.queue_free()
			var player_instance = player.instantiate()
			get_tree().root.add_child(player_instance)
			Global.lives -= 1
			if had_key:
				player_instance.has_key = true
		else:
			body.queue_free()
