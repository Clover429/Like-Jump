extends Node2D


func _on_level_1_pressed() -> void:
	Signals.level_selected.emit(8, -50, 600)
	get_tree().change_scene_to_file("res://scenes/levels/level_1.tscn")
	


func _on_level_2_pressed() -> void:
	Signals.level_selected.emit(7, -70, 550)
	get_tree().change_scene_to_file("res://scenes/levels/level_2.tscn")


func _on_level_3_pressed() -> void:
	Signals.level_selected.emit(20, -32, 540)
	get_tree().change_scene_to_file("res://scenes/levels/level_3.tscn")


func _on_level_4_pressed() -> void:
	Signals.level_selected.emit(36, -512, 608)
	get_tree().change_scene_to_file("res://scenes/levels/level_4.tscn")


func _on_level_5_pressed() -> void:
	Signals.level_selected.emit(33, -64, 108)
	get_tree().change_scene_to_file("res://scenes/levels/level_5.tscn")
