extends Sprite2D  # или другой узел, к которому прикреплен спрайт

var breathing_speed: float = 2.0  # Скорость дыхания
var breathing_intensity: float = 0.005  # Интенсивность (5% увеличения)
var sprite_original_scale = 0.05
var time: float = 0.0

func _process(delta):
	time += delta * breathing_speed
	var scale_factorx = sprite_original_scale + sin(time) * breathing_intensity
	var scale_factory = sprite_original_scale + cos(time) * breathing_intensity
	scale = Vector2(scale_factorx, scale_factory)
