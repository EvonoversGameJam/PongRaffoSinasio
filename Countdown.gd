extends Label


var remaining_time = 3
var previous_time = 3
var timeout_finished = false


# Called when the node enters the scene tree for the first time.
func _ready():
	self.text = '3'
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	remaining_time -= delta
	var rounded_time = abs(ceil(remaining_time))
	if rounded_time != previous_time and not timeout_finished:
		previous_time = rounded_time
		self.text = String(previous_time)
	if previous_time == 0 and not timeout_finished:
		timeout_finished = true
		print("CIAO")
		emit_signal("start")
	
