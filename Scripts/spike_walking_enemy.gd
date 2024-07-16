extends CharacterBody2D

@export var SPEED = 100

@onready var sprite = $AnimatedSprite2D
@onready var left = $Left 
@onready var right = $Right 
@onready var down1 = $Down1 
@onready var down2 = $Down2

var direction = Vector2.LEFT

var attack = false:
	get:
		return attack
	set(value):
		attack = value 
		if attack:
			sprite.play("attack")
			position.y += 10
			SPEED = 0
		else:
			position.y -= 10
			sprite.play("walk") 
			SPEED = 100

func _physics_process(_delta): 
	if left.is_colliding() or not down1.is_colliding():
		direction = Vector2.RIGHT 
		sprite.flip_h = true
	elif right.is_colliding() or not down2.is_colliding():
		direction = Vector2.LEFT 
		sprite.flip_h = false 
	velocity = SPEED * direction
	move_and_slide()

func _on_attack_timer_timeout():
	attack = false if attack else true 
