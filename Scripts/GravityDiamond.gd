extends CharacterBody2D

const GRAVITY = 1
const SHOOT_SPEED = 100

func _physics_process(_delta):
	velocity.y += GRAVITY
	print(position)
	
func shoot_up():
	velocity.y -= SHOOT_SPEED
	velocity.x += SHOOT_SPEED

func _on_area_2d_body_entered(body):
	if body is Player:
		Global.diamonds += 1 
		queue_free()
