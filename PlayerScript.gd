extends CharacterBody2D
# Player variables
# Speed
const Maxspeed = 500
#acceleration
const accel = 1500
const friction = 600
# Health varaible
# Mass/Weight(?) For knockback when hit.
# 'Wins' Variable
# "UsedWords" List that stores the previously used valid word.
# DodgeTimer variable. This will go up or down depending on the wielded swords weight/size.
# Velocity ( to move the player)

# Equivalent of "Draw" Function. Delta is telling it to process from the last complete frame
func _process(delta):
	
	# If up is pressed..
	if Input.is_action_pressed("Up"):
		# Go up!
		velocity += Vector2.UP.rotated(rotation)
		
# If left is pressed..
	if Input.is_action_pressed("Left"):
		# Go left!
		velocity += Vector2.LEFT.rotated(rotation)
		# If Right is pressed...
	if Input.is_action_pressed("Right"):
		# Go right!
		velocity += Vector2.RIGHT.rotated(rotation)
		
		
	if Input.is_action_pressed("Down"):
	# Go down!
		
		velocity += Vector2.DOWN.rotated(rotation)
		# makes diagonal movement not fast
	position += velocity.normalized() * Maxspeed * delta 
	if velocity == Vector2.ZERO:
	
		if velocity.length() > (friction * delta):
			print("h")
			#normalized means it gets rid of speed, and only uses direction
			velocity -= velocity.normalized() * (friction * delta)
		#else:
			#velocity = Vector2.ZERO
		else:
			velocity += (Vector2.ZERO * accel * delta)
			velocity = velocity.limit_length(Maxspeed)
	move_and_slide()
#If <dodgekey> is pressed...

	# Dodge! ( Snap the player forwards in the current direction they're moving in)
	
#If <enemysword> touches player..
	# How much momentum was the enemysword going by?
	# What's the enemysword's damage stat? ( based on a swords weight/size)
	# Multiply momentum x damage and apply damage to health!
	
# function that, while on the choosing worde scene, takes the players inputs into a list
# After taking them into a list, merge these into a single string to form a word.
# Pass this onto the word node.


