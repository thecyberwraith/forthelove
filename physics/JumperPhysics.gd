extends Node2D

class_name JumperPhysics

export (NodePath) var kinematicBody

export (int) var run_speed = 100
export (int) var jump_speed = -400
export (int) var gravity = 1000

var velocity = Vector2()
var jumping = false
var jump_input = false
var node: KinematicBody2D = null

func set_jump_input(input: bool):
	jump_input = input

func set_horizontal_direction(x_velocity: int):
	# 1 = right, -1 = left, 0 =... neither.
	velocity.x = x_velocity * run_speed

func get_jump_velocity_from_input():
	if jumping and node.is_on_floor():
		jumping = false
		
	if jump_input and node.is_on_floor():
		jumping = true
		velocity.y = jump_speed

func _physics_process(delta):
	if not node:
		node = get_node(kinematicBody)
	
	get_jump_velocity_from_input()
	velocity.y += gravity * delta
	velocity = node.move_and_slide(velocity, Vector2(0,-1))
