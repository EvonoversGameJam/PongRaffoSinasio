extends Control
class_name ScoreCounter

onready var score_1: Label = get_node("HBoxContainer/Score1")
onready var score_2: Label = get_node("HBoxContainer/Score2")

func set_score_1(value:int):
	score_1.text = str(value)
	
func set_score_2(value):
	score_2.text = str(value)
	
func reset_scores():
	set_score_1(0)
	set_score_2(0)
