extends Node2D
class_name Game

signal players_score(score_1, score_2)

onready var platform_one: Platform = get_node("Platform")
onready var platform_two: Platform = get_node("Platform2")
onready var ball_hit: AudioStreamPlayer = get_node("BallHit")
onready var wistle_blow: AudioStreamPlayer = get_node("WistleBlow")

onready var ball: Ball = get_node("Ball")

var _top_left := Vector2(0,0)
var _bottom_right := Vector2(1024,600)

var player_one_initial_position := Vector2(24, 300)
var player_two_initial_position := Vector2(1000, 300)

var score_1 = 0
var score_2 = 0

func _ready():
	platform_one.set_player_number('_one')
	platform_two.set_player_number('_two')

	init()


func init() -> void:
	platform_one.position = player_one_initial_position
	platform_one.rotation_degrees = 90

	platform_two.position = player_two_initial_position
	platform_two.rotation_degrees = -90

	ball.position = Vector2(512, 300)
	
	score_1 = 0
	score_2 = 0

	wistle_blow.play()


func _process(delta: float) -> void:

	# Platform collision with ball
	var ball_top := self.ball.top.global_position
	var ball_bottom := self.ball.bottom.global_position
	var ball_left := self.ball.left.global_position
	var ball_right := self.ball.right.global_position

	self._check_platform_collision(platform_one)
	self._check_platform_collision(platform_two)

	# Ball collision with borders
	if ball_top.y <= self._top_left.y or ball_bottom.y >= self._bottom_right.y:
		self.ball.direction.y *= -1
		ball_hit.play()

	if ball_left.x <= self._top_left.x or ball_right.x >= self._bottom_right.x:
		self.ball.direction.x *= -1
		ball_hit.play()
		if ball_left.x <= self._top_left.x:
			score_2 += 1
			emit_signal("players_score", score_1, score_2)
		if 	ball_right.x >= self._bottom_right.x:
			score_1 += 1
			emit_signal("players_score", score_1, score_2)



func _check_collision(platform: Platform, ball_position: Vector2) -> void:
	var direction = platform.collides(ball_position)
	if direction != Vector2.ZERO:
		self.ball.direction = direction
		ball_hit.play()

func _check_platform_collision(platform):
	self._check_collision(platform, self.ball.bottom.global_position)
	self._check_collision(platform, self.ball.top.global_position)
	self._check_collision(platform, self.ball.left.global_position)
	self._check_collision(platform, self.ball.right.global_position)
