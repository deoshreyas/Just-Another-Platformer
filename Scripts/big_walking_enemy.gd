extends CharacterBody2D

@export var SPEED = 50

@onready var left = $LeftCast
@onready var right = $RightCast
@onready var sprite = $AnimatedSprite2D
@onready var hitbox = $Hitbox/CollisionShape2D

var direction = Vector2.LEFT
var alive = true

var diamond = preload("res://Scenes/diamond.tscn")
var coin = preload("res://Scenes/coin.tscn")

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
		spawn_item()

func random_item():
	var chance = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10].pick_random()
	if chance==1:
		return diamond 
	elif chance<4:
		return coin 
	else:
		return false 

func spawn_item():
	var item = random_item()
	if item:
		var item_instance = item.instantiate()
		item_instance.position = Vector2(-25, 0)
		call_deferred("add_child", item_instance)
