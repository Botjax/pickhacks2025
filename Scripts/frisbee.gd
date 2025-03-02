extends CharacterBody2D

const SPEED = 600.0
@onready var timer = $Timer

func _physics_process(delta: float) -> void:
	print(timer.time_left)
	if timer.time_left == 0.0:
		# Add the gravity.
		if not is_on_floor():
			velocity += get_gravity() / 30.0 * delta

		# Get the input direction and handle the movement/deceleration.
		# As good practice, you should replace UI actions with custom gameplay actions.
		var direction = 1.0
		if direction:
			velocity.x = direction * SPEED

		move_and_slide()
