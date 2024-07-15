extends CharacterBody2D

@export var SPEED = 150

@onready var main_self = $"."

func _on_detection_area_body_entered(body):
	if body is Player:
		main_self.velocity.y += SPEED 
