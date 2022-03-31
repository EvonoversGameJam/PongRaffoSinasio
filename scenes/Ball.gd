extends Node2D

export(int) var speed := 200

onready var top_position: Position2D = get_node("TopPosition")
onready var bottom_position: Position2D = get_node("BottomPosition")

var top_bound := 0
var bottom_bound := 600

var direction := Vector2.ZERO

func _ready() -> void:
	randomize()
	direction = Vector2(randf(), randf()).normalized()

func _process(delta: float) -> void:
	var velocity = self.direction * self.speed * delta
	
	var new_top_position = self.top_position.global_position + velocity
	if new_top_position.y <= self.top_bound:
		self.direction.y = -self.direction.y
		velocity = self.direction * speed * delta
	
	var new_bottom_position = self.bottom_position.global_position + velocity
	if new_bottom_position.y >= self.bottom_bound:
		self.direction.y = -self.direction.y
		velocity = self.direction * speed * delta
	
	self.position += velocity
