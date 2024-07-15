extends CharacterBody2D
class_name Player

@export var SPEED = 100
@export var JUMP_SPEED = 250
@export var FALL_SPEED = 9.8
@export var MAX_FALL_SPEED = 250
@export var MAX_DOUBLE_JUMPS = 2
@export var DOUBLE_JUMP_SPEED = 5

@onready var sprites = $AnimatedSprite2D
@onready var camera : Camera2D = get_tree().get_first_node_in_group("Camera")

var can_double_jump = false 
var num_double_jumps = 0 

func _physics_process(_delta):
	movement()
	
func movement():
	velocity.y += FALL_SPEED
	if velocity.y > MAX_FALL_SPEED:
		velocity.y = MAX_FALL_SPEED
	var input_x = Input.get_axis("left", "right")
	velocity.x = input_x * SPEED 
	if input_x > 0:
		sprites.flip_h = true 
	if input_x < 0:
		sprites.flip_h = false
	if input_x:
		sprites.play("walk")
	else:
		sprites.play("idle")
	if Input.is_action_just_pressed("up"):
		if is_on_floor():
			velocity.y = -JUMP_SPEED
		elif can_double_jump:
			num_double_jumps += 1
			velocity.y = -JUMP_SPEED-DOUBLE_JUMP_SPEED
	if not is_on_floor():
		sprites.play("walk")
		sprites.frame = 0
		can_double_jump = true 
	else:
		num_double_jumps = 0
		can_double_jump = false
	
	if num_double_jumps==MAX_DOUBLE_JUMPS:
		can_double_jump = false
	
	pan_cam_to_self()
	move_and_slide()
	
func pan_cam_to_self():
	camera.position = position
