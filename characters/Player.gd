extends KinematicBody2D

export (int) var run_speed = 100
export (int) var jump_speed = -400
export (int) var gravity = 1000

var velocity = Vector2()
var jumping = false

func _ready():
	$CharacterSkeleton/AnimationPlayer.stop()

func get_x_velocity_from_input():
	var right = Input.is_action_pressed("ui_right")
	var left = Input.is_action_pressed("ui_left")
	
	var x = 0
	
	if right:
		x += 1
	if left:
		x -= 1
	
	velocity.x = x * run_speed
	
	if x == 0:
		$CharacterSkeleton/AnimationPlayer.play("Idle")
	else:
		$CharacterSkeleton/AnimationPlayer.play("Run")
		$CharacterSkeleton.set_scale(Vector2(x,1));

func get_jump_velocity_from_input():
	var jump = Input.is_action_pressed("ui_select")
	
	if jumping and is_on_floor():
		jumping = false
		
	if jump and is_on_floor():
		jumping = true
		velocity.y = jump_speed

func _physics_process(delta):
	get_x_velocity_from_input()
	get_jump_velocity_from_input()
	velocity.y += gravity * delta
	velocity = move_and_slide(velocity, Vector2(0,-1))
