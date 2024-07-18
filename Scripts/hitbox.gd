extends Area2D

var player = preload("res://Scenes/player.tscn")
var had_key = false

func _on_body_entered(body):
	if body is Player:
		if Global.lives > 0:
			if body.has_key:
				had_key = true
			body.call_deferred("queue_free")
			var player_instance = player.instantiate()
			get_tree().get_first_node_in_group("Level").call_deferred("add_child", player_instance)
			Global.lives -= 1
			if had_key:
				player_instance.has_key = true
		else:
			body.call_deferred("queue_free")
			get_tree().paused = true 
			get_tree().change_scene_to_file("res://Scenes/game_over.tscn")
