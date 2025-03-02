extends Sprite2D
var flip = 1
var time = 0

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta: float) -> void:
	time += delta * 5
	flip = sin(time)
	scale.x = flip * 0.5
