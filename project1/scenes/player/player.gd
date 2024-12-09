extends CharacterBody2D

const gravity:float = 800.0
@export var speed:float = 70
@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D
@onready var camera_2d: Camera2D = $Camera2D
var count:int = 0
var lives:int = 3
var can_shoot:bool = false
var can_take_damage:bool = true
var has_not_fallen:bool = true
var has_not_won:bool = true
@onready var shooter: Node2D = $Shooter
@onready var shoot_timer: Timer = $ShootTimer
signal coin_collect
signal damage_taken
signal level_won
const FALLEN:float = 100.0
@onready var invincibility: Timer = $Invincibility
var req_coins:int = 5


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	can_shoot = true
	req_coins = LevelInfo.get_coins()
	camera_2d.limit_left = LevelInfo.get_camera_left()
	camera_2d.limit_right = LevelInfo.get_camera_right()
	Signals.coin_collected.connect(_on_coin_coin_collected)
	Signals.won_level.connect(level_win)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta: float) -> void:
	if not has_not_won:
		game_win()
		return
	if lives > 0 and has_not_fallen and has_not_won:
		var moveVector:Vector2 = Vector2.ZERO
		moveVector.x = Input.get_action_strength("right") - Input.get_action_strength("left")
		moveVector.y = -1 if Input.is_action_just_pressed("jump") else 0
	
	
		if not is_on_floor():
			velocity.y += gravity * delta
	
		velocity.x = moveVector.x * speed
	
		if is_on_floor() and moveVector.y < 0:
			velocity.y = 220 * moveVector.y
		
		if moveVector.x != 0:
			animated_sprite_2d.flip_h = true if moveVector.x < 0 else false
	
		if Input.is_action_just_pressed("shoot") and can_shoot:
			if animated_sprite_2d.flip_h:
				shooter.shoot(animated_sprite_2d.global_position, Vector2.LEFT, true, 1.5, 50)
			else:
				shooter.shoot(animated_sprite_2d.global_position, Vector2.RIGHT, true, 1.5, 50)
			can_shoot = false
			shoot_timer.start()
	
		move_and_slide()
		updateAnimation(moveVector)
		fallen()
	else:
		animated_sprite_2d.rotation_degrees = -90
		if not is_on_floor():
			velocity.y += gravity * delta
		velocity.x = 0
		move_and_slide()
		animated_sprite_2d.play("dead")
	
func updateAnimation(moveVector:Vector2):
	if not is_on_floor():
		animated_sprite_2d.play("jump")
	elif moveVector.x == 0:
		animated_sprite_2d.play("idle")
	elif moveVector.x != 0:
		animated_sprite_2d.play("walk")
		
func fallen():
	if global_position.y > FALLEN and has_not_fallen:
		damage_taken.emit(-1)
		has_not_fallen = false
	

func _on_shoot_timer_timeout() -> void:
	can_shoot = true
	
func _on_coin_coin_collected() -> void:
	count += 1
	coin_collect.emit(count)
	if count == req_coins:
		level_win()

func _on_hit_box_area_entered(area: Area2D) -> void:
	if can_take_damage:
		lives -= 1
		damage_taken.emit(lives)
		invincibility.start()
		can_take_damage = false
		
func game_win():
	pass

func reset_scene():
	get_tree().reload_current_scene()

func _on_invincibility_timeout() -> void:
	can_take_damage = true

func level_win():
	has_not_won = false
	level_won.emit()
	
	
