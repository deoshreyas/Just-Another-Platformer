extends Node2D

@onready var player = $Player 
@onready var camera = $Camera2D

func _ready():
	make_cam_follow_player()

func _physics_process(_delta):
	make_cam_follow_player()
	
func make_cam_follow_player():
	# if player is not dead:
	camera.position = player.position
