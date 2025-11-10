class_name HealthBar
extends Node2D

var value = 0
@export var player: Player
@export var life_container: HBoxContainer
@export var life_texture: TextureRect

func _process(delta):
	if not GameManager.is_running: return
	var delt = player.health - value
	if delt > 0:
		for i in range(delt):
			life_container.add_child(life_texture.duplicate())
	elif delt < 0:
		for child in life_container.get_children():
			delt += 1
			if delt > 0 : break
			child.queue_free()
	value = player.health
		
