extends Area2D

var player_in = false

func _on_body_entered(body):
	if body is Player:
		player_in = true 

func _on_body_exited(body):
	if body is Player:
		player_in = false

func _physics_process(_delta):
	if Input.is_action_just_pressed("ui_accept") and player_in:
		$AnimatedSprite2D.play("activate")
		Global.make_lever_block_disappear.emit()
