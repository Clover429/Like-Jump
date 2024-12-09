extends Node2D

const PLAYER_BULLET = preload("res://scenes/objects/player_bullet.tscn")
const ENEMY_BULLET = preload("res://scenes/objects/enemy_bullet.tscn")

func _ready():
	print("c")
	Signals.on_make_bullet.connect(shoot)

func shoot(pos:Vector2, dir:Vector2, lifetime:float, speed:float, isPlayer:bool):
	if isPlayer:
		var new_bullet = PLAYER_BULLET.instantiate()
		new_bullet.setup(dir, speed, pos, lifetime)
		call_deferred("add_child", new_bullet)
	else:
		var new_bullet = ENEMY_BULLET.instantiate()
		new_bullet.setup(dir, speed, pos, lifetime)
		call_deferred("add_child", new_bullet)
	
