extends Area2D

class_name DamageZone

export (int, 100) var damage_amount = 1
	
func _process(delta):
	for area in get_overlapping_areas():
		if area.has_method("damage"):
			area.damage(damage_amount, area)
