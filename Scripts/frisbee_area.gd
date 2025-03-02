extends Area2D

var GRAVITY = ProjectSettings.get_setting("physics/2d/default_gravity")
const SPEED = 600.0
@onready var timer = $Timer
var velocity: Vector2 = Vector2.ZERO

func _physics_process(delta: float) -> void:	
	visible = false
	
	if timer.time_left == 0:
		visible = true
		
		velocity.y += (GRAVITY / 25) * delta
		
		var direction = 1.0
		if direction:
			velocity.x = direction * SPEED
		else:
			velocity.x = 0
		
		position += velocity * delta
		
		


func _on_body_entered(body: Node2D) -> void:
	#var script = body.get_script()
	#if script and script.has_property("frisbee_caught"):'
	if body is Object and "frisbee_caught" in body:
		body.frisbee_caught = true
		body.reset_timer.start()
		body.play_frisbee_sound()
		body.frisbee_passed = true
	else:
		pass
	queue_free()
