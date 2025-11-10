class_name Bullet
extends Area2D

static var packedScene: PackedScene = preload("res://Scenes/Bullet.tscn")

var shot_by_player: bool
@export var BULLET_SPEED = 500

func _physics_process(delta):
	if not GameManager.is_running: return
	position.y += (-1 if shot_by_player else 1) * BULLET_SPEED * delta

func _on_body_entered(body: Node2D) -> void:
	var layer = body.collision_layer
	if shot_by_player and layer == 2: # ennemi detruit
		body.queue_free()
		queue_free()
		GameManager.score += 100
	elif not shot_by_player and layer == 1:
		(body as Player).damage(1)
		queue_free()

static func create(shot_by_player: bool, pos: Vector2 = Vector2.ZERO):
	var node: Bullet = packedScene.instantiate()
	node.position = pos
	node.shot_by_player = shot_by_player
	return node
