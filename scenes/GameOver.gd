extends Control


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


func set_text(text):
	$Label.text = text



func _on_PleiegheinButton_mouse_entered():
	var values = [-1, 1]
	var space_amount = (values[randi() % 2] * 100)
	$Pleieghein.margin_left += space_amount
	$Pleieghein.margin_bottom += space_amount
	$Pleieghein.margin_right += space_amount
	$Pleieghein.margin_top += space_amount


func _on_Quit_pressed():
	get_tree().quit()
