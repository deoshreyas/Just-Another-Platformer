extends Node2D

@onready var lives_container = $LivesContainer

var life = preload("res://Scenes/life.tscn")
var life_pos = Vector2(15, 15)

func _process(_delta):
	var num_drawn = 0
	for i in range(Global.MAX_LIVES):
		var filled_heart = num_drawn < Global.lives
		var life_instance = life.instantiate()
		life_instance.position = life_pos
		if not filled_heart:
			life_instance.play("empty")
		else:
			life_instance.play("filled")
		lives_container.add_child(life_instance)
		life_pos.x += 15
		num_drawn += 1
	life_pos = Vector2(15, 15)
