extends CharacterBody2D

class_name EnemyBase

const FALLEN = 100
var is_dead:bool = false
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta: float) -> void:
	has_fallen()

func has_died():
	if is_dead:
		return
		
	is_dead = true
	
	hide()
	queue_free()

func has_fallen():
	if global_position.y > FALLEN:
		queue_free()


func _on_hit_box_area_entered(area: Area2D) -> void:
	has_died()
