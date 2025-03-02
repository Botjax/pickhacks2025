extends ColorRect
const JUMP_VELOCITY = -20.0
var jump_meter = 0
var y_size = 0
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	y_size = size.y
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta: float) -> void:
	if Input.is_action_pressed("jump"):
		jump_meter += JUMP_VELOCITY
		jump_meter = clamp(jump_meter, -600.0, -200.0)
	if Input.is_action_just_released("jump"):
		jump_meter = 0
	size.y = ((jump_meter + 200) / -400) * y_size
