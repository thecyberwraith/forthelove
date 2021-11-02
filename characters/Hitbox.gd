extends Area2D

class_name Hitbox

signal damaged;
signal invincible_time_started;
signal invincible_time_stopped;

export (float, 5) var invincible_time = 0.0

var invincible: bool = false
var time_till_vulnerable: float = 0.0

func damage(amount: int, damager: Node2D):
	if invincible:
		return
	
	emit_signal("damaged", amount, damager)
	
	if invincible_time != 0.0:
		invincible = true
		time_till_vulnerable = invincible_time
		monitorable = false
		emit_signal("invincible_time_started", invincible_time)

func _process(delta):
	if invincible:
		time_till_vulnerable -= delta
		if time_till_vulnerable <= 0:
			invincible = false
			monitorable = true
			emit_signal("invincible_time_stopped")
	
