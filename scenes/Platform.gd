extends Node2D
class_name Platform

export (int) var velocity := 50
export (int) var rotation_velocity := 30
export (int) var max_bounce_rotation := 75

onready var top_left: Position2D = get_node("TopLeft")
onready var bottom_right: Position2D = get_node("BottomRight")

var _forward: Vector2 = Vector2.UP


func _process(delta: float) -> void:
	var direction := (self.global_position - to_global(self._forward)).normalized()
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


func _move_platform(direction, degrees) -> Vector2:
	return direction.rotated(deg2rad(degrees)) * self.velocity * get_process_delta_time()
	

func collides(point: Vector2) -> Vector2:
	"""
	Return bounce direction when point is within platform bounds.
	Otherwise return a Vector2.ZERO
	"""
	var local_point := self.to_local(point)
	
	if (local_point.x <= self.bottom_right.position.x and
		local_point.x >= self.top_left.position.x and
		local_point.y >= self.top_left.position.y and
		local_point.y <= self.bottom_right.position.y
		):
		var bounce_rotation := local_point.x / self.bottom_right.position.x * self.max_bounce_rotation
		var bounce_direction := self._forward.rotated(
			deg2rad(bounce_rotation)
		).normalized()
		
		if self._forward.dot(local_point.normalized()) < 0:
			bounce_direction.y *= -1
		
		return bounce_direction
	
	return Vector2.ZERO
