extends Area2D

class_name Hitbox

signal damaged;

func damage(amount: int):
	emit_signal("damaged", amount)
