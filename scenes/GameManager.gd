extends Node


onready var score_counter: ScoreCounter = get_node("ScoreCounter")
var max_score = 10

func _process(delta):
	if Input.is_action_just_pressed("ui_cancel"):
		get_tree().paused = true
		$PauseMenu.show()



func _on_unpause():
	$PauseMenu.hide()
	get_tree().paused = false


func _on_main_menu():
	get_tree().paused = false
	get_tree().change_scene("res://scenes/Menu.tscn")


func _on_Game_players_score(score_1, score_2):
	score_counter.set_score_1(score_1)
	score_counter.set_score_2(score_2)

	var winner
	if (score_1 == max_score):
		winner = "Player One"
	elif (score_2 == max_score):
		winner = "Player Two"
	
	if winner != null:
		$GameOver.set_text(winner + " wins")
		$GameOver.show()
		get_tree().paused = true
		return


func _on_restart() -> void:
	$ScoreCounter.reset_scores()
	$Game.init()
	$PauseMenu.hide()
	$GameOver.hide()
	get_tree().paused = false
	
