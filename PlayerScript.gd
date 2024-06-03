extends Sprite2D
# Player variables
# Speed
var speed = 500
# Rotation Speed
var angspeed = 5
# Direction node ( to turn the player)
var direction = 0
# Health varaible
# Mass/Weight(?) For knockback when hit.
# 'Wins' Variable
# "UsedWords" List that stores the previously used valid word.
# DodgeTimer variable. This will go up or down depending on the wielded swords weight/size.
# Velocity ( to move the player)
var velocity = Vector2.ZERO
# Equivalent of "Draw" Function. Delta is telling it to process from the last complete frame
func _process(delta):
	# Rotation is the rotation speed multiplied by the chosen direction multiplied by the time between frames ( to keep a smoooth look if FPS drops)
	rotation += angspeed * direction * delta
	# If up is pressed..
	if Input.is_action_pressed("Up"):
		# Go up!
		velocity = Vector2.UP.rotated(rotation) * speed
# if "W" isn't actively held down don't move the character
	else:
		velocity= Vector2.ZERO
	

	position += velocity * delta
# If left is pressed..
	if Input.is_action_pressed("Left"):
		# Go left!
		direction = -1
		print("moved left")
	# if the keys aren't actively pressed down dont turn
	else:
		direction = 0
		# If Right is pressed...
	if Input.is_action_pressed("Right"):
		# Go right!
		direction = 1
		print("moved right")
#If <dodgekey> is pressed...

	# Dodge! ( Snap the player forwards in the current direction they're moving in)
	# This will depend on the sword the player is wielding. The larger and heavier it is, the less distance and higher cooldown.
#If <enemysword> touches player..
	# How much momentum was the enemysword going by?
	# What's the enemysword's damage stat? ( based on a swords weight/size)
	# Multiply momentum x damage and apply damage to health!
	
# function that, while on the choosing worde scene, takes the players inputs into a list
# After taking them into a list, merge these into a single string to form a word.
# Pass this onto the word node.


