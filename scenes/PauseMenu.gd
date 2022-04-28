extends Control
signal unpause
signal main_menu

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Continue_pressed():
	emit_signal("unpause")


func _on_MainMenu_pressed():
	emit_signal("main_menu")


func _on_Quit_pressed():
	get_tree().quit()
