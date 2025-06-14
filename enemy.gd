extends CharacterBody2D

var speed = 7750
var player = null
var bullet = null
var health = 100
func _ready():
	player = get_tree().get_first_node_in_group("player")
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

func die():
	#сделать анимацию смерти(взрыв крови)
	queue_free()
	
func handle_hit():
	health -= 25
	if health <= 0:
		die()



func _on_enemy_hurtbox_body_entered(body: CharacterBody2D) -> void:
	if body.has_method('damage_player'):
		body.damage_player()
		
