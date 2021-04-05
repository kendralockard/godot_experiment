extends KinematicBody2D

export (int) var speed
var state = "idle"
var velocity = Vector2.ZERO

# Called when the node enters the scene tree for the first time.
func _ready():
	$sprite.play(state)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var input_velocity = get_input_vector()
		
	velocity = input_velocity.normalized() * speed
	var movement = velocity * delta
	move_and_slide(movement)
	
	if input_velocity == Vector2.ZERO:
		state = "idle"
	else:
		state = "walk"
		$sprite.flip_h = input_velocity.x < 0

	$sprite.play(state)

func get_input_vector():
	var input_velocity = Vector2.ZERO
	
	if Input.is_action_pressed("key_d"):
		input_velocity.x += 1
	if Input.is_action_pressed("key_a"):
		input_velocity.x -= 1
	if Input.is_action_pressed("key_s"):
		input_velocity.y += 1
	if Input.is_action_pressed("key_w"):
		input_velocity.y -= 1
		
	return input_velocity
