extends Node2D

@onready var timer = $Timer
var started = false

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if started && timer.time_left <= 0:
		get_tree().change_scene_to_file("res://Objects/main_menu.tscn")
	pass




func _on_area_2d_body_entered(body: Node2D) -> void:
	timer.wait_time = 5
	timer.start()
	started = true
	if body is Object and "finished" in body:
		body.finished = true
