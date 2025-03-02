extends CharacterBody2D


const SPEED = 650.0
@onready var timer = $Timer

func _physics_process(delta: float) -> void:
	visible = false
	print(timer.time_left)
	if timer.time_left == 0:
		visible = true
		# Add the gravity.
		if not is_on_floor():
			velocity += get_gravity() / 25 * delta

		# Get the input direction and handle the movement/deceleration.
		var direction = 1.0
		if direction:
			velocity.x = direction * SPEED

		move_and_slide()
