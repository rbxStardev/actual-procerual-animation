extends Node2D
class_name Anchor

@export var desired_distance: float = 64
@export var desired_size: float = 64.0
@export var point: Anchor

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


func  _draw() -> void:
	draw_circle(Vector2.ZERO, desired_size, Color.WHITE, false, 10.0)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	queue_redraw()
	pass


func _physics_process(delta: float) -> void:
	if !point:
		return
	
	var vector_to_point: Vector2 = (point.global_position - global_position).normalized()
	var desired_position: Vector2 = vector_to_point * desired_distance
	
	var point_to_vector: Vector2 = (global_position - point.global_position).normalized()
	
	point.global_position = global_position + desired_position
	point.global_rotation = atan2(point_to_vector.y, point_to_vector.x)
