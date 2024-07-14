extends CharacterBody2D

@export var SPEED = 100
@export var JUMP_SPEED = 250
@export var FALL_SPEED = 9.8
@export var MAX_FALL_SPEED = 250

@onready var sprites = $AnimatedSprite2D

func _physics_process(delta):
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
	if Input.is_action_pressed("up"):
		if is_on_floor():
			velocity.y = -JUMP_SPEED
	if not is_on_floor():
		sprites.play("walk")
		sprites.frame = 0
	move_and_slide()
