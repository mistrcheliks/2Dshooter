extends Area2D

var speed = 2500
func _ready():
	add_to_group("bullet")
func _physics_process(delta):
	if global_position.direction_to(get_global_mouse_position()).normalized().x < 0:
		$bullet_sprite.flip_h = true
	else:
		$bullet_sprite.flip_h = false
	position += transform.x * speed * delta

	
