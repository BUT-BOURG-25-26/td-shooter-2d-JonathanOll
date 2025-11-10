class_name Camera
extends Camera2D

var shake_intensity: float = 0
@export var shake_decrease: float = 10
var base_pos: Vector2

func _ready() -> void:
	Global.camera = self
	base_pos = position
	
func _process(delta: float) -> void:
	if shake_intensity > 0:
		print(shake_intensity)
		position = base_pos + Vector2(
			randf_range(-shake_intensity, shake_intensity),
			randf_range(-shake_intensity, shake_intensity),
		)
		shake_intensity -= shake_decrease * delta
	else:
		position = base_pos

func shake(intensity):
	shake_intensity = intensity
