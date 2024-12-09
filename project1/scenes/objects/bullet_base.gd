extends Area2D


var direction:Vector2 = Vector2.ZERO
var speed = 0
var lifetime = 0.0
var time = 0.0


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	position += direction * speed * delta
	check_time(delta)

func setup(dir, bSpeed, pos, time):
	position = pos
	position.y -= 2.5
	direction = dir
	speed = bSpeed
	lifetime = time
	
func check_time(delta):
	time += delta
	if time > lifetime:
		queue_free()


func _on_area_entered(area: Area2D) -> void:
	queue_free()
