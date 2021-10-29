extends Area2D

var players = []
# Called when the node enters the scene tree for the first time.
func _ready():
	connect("area_entered", self, "on_area_entered")
	connect("area_exited", self, "on_area_exited")

func get_nearest_player() -> Node2D:
	# Returns the nearest player entity, otherwise it returns null
	if len(players) > 0:
		return players[0]
	
	return null

func on_area_entered(target):
	players.append(target)

func on_area_exited(target):
	players.erase(target)
