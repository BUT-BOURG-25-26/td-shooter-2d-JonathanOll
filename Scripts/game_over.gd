extends Node2D

@export var player: Player

func _process(delta):
	if !visible && player.health == 0:
		show()
		Global.camera.shake(20)
		GameManager.is_running = false
		

func _on_restart_pressed() -> void:
	get_tree().reload_current_scene()
	GameManager.is_running = true
	GameManager.score = 0

func _on_quit_pressed() -> void:
	get_tree().quit()
