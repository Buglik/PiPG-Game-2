extends Button


func _ready():
	pass


func _on_buttonstartagain_pressed():
	get_tree().change_scene("res://MainMenu.tscn")
