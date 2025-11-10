class_name Player
extends CharacterBody2D

@export var MOVEMENT_SPEED = 300
@export var health = 3
@export var invicibility_timer: Timer

func _physics_process(delta):
	velocity.x = MOVEMENT_SPEED * (Input.get_action_strength("right") - Input.get_action_strength("left"))
	
	if Input.is_mouse_button_pressed(MOUSE_BUTTON_LEFT):
		velocity.x = clamp(get_global_mouse_position().x - position.x, - MOVEMENT_SPEED, MOVEMENT_SPEED)
	
	move_and_slide()

func damage(damage):
	if not invicibility_timer.is_stopped():
		return
	health = max(0, health - damage)
	Global.camera.shake(5 * damage)
	invicibility_timer.start()

func _on_shoot_timer_timeout() -> void:
	var bullet = Bullet.create(true, position)
	get_tree().current_scene.add_child(bullet)
