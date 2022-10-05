extends Control
class_name ScoreCounter

onready var score_1: Label = get_node("HBoxContainer/Score1")
onready var score_2: Label = get_node("HBoxContainer/Score2")
onready var score_sound: AudioStreamPlayer = get_node("HBoxContainer/CrowdCheer")

func set_score_1(value:int):
	score_1.text = str(value)
	score_sound.play()
	
func set_score_2(value):
	score_2.text = str(value)
	score_sound.play()
	
	
func reset_scores():
	set_score_1(0)
	set_score_2(0)
