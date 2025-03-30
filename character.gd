extends CharacterBody2D

var move_speed = 250
func _ready() -> void:
	pass
func _physics_process(delta: float):
	var move = Vector2()
	if Input.is_action_pressed('up'):
		move.y = move.y - 1
	if Input.is_action_pressed('down'):
		move.y = move.y + 1
	if Input.is_action_pressed('left'):
		move.x = move.x - 1
	if Input.is_action_pressed('right'):
		move.x = move.x + 1
	move = move.normalized()
	velocity = move * move_speed
	move_and_slide()
	
	
