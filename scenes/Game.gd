extends Node2D
class_name Game

onready var platform: Platform = get_node("Platform")
onready var ball: Ball = get_node("Ball")

var _top_left := Vector2(0,0)
var _bottom_right := Vector2(1024,600)


func _process(delta: float) -> void:

	# Platform collision with ball
	var ball_top := self.ball.top.global_position
	var ball_bottom := self.ball.bottom.global_position
	var ball_left := self.ball.left.global_position
	var ball_right := self.ball.right.global_position
	
	self._check_collision(self.platform, ball_bottom)
	self._check_collision(self.platform, ball_top)
	self._check_collision(self.platform, ball_left)
	self._check_collision(self.platform, ball_right)

	# Ball collision with borders
	if ball_top.y <= self._top_left.y or ball_bottom.y >= self._bottom_right.y:
		self.ball.direction.y *= -1
	
	if ball_left.x <= self._top_left.x or ball_right.x >= self._bottom_right.x:
		self.ball.direction.x *= -1


func _check_collision(platform: Platform, ball_position: Vector2) -> void:
	var direction = platform.collides(ball_position)
	if direction != Vector2.ZERO:
		self.ball.direction = direction
