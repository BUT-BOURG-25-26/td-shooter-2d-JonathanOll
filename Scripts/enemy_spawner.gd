class_name EnemySpawner
extends Node

func _on_enemy_timer_timeout() -> void:
	if not GameManager.is_running: return
	var enemy = Enemy.create(Vector2(randi_range(200, get_viewport().get_visible_rect().size.x - 200), -100))
	get_tree().current_scene.add_child(enemy)
	
func _on_asteroid_timer_timeout() -> void:
	if not GameManager.is_running: return
	var asteroid = Asteroid.create()
	get_tree().current_scene.add_child(asteroid)

func _on_powerup_timer_timeout() -> void:
	if not GameManager.is_running: return
	var powerup = PowerUp.create(Vector2(
		randi_range(100, get_viewport().size.x - 100),
		randi_range(get_viewport().size.y * 2/3 + 100, get_viewport().size.y - 100),
	))
	get_tree().current_scene.add_child(powerup)
	
