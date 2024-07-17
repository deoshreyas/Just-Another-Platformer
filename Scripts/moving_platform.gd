extends Path2D

enum ANIMATION_TYPE { LOOP, BOUNCE }

@export var AnimationType : ANIMATION_TYPE
@export var speed : float = 5.0

@export var AvoidUp : bool = false
@export var AvoidDown : bool = false
@export var AvoidLeft : bool = false
@export var AvoidRight : bool = false

@onready var sprite = $AnimationPlayer

var player_in_path = false

func _ready():
	avoid_player()
	play_anim()
	
func _physics_process(_delta):
	if player_in_path:
		sprite.pause()
	else:
		play_anim()

func play_anim():
	match AnimationType:
		ANIMATION_TYPE.LOOP: sprite.play("Loop", -1, speed)
		ANIMATION_TYPE.BOUNCE: sprite.play("Bounce",-1, speed)
		
func avoid_player():
	if AvoidUp:
		$PathFollow2D/Sprite2D/Up/CollisionShape2D.disabled = true 
	if AvoidDown:
		$PathFollow2D/Sprite2D/Down/CollisionShape2D.disabled = true 
	if AvoidLeft:
		$PathFollow2D/Sprite2D/Left/CollisionShape2D.disabled = true 
	if AvoidRight:
		$PathFollow2D/Sprite2D/Right/CollisionShape2D.disabled = true 


func _on_up_body_entered(body):
	if body is Player:
		player_in_path = true 

func _on_up_body_exited(body):
	if body is Player:
		player_in_path = false

func _on_down_body_entered(body):
	if body is Player:
		player_in_path = true 

func _on_down_body_exited(body):
	if body is Player:
		player_in_path = false

func _on_left_body_entered(body):
	if body is Player:
		player_in_path = true 

func _on_left_body_exited(body):
	if body is Player:
		player_in_path = false

func _on_right_body_entered(body):
	if body is Player:
		player_in_path = true 

func _on_right_body_exited(body):
	if body is Player:
		player_in_path = false
