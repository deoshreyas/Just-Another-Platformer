extends Area2D


func _on_body_entered(body):
	if body is Player:
		Global.reduce_gravity.emit()

func _on_body_exited(body):
	if body is Player:
		Global.normal_gravity.emit()
