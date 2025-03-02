extends CharacterBody2D

const SPEED = 250.0
const JUMP_VELOCITY = -20.0
var jump_meter: float = 0.0
var checkpoint_count = 0
@onready var corgi_sprite = $CorgiSprite
@onready var timer = $Timer
@onready var reset_timer = $ResetTimer
var frisbee_caught = false
var frisbee_passed = false
var hoops_passed = 0
var bones_collected = 0
var finished = false

func _physics_process(delta: float) -> void:
	if finished:
		corgi_sprite.play("Stand")
		if bones_collected == 0:
			var loser = get_node("../CanvasLayer/Control/Loser")
			loser.visible = true
		if bones_collected == 1:
			corgi_sprite.play("Bronze_Medal")
			var bronze_winner = get_node("../CanvasLayer/Control/BronzeWinner")
			bronze_winner.visible = true
		elif bones_collected == 2:
			corgi_sprite.play("Silver_Medal")
			var silver_winner = get_node("../CanvasLayer/Control/SilverWinner")
			silver_winner.visible = true
		elif bones_collected == 3:
			corgi_sprite.play("Gold_Medal")
			var gold_winner = get_node("../CanvasLayer/Control/GoldWinner")
			gold_winner.visible = true
		return
	velocity *= Vector2(0, 1)
	velocity += get_gravity() * delta
	if frisbee_caught:
		if reset_timer.time_left <= 0:
			frisbee_caught = false
	if timer.time_left == 0.0:
		if Input.is_action_pressed("jump"):
			jump_meter += JUMP_VELOCITY
			jump_meter = clamp(jump_meter, -600.0, -200.0)
		elif jump_meter < 0.0 && Input.is_action_just_released("jump") && is_on_floor():
			jump_meter = clamp(jump_meter, -600.0, -200.0)
			$JumpSound.play()
			velocity.y = jump_meter
			jump_meter = 0

		# Running right
		var direction = 1.0;
		if direction:
			velocity.x = direction * SPEED
			if not is_on_floor():
				if not frisbee_caught:
					corgi_sprite.play("Jump")
				else:
					corgi_sprite.play("Jump_Frisbee")
			else:
				if not frisbee_caught:
					corgi_sprite.play("Running")
				else:
					corgi_sprite.play("Running_Frisbee")
	else:
		if not frisbee_caught:
			corgi_sprite.play("Stand")
		else:
			corgi_sprite.play("Stand_Frisbee")
	move_and_slide()
	
func play_bone_sound()-> void:
	$BoneSound.play()
	
func play_frisbee_sound()-> void:
	$FrisbeeSound.play()
