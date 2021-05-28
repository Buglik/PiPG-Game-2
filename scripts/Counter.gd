extends Label

var amount = 0

func _ready():
	text = String(amount) 

func _on_coinCollected():
	amount += 1
	_ready()
	if(amount == 5):
		$Timer.start()
	

func _on_Timer_timeout():
	get_tree().change_scene("res://WinScene.tscn")
