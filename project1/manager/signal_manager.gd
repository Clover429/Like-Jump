extends Node

signal on_make_bullet(pos:Vector2, dir:Vector2, lifetime:float, speed:float, isPlayer:bool)
signal coin_collected()
signal won_level()
signal level_selected(coins:int, cameraL:int, cameraR:int)
