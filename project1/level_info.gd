extends Node

var level_coins:int = 1
var camera_left:int = -10000
var camera_right:int = 10000

func _ready():
	Signals.level_selected.connect(set_level_info)

func set_level_info(coins:int, cameraL:int, cameraR:int):
	level_coins = coins
	camera_left = cameraL
	camera_right = cameraR

func get_coins() -> int:
	return level_coins
	
func get_camera_left() -> int:
	return camera_left
	
func get_camera_right() -> int:
	return camera_right
