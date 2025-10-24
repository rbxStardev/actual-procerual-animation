extends Node2D
class_name Controller

@export var target: Node2D
var moving: bool = false
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if target and moving:
		target.global_position = get_global_mouse_position()


func _input(event: InputEvent) -> void:
	if event.is_action_pressed("Move"):
		moving = true
	elif  event.is_action_released("Move"):
		moving = false
