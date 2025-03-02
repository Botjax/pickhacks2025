extends Area2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_body_entered(body: Node2D) -> void:
	print("AHHH")
	body.timer.wait_time = 2
	body.timer.start()
	$AudioStreamPlayer.play()
	body.checkpoint_count += 1
	if body.checkpoint_count == 1:
		if not body.frisbee_passed:
			get_tree().change_scene_to_file("res://Objects/Obstacle_Course.tscn")
	elif body.checkpoint_count == 2:
		if body.hoops_passed < 4:
			body.position.x = 2355
			body.position.y = 0
			body.hoops_passed = 0
			body.checkpoint_count -= 1
