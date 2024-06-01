extends Sprite2D
var speed = 500
var angspeed = 5
var direction = 0
var velocity = Vector2.ZERO
func _process(delta):
	rotation += angspeed * direction * delta
	if Input.is_action_pressed("Up"):
		velocity = Vector2.UP.rotated(rotation) * speed
# if "W" isn't actively held down don't move the character
	else:
		velocity= Vector2.ZERO
	

	position += velocity * delta
	# Character input
	if Input.is_action_pressed("Left"):
		direction = -1
		print("moved left")
	# if the keys aren't actively pressed down dont turn
	else:
		direction = 0
	if Input.is_action_pressed("Right"):
		direction = 1
		print("moved right")



