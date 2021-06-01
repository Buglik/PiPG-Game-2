extends KinematicBody

var velocity = Vector3()
const SPEED = 5
const SPINDEG = 8
export var JUMP_SPEED = 10
export var gravity = Vector3.DOWN * 10
var jump = false

func _ready():
	$Music.play()

func _physics_process(delta):
	velocity += gravity * delta
	get_input()
	velocity = move_and_slide(velocity, Vector3.UP)
	if jump and is_on_floor():
		velocity.y = JUMP_SPEED
	
func get_input():	
	velocity.x = 0
	velocity.z = 0
	if Input.is_action_pressed("move_forward"):
		velocity.z -= SPEED
		$MeshInstance.rotate_x(-deg2rad(SPINDEG))
	if Input.is_action_pressed("move_back"):
		velocity.z += SPEED	
		$MeshInstance.rotate_x(deg2rad(SPINDEG))
	if Input.is_action_pressed("move_left"):
		velocity.x -= SPEED
		$MeshInstance.rotate_z(deg2rad(SPINDEG))
	if Input.is_action_pressed("move_right"):
		velocity.x += SPEED			
		$MeshInstance.rotate_z(-deg2rad(SPINDEG))
	
	jump = false
	if Input.is_action_just_pressed("jump"):
		jump = true
	


func _on_enemy_body_entered(body):
	if body.name == "Character":
		get_tree().change_scene("res://GameOver.tscn")
