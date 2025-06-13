extends CharacterBody2D

var bullet = preload('res://bullet.tscn')
var on_cooldown: bool = false
var spread = deg_to_rad(5) 


func _physics_process(delta: float): 
	look_at(get_global_mouse_position())
	if global_position.direction_to(get_global_mouse_position()).normalized().x < 0:
		$gun_sprite.flip_v = true
	else:
		$gun_sprite.flip_v = false
	
func _process(delta: float):
	if Input.is_action_pressed("m1") and on_cooldown == false:
		on_cooldown = true
		shoot()
		$Timer.start()
		
func _on_timer_timeout():
	on_cooldown = false
		
func shoot(): 
	var bullet = bullet.instantiate()
	get_tree().root.add_child(bullet)
	bullet.global_transform = $gunpoint.global_transform
	
