extends Node2D

func play_button_click() -> void:
	$ButtonClick.play()
	
func _on_p_button_pressed() -> void:
	play_button_click()
	await get_tree().create_timer(0.2).timeout
	get_tree().change_scene_to_file("res://Scenes/Game.tscn")
	
func _on_instruction_pressed() -> void:
	play_button_click()
	await get_tree().create_timer(0.2).timeout
	get_tree().change_scene_to_file("res://Scenes/Instruction.tscn")

func _on_q_button_pressed() -> void:
	play_button_click()
	await get_tree().create_timer(0.3).timeout
	get_tree().quit()
	







	
