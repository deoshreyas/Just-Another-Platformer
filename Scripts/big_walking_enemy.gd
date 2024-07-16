extends CharacterBody2D

@export var SPEED = 50

@onready var left = $LeftCast
@onready var right = $RightCast
@onready var sprite = $AnimatedSprite2D

var direction = Vector2.LEFT
var alive = true:
	get:
		return alive 
	set(value):
		sprite.play("dead")
		alive = value

func _physics_process(_delta):
	if alive:
		if left.is_colliding():
			sprite.flip_h = true 
			direction = Vector2.RIGHT 
		elif right.is_colliding():
			sprite.flip_h = false  
			direction = Vector2.LEFT
		velocity = SPEED * direction 
		move_and_slide()
