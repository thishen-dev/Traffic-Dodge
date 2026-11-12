extends Sprite2D

func play_button_click() -> void:
	$ButtonClick.play()
	 
func _on_back_pressed() -> void:
	play_button_click()
	await get_tree().create_timer(0.2).timeout
	get_tree().change_scene_to_file("res://Scenes/Main.tscn")
