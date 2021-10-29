extends KinematicBody2D

func _ready():
	pass # Replace with function body.

var target = null

func _process(_delta):
	target = $PlayerDetectionZone.get_nearest_player()
	
	if target:
		var difference = target.global_position - global_position
		$JumperPhysics.set_horizontal_direction(int(difference.x / abs(difference.x)))
		$JumperPhysics.set_jump_input(difference.y > 0)
	else:
		$JumperPhysics.set_horizontal_direction(0)
		$JumperPhysics.set_jump_input(false)
