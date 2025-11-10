class_name Score
extends Node2D

@export var label: Label
var value: int

func _process(delta: float) -> void:
	if not GameManager.is_running: return
	if GameManager.score != value:
		set_text(GameManager.score)
		value = GameManager.score
	
func set_text(value: int):
	var formatted = str(value).pad_zeros(6)
	label.text = formatted
