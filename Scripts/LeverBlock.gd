extends CharacterBody2D

func _ready():
	Global.connect("make_lever_block_disappear", queue_free)
