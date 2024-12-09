extends Node2D
@onready var counter: Control = $CanvasLayer/Counter
@onready var game_over: CanvasLayer = $GameOver
@onready var game_over_timer: Timer = $GameOver/GameOverTimer
@onready var level_clear: CanvasLayer = $LevelClear



func _ready():
	game_over.hide()
	level_clear.hide()

func _on_player_coin_collect(count:int) -> void:
	counter.add_coin()


func _on_player_damage_taken(lives: int) -> void:
	counter.changeHearts(lives)
	if lives <= 0:
		game_over_timer.start()
		
		
		

func _on_game_over_timer_timeout() -> void:
	get_tree().paused = true
	game_over.show()


func _on_player_level_won() -> void:
	get_tree().paused = true
	level_clear.show()
