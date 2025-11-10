class_name Enemy
extends CharacterBody2D

enum Behavior {SINUSOIDAL, STATIC}

static var packedScene: PackedScene = preload("res://Scenes/Enemy.tscn")
@export var vertical_speed = 50
@export var horizontal_variation = 50
var base_position: Vector2
var behavior: Behavior

func _physics_process(delta: float) -> void:
	if not GameManager.is_running: return
	position.y += vertical_speed * delta
	if behavior == Behavior.SINUSOIDAL:
		position.x = base_position.x + sin(Time.get_ticks_msec() / (PI*1000/5)) * horizontal_variation

static func create(pos: Vector2 = Vector2.ZERO):
	var node: Enemy = packedScene.instantiate()
	node.base_position = pos
	node.position = pos
	node.behavior = Behavior.values()[randi_range(0, Behavior.size() - 1)]
	return node

func _on_shoot_timer_timeout() -> void:
	var bullet = Bullet.create(false, position)
	get_tree().current_scene.add_child(bullet)
