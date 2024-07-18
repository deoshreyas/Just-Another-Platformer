extends Node

func _ready():
	play("bg")

func play(sound):
	if sound=="bg":
		$Background.play()
	elif sound=="coin":
		$Coin.play()
	elif sound=="lose":
		$Lose.play()
