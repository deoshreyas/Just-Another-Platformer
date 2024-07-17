extends CanvasLayer

signal transitioned 

func fade_in():
	$AnimationPlayer.play("in")

func fade_out():
	$AnimationPlayer.play("out")

func _on_animation_player_animation_finished(_anim_name):
	transitioned.emit()
