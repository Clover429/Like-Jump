extends PathEnemyBase


@onready var animated_sprite_2d: AnimatedSprite2D = $Path2D/PathFollow2D/AnimatedSprite2D
@onready var shoot_timer: Timer = $ShootTimer
@onready var shooter: Node2D = $Shooter

var speed:float = 25
var can_shoot:bool = false
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	animated_sprite_2d.play("default")
	shoot_timer.wait_time = randf_range(2, 3)
	shoot_timer.start()
	


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta: float) -> void:
	super._physics_process(delta)
	path_follow_2d.progress += speed * delta
	
	if can_shoot:
		var pos:Vector2 = Vector2(animated_sprite_2d.global_position.x, animated_sprite_2d.global_position.y + 2)
		shooter.shoot(pos, Vector2(0, 1), false, 2.0, 20)
		shooter.shoot(pos, Vector2(-1, 0), false, 2.0, 20)
		shooter.shoot(pos, Vector2(1, 0), false, 2.0, 20)
		shooter.shoot(pos, Vector2(0, -1), false, 2.0, 20)
		can_shoot = false
		shoot_timer.wait_time = randf_range(2, 3)
		shoot_timer.start()
		
	


func _on_shoot_timer_timeout() -> void:
	can_shoot = true
	
