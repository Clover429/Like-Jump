extends EnemyBase
@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D
@onready var detector: RayCast2D = $Detector

var direction:Vector2 = Vector2(50, 0)
var speed:float = 40.0
var gravity:float = 1500.0

func _ready() -> void:
	animated_sprite_2d.play("default")

func _physics_process(delta: float) -> void:
	super._physics_process(delta)
	
	if not is_on_floor():
		velocity.y = gravity * delta
	
	if animated_sprite_2d.flip_h:
		velocity.x = direction.x * speed * delta
	else:
		velocity.x = direction.x * -speed * delta
		
	move_and_slide()
	
	if is_on_wall() or not detector.is_colliding():
		animated_sprite_2d.flip_h = !animated_sprite_2d.flip_h
		detector.position.x = -detector.position.x
	
