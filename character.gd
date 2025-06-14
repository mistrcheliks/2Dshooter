extends CharacterBody2D
var health = 100
var move_speed = 150
func _ready():
	add_to_group('player')
func _process(delta: float):
	#передвижение игрока
	var direction = Input.get_vector("left", "right", "up", "down")
	velocity = direction * move_speed
	move_and_slide()
	
	#позиционирование камеры
	var vect = get_global_mouse_position() - position
	$Camera.position = Vector2(vect.x/8,vect.y/6)
	
	if global_position.direction_to(get_global_mouse_position()).normalized().x < 0:
		$character_sprite.flip_h = true
	else:
		$character_sprite.flip_h = false
		

func damage_player():
	health -= 25
	if health > 0:
		print('ouch')
	else:
		print('ded')
	
