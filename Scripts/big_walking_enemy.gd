extends CharacterBody2D

@export var SPEED = 50

@onready var left = $LeftCast
@onready var right = $RightCast
@onready var sprite = $AnimatedSprite2D
@onready var hitbox = $Hitbox/CollisionShape2D

var direction = Vector2.LEFT
var alive = true

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

func _on_hurtbox_body_entered(body):
	if body is Player and alive:
		alive = false
		sprite.play("dead")
		hitbox.call_deferred("set_disabled", true)
