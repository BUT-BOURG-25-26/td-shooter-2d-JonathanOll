class_name PowerUp
extends Sprite2D

var item

static var packedScene: PackedScene = preload("res://Scenes/Powerup.tscn")
static var items = [
	{
		"img": preload("res://KennyAssets/SpaceShooterRedux/Power-ups/pill_green.png"),
		"touched": "heal"
	},
	{
		"img": preload("res://KennyAssets/SpaceShooterRedux/Power-ups/bolt_gold.png"),
		"touched": "speed_boost"
	},
	{
		"img": preload("res://KennyAssets/SpaceShooterRedux/Power-ups/star_gold.png"),
		"touched": "bullet_speed_boost"
	}
]

static func create(pos: Vector2):
	var node: PowerUp = packedScene.instantiate()
	node.position = pos
	node.item = items[randi_range(0, items.size() - 1)]
	node.texture = node.item["img"]
	return node

func _on_timer_timeout() -> void:
	queue_free()

func _on_area_2d_body_entered(body: Node2D) -> void:
	if body is Player:
		(body as Player)[item["touched"]].call()
		queue_free()
