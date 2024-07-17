extends Node

signal make_lever_block_disappear

const MAX_LIVES = 3
var lives = MAX_LIVES

var checkpoint = Vector2(0, 0)
var activated_checkpoints = []

var can_go_to_next_level = false
var level_transition = preload("res://Scenes/level_transition.tscn").instantiate()

func change_level(level):
	get_tree().root.add_child(level_transition)
	get_tree().paused = true
	level_transition.fade_out()
	await level_transition.transitioned 
	Global.checkpoint = Vector2(0, 0)
	get_tree().change_scene_to_packed(level)
	level_transition.fade_in()
	await level_transition.transitioned
	get_tree().paused = false
