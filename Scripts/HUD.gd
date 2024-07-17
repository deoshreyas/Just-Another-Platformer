extends CanvasLayer

func _ready():
	$CoinCounter/CoinCount.text = str(Global.coins)
	$DiamondCounter/DiamondCount.text = str(Global.diamonds)
	Global.connect("increment_coin_count", _increment_coins)
	Global.connect("increment_diamond_count", _increment_diamonds)

func _increment_coins():
	$CoinCounter/CoinCount.text = str(Global.coins)

func _increment_diamonds():
	$DiamondCounter/DiamondCount.text = str(Global.diamonds)
