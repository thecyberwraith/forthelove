extends KinematicBody2D

export (int) var run_speed = 100
export (int) var jump_speed = -400
export (int) var gravity = 1000

var velocity = Vector2()
var jumping = false
var jump_input = false

func set_jump_input(input: bool):
	jump_input = input

func set_horizontal_velocity(x_velocity: float):
	velocity.x = x_velocity

func get_jump_velocity_from_input():
	if jumping and is_on_floor():
		jumping = false
		
	if jump_input and is_on_floor():
		jumping = true
		velocity.y = jump_speed

func _physics_process(delta):
	get_jump_velocity_from_input()
	velocity.y += gravity * delta
	velocity = move_and_slide(velocity, Vector2(0,-1))
