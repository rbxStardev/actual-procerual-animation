extends Node2D
class_name Controller

@export var target: Node2D
@export var max_speed: float = 300.0
@export var slow_radius: float = 64.0
@export var stop_radius: float = 5.0

var moving: bool = false

func _process(delta: float) -> void:
	if not target or not moving:
		return
	
	var mouse_pos = get_global_mouse_position()
	var distance = target.global_position.distance_to(mouse_pos)
	
	if distance < stop_radius:
		return
	
	var speed = max_speed
	if distance < slow_radius:
		speed = max_speed * (distance / slow_radius)
	
	var direction = (mouse_pos - target.global_position).normalized()
	target.global_position += direction * speed * delta
	
	target.look_at(mouse_pos)

func _input(event: InputEvent) -> void:
	if event.is_action_pressed("Move"):
		moving = true
	elif event.is_action_released("Move"):
		moving = false
