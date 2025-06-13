extends CharacterBody2D

var speed = 12500
var player = null
var bullet = null
var enemy = null
func _ready():
	player = get_tree().get_first_node_in_group("player")
	bullet = get_tree().get_nodes_in_group("bullet")
	add_to_group("enemy")
func _physics_process(delta: float):
	#передвижение
	velocity = Vector2.ZERO
	velocity = position.direction_to(player.position) * speed * delta
	move_and_collide(velocity * delta)
	#поворот сприта
	if velocity.normalized().x < 0:
		$enemy_sprite.flip_h = false
	else:
		$enemy_sprite.flip_h = true
func _on_area_entered():
	
	
	
	
