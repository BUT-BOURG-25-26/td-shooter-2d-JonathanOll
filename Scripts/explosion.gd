class_name Explosion
extends AnimatedSprite2D

static var packedScene: PackedScene = preload("res://Scenes/Explosion.tscn")

static func create(pos: Vector2):
	var node: Explosion = packedScene.instantiate()
	node.position = pos
	return node


func _on_animation_finished() -> void:
	queue_free()
