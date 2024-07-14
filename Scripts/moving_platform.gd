extends Path2D

enum ANIMATION_TYPE { LOOP, BOUNCE }

@export var AnimationType : ANIMATION_TYPE
@export var speed : float = 5.0

@onready var sprite = $AnimationPlayer

func _ready():
	play_anim()

func play_anim():
	match AnimationType:
		ANIMATION_TYPE.LOOP: sprite.play("Loop", -1, speed)
		ANIMATION_TYPE.BOUNCE: sprite.play("Bounce",-1, speed)
