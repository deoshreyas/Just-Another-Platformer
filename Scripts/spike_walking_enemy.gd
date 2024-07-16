extends CharacterBody2D

@onready var left = $Left 
@onready var right = $Right 
@onready var down1 = $Down1 
@onready var down2 = $Down2

var direction = Vector2.LEFT

func _physics_process(_delta): 
	if left.is_colliding() or not down1.is_colliding():
		direction = Vector2.RIGHT 
