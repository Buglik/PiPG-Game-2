extends Area

signal coinCollected
const SPINDEG = 5

func _ready():
	pass

func _physics_process(delta):
	rotate_y(deg2rad(SPINDEG))

func _on_coin_body_entered(body):
	if body.name == "Character":
		emit_signal("coinCollected")
		$AnimationPlayer.play("bounce")
		$Timer.start()

func _on_Timer_timeout():
	queue_free()
