extends Node2D

func _ready():
	$CharacterSkeleton/AnimationPlayer.stop()

func _process(_delta):
	$JumperPhysics.set_jump_input(Input.is_action_pressed("ui_select"))
	get_x_velocity_from_input()

func get_x_velocity_from_input():
	var right = Input.is_action_pressed("ui_right")
	var left = Input.is_action_pressed("ui_left")
	
	var x = 0
	
	if right:
		x += 1
	if left:
		x -= 1
	
	if x == 0:
		$CharacterSkeleton/AnimationPlayer.play("Idle")
	else:
		$CharacterSkeleton/AnimationPlayer.play("Run")
		$CharacterSkeleton.set_scale(Vector2(x,1));
	
	$JumperPhysics.set_horizontal_direction(x)
