class_name EnemySpawner
extends Node

func _on_timer_timeout() -> void:
	if not GameManager.is_running: return
	var enemy = Enemy.create(Vector2(randi_range(200, get_viewport().get_visible_rect().size.x - 200), -100))
	get_tree().current_scene.add_child(enemy)
