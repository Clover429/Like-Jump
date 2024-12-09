extends Control
@onready var label: Label = $Label
@onready var heart_1: AnimatedSprite2D = $Heart1
@onready var heart_2: AnimatedSprite2D = $Heart2
@onready var heart_3: AnimatedSprite2D = $Heart3
var hearts:int = 3
var coins:int = 0
var req_coins:int
signal get_lev_num

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	coins = 0


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
	
func add_coin():
	coins += 1
	if coins >= 10:
		label.position.x = 50	
	label.text = "%d" % coins
		
	
func changeHearts(lives:int):
	if hearts == 3:
		heart_3.play("empty")
		hearts -= 1
	elif hearts == 2:
		heart_2.play("empty")
		hearts -= 1
	elif hearts == 1:
		heart_1.play("empty")
	if lives == -1:
		if hearts == 3:
			heart_3.play("empty")
			heart_2.play("empty")
			heart_1.play("empty")
			hearts = 0
		elif hearts == 2:
			heart_2.play("empty")
			heart_1.play("empty")
			hearts = 0
		else:
			heart_1.play("empty")
			hearts = 0
		
		
func set_req_coins(lev_num:int):
	req_coins = lev_num
