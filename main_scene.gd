extends Node2D

const ANCHOR = preload("uid://jd5riuef2mjt")
const CONTROLLER = preload("uid://bwb7cde7bk21g")

#@export var points: Array[float] = [64, 84, 87, 85, 83, 77, 64, 60, 51, 38, 34, 32, 19, 15]
@export var points: Array[float] = [52, 58, 50, 60, 68, 71, 65, 60, 55, 50, 45, 40, 35, 30, 25, 20, 15, 10, 5, 5]
#@export var points: Array[float] = [64, 64]

var point_array: Array[Anchor]

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	if points.size() < 2:
		return
	var size: float = points.pop_front()
	var previous_anchor: Anchor = ANCHOR.instantiate()
	previous_anchor.desired_size = size
	var anchor_controller: Controller = CONTROLLER.instantiate()
	
	anchor_controller.target = previous_anchor
	
	add_child(previous_anchor)
	previous_anchor.add_child(anchor_controller)
	for i in points:
		var new_anchor: Anchor = ANCHOR.instantiate()
		new_anchor.desired_size = i
		previous_anchor.point = new_anchor
		previous_anchor = new_anchor
		
		add_child(previous_anchor)
		point_array.append(previous_anchor)
		


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
