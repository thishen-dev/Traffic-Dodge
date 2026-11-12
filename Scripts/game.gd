extends Node2D

const ENEMY_SCENE = preload("res://Scenes/EnemyCars.tscn")

var health = 3
var score = 0

@onready var difficulty_board: TextureRect = $LevelBoard

var level1_image = preload("res://Assets/Background/Level 1.png")
var level2_image = preload("res://Assets/Background/Level 2.png")
var level3_image = preload("res://Assets/Background/Level 3.png")

func _on_enemy_spawn_timer_timeout() -> void:
	var enemy = ENEMY_SCENE.instantiate()
	var random_x = randf_range(410.0, 611.0)
	enemy.position = Vector2(random_x, -100)
	$EnemyContainer.add_child(enemy)


func update_health_display() -> void:
	$Hearts/Heart_1.visible = health >= 1
	$Hearts/Heart_2.visible = health >= 2
	$Hearts/Heart_3.visible = health >= 3

func update_score_display() -> void:
	$Score.text = str(score)
	update_difficulty_display()


func update_difficulty_display() -> void:
	if score >= 1000:
		difficulty_board.texture = level3_image
	elif score >= 500:
		difficulty_board.texture = level2_image
	else:
		difficulty_board.texture = level1_image	

func check_victory() -> void:
	if score >= 999999999:
		await get_tree().create_timer(1.0).timeout
		get_tree().change_scene_to_file("res://Scenes/Victory.tscn")
		
		
func _ready() -> void:
	update_score_display()
	update_difficulty_display()






	
