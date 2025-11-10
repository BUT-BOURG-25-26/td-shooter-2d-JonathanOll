extends Node2D

@export var player: Player

func _process(delta):
	if hidden && player.health == 0:
		show()
		Global.camera.shake(20)
		

func _on_restart_pressed() -> void:
	get_tree().reload_current_scene()  # Godot 4

func _on_quit_pressed() -> void:
	get_tree().quit()
