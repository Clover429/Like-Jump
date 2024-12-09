extends Node2D

func shoot(pos:Vector2, dir:Vector2, isPlayer:bool, lifetime:float, speed:float):
	Signals.on_make_bullet.emit(pos, dir, lifetime, speed, isPlayer)
