extends Control

func _ready():
	$VBoxContainer/Play.grab_focus()

func _on_play_pressed():
	get_tree().change_scene_to_file("res://Scenes/level_1.tscn")

func _on_music_pressed():
	AudioServer.set_bus_mute(AudioServer.get_bus_index("Master"), true)

func _on_exit_pressed():
	get_tree().quit()
