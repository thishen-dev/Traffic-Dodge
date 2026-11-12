extends Area2D

var SPEED = 550.0

var car_images = [
	preload("res://Assets/Enemy_Cars/Enemy_1.png"),
	preload("res://Assets/Enemy_Cars/Enemy_2.png"),
	preload("res://Assets/Enemy_Cars/Enemy_3.png"),
	preload("res://Assets/Enemy_Cars/Enemy_4.png"),
	preload("res://Assets/Enemy_Cars/Enemy_5.png")
]

func _ready() -> void:
	$Sprite2D.texture = car_images.pick_random()
	
func _process(delta: float) -> void:
	var game = get_tree().current_scene
	var current_score = game.score
	
	if current_score >= 500:
		SPEED = 850.0
	elif current_score >= 250:
		SPEED = 700.0
	else:
		SPEED = 550.0
	
	position.y = position.y + SPEED * delta
	
	if position.y > 800.0:
		game.score = min(game.score + 10, 999999999)
		game.update_score_display()
		game.check_victory()
		queue_free()
		

func _on_area_entered(area: Area2D) -> void:
	if area.name == "Player":
		var game = get_tree().current_scene
		game.health -= 1
		game.update_health_display()

		if game.health <= 0:
			get_tree().set_meta("final_score", game.score)
			get_tree().change_scene_to_file("res://Scenes/GameEnd.tscn")
		else:
			queue_free()

		
