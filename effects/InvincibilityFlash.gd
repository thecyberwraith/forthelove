extends Node2D

class_name InvincibilityFlash
# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var node: Node2D = null
var timeout: float = 0.0
var time: float = 0.0

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func start_flash(var a_node: Node2D, var duration: float):
	node = a_node
	timeout = duration
	
func _process(delta):
	time += delta
	
	set_effect(time / timeout)
	
	if time >= timeout:
		clear_effect()
		queue_free()

func set_effect(time_ratio: float):
	node.modulate.a = 0.4*sin(20*PI*time_ratio) + 0.1

func clear_effect():
	node.modulate.a = 1.0
