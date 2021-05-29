extends KinematicBody

var velocity = Vector3()
const SPEED = 5
const SPINDEG = 8

func _ready():
	$Music.play()

func _physics_process(delta):
	
	if Input.is_action_pressed("ui_right") and Input.is_action_pressed("ui_left"):
		velocity.x = lerp(velocity.x,0,0.1)
	else:
		if Input.is_action_pressed("ui_right"):
			velocity.x = SPEED
			$MeshInstance.rotate_z(-deg2rad(SPINDEG))
		elif Input.is_action_pressed("ui_left"):
			velocity.x = -SPEED	
			$MeshInstance.rotate_z(deg2rad(SPINDEG))
		else:
			velocity.x = lerp(velocity.x,0,0.1)
	
	if Input.is_action_pressed("ui_up") and Input.is_action_pressed("ui_down"):
		velocity.z = lerp(velocity.z,0,0.1)
	else:
		if Input.is_action_pressed("ui_up"):
			velocity.z = -SPEED
			$MeshInstance.rotate_x(-deg2rad(SPINDEG))
		elif Input.is_action_pressed("ui_down"):
			velocity.z = SPEED	
			$MeshInstance.rotate_x(deg2rad(SPINDEG))
		else:
			velocity.z = lerp(velocity.z,0,0.1)	
		
	
	move_and_slide(velocity)


func _on_enemy_body_entered(body):
	if body.name == "Character":
		get_tree().change_scene("res://GameOver.tscn")
