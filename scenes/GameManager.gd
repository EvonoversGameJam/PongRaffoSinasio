extends Node


func _process(delta):
	if Input.is_action_just_pressed("ui_cancel"):
		get_tree().paused = true
		$PauseMenu.show()



func _on_PauseMenu_unpause():
	$PauseMenu.hide()
	get_tree().paused = false


func _on_PauseMenu_main_menu():
	get_tree().paused = false
	get_tree().change_scene("res://scenes/Menu.tscn")
