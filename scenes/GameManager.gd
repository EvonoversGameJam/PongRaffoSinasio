extends Node

onready var score_counter: ScoreCounter = get_node("ScoreCounter")

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


func _on_Game_players_score(score_1, score_2):
	score_counter.set_score_1(score_1)
	score_counter.set_score_2(score_2)


func _on_PauseMenu_restart() -> void:
	$ScoreCounter.reset_scores()
	$Game.init()
	$PauseMenu.hide()
	get_tree().paused = false
