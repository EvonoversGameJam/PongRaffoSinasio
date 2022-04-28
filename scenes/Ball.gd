extends Node2D
class_name Ball

export(int) var speed := 200

onready var top: Position2D = get_node("Top")
onready var bottom: Position2D = get_node("Bottom")
onready var left: Position2D = get_node("Left")
onready var right: Position2D = get_node("Right")


var direction := Vector2.ZERO


func _ready() -> void:
	randomize()
	direction = Vector2(randf(), randf()).normalized()


func _process(delta: float) -> void:
	var velocity = self.direction * self.speed * delta
	
	self.position += velocity
