extends Control
signal restart

onready var label = $MarginContainer/Label
onready var pleieghein_btn = $VBoxContainer/Pleieghein
onready var quit_btn = $VBoxContainer/Quit

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


func set_text(text):
	label.text = text



func _on_Pleieghein_mouse_entered():
	var values = [-1, 1]
	var space_amount = (values[randi() % 2] * 100)
	pleieghein_btn.margin_left += space_amount
	pleieghein_btn.margin_bottom += space_amount
	pleieghein_btn.margin_right += space_amount
	pleieghein_btn.margin_top += space_amount


func _on_Quit_pressed():
	get_tree().quit()


func _on_Pleieghein_pressed():
	emit_signal("restart")
