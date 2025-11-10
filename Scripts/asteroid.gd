class_name Asteroid
extends Node2D

static var packedScene: PackedScene = preload("res://Scenes/Asteroid.tscn")
static var min_speed = 300
static var max_speed = 700
var velocity: Vector2

func _physics_process(delta: float) -> void:
	position += velocity * delta

static func create():
	var node: Asteroid = packedScene.instantiate()
	node.position = Vector2(randf_range(860, 1200), randf_range(-300, -100))
	node.velocity = Vector2.DOWN.rotated(randf_range(0, 3*PI/8)) * randf_range(min_speed, max_speed)
	return node


func _on_area_2d_body_entered(body: Node2D) -> void:
	if body is Player:
		(body as Player).damage(1)
		queue_free()
