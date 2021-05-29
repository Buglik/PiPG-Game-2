extends Button


func _ready():
	$GameOver.play()


func _on_buttonstartagain_pressed():
	get_tree().change_scene("res://MainMenu.tscn")
