extends Label

var amount = 0

func _ready():
	text = String(amount) 

func _on_coinCollected():
	amount += 1
	_ready()
