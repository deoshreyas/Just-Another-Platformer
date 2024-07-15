extends CharacterBody2D

@export var SPEED = 500

@onready var raycast = $RayCast2D

var falling = false 

func _physics_process(delta):
	if falling:
		velocity.y += SPEED * delta
		move_and_slide()
	if raycast.is_colliding():
		if raycast.get_collider() is Player:
			falling = true
