extends Control

var ready_to_accept_input = false

func _ready():
	get_tree().paused = false
	$CanvasLayer/VBoxContainer/Time.text = "Time: " + str(Global.time)
	$CanvasLayer/Coins.text = str(Global.coins)
	$CanvasLayer/Diamonds.text = str(Global.diamonds)
	await get_tree().create_timer(0.5).timeout
	ready_to_accept_input = true

func _process(_delta):
	if Input.is_anything_pressed() and ready_to_accept_input:
		get_tree().change_scene_to_file("res://Scenes/main_menu.tscn")
