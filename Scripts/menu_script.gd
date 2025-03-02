extends Control


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$PlayButton.connect("button_down", _on_PlayButton_pressed)
	$AudioStreamPlayer.play()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_PlayButton_pressed():
	# Change the scene to the game scene
	get_tree().change_scene_to_file("res://Objects/Obstacle_Course.tscn")
	queue_free()
