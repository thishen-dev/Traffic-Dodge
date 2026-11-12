extends Area2D

const SPEED: float = 400.0
const MIN_X: float = 472.5
const MAX_X: float = 670.0

func _process(delta: float) -> void:
	var direction: float = 0.0
	
	if Input.is_key_pressed(KEY_LEFT) or Input.is_key_pressed(KEY_A):
		direction =  - 1.0
	elif Input.is_key_pressed(KEY_RIGHT) or Input.is_key_pressed(KEY_D):
		direction = + 1.0
	
	position.x = position.x + direction * SPEED * delta
	position.x = clamp(position.x, MIN_X, MAX_X)
