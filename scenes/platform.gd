extends Node2D


# Declare member variables here. Examples:
export (int) var velocity = 50
export (int) var rotation_velocity = 30
onready var position_2d = get_node("Position2D")
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _process(delta):
	var direction = (self.global_position - self.position_2d.global_position).normalized()
	if Input.is_action_pressed("platform_right"):
		self.position += _move_platform(direction, -90)
	if Input.is_action_pressed("platform_left"):
		self.position += _move_platform(direction, 90)
	if Input.is_action_pressed("platform_down"):
		self.position += _move_platform(direction, 0)
	if Input.is_action_pressed("platform_up"):
		self.position += _move_platform(direction, 180)	
	if Input.is_action_pressed("platform_rotate_left"):
		self.rotation_degrees -= rotation_velocity * delta
	if Input.is_action_pressed("platform_rotate_right"):
		self.rotation_degrees += rotation_velocity * delta						
		
func _move_platform(direction, degrees):
	return direction.rotated(deg2rad(degrees)) * self.velocity * get_process_delta_time()
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
