class_name Player
extends CharacterBody2D

@export var MOVEMENT_SPEED = 300
@export var health = 3
@export var invicibility_timer: Timer

func _physics_process(delta):
	if not GameManager.is_running: return
	velocity.x = MOVEMENT_SPEED * (Input.get_action_strength("right") - Input.get_action_strength("left"))
	velocity.y = MOVEMENT_SPEED * (Input.get_action_strength("bottom") - Input.get_action_strength("up"))
	
	if Input.is_mouse_button_pressed(MOUSE_BUTTON_LEFT):
		velocity = get_local_mouse_position()
		velocity = MOVEMENT_SPEED * velocity.normalized()
		if ((position + velocity * delta) - get_global_mouse_position()).length_squared() < 10:
			velocity = Vector2.ZERO
			position = get_global_mouse_position()
	
	if int(invicibility_timer.time_left / 0.2) % 2 == 0:
		show()
	else:
		hide()
	
	move_and_slide()
	if position.y < get_viewport().get_size().y * 2/3:
		position.y = get_viewport().get_size().y * 2/3

func damage(damage):
	if not invicibility_timer.is_stopped():
		return
	health = max(0, health - damage)
	Global.camera.shake(5 * damage)
	invicibility_timer.start()

func _on_shoot_timer_timeout() -> void:
	var bullet = Bullet.create(true, position)
	get_tree().current_scene.add_child(bullet)
