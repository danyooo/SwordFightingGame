extends Sprite2D
# Player variables
# Speed
var speed = 500

# Health varaible
# Mass/Weight(?) For knockback when hit.
# 'Wins' Variable
# "UsedWords" List that stores the previously used valid word.
# DodgeTimer variable. This will go up or down depending on the wielded swords weight/size.
# Velocity ( to move the player)
var velocity = Vector2.ZERO
# Equivalent of "Draw" Function. Delta is telling it to process from the last complete frame
func _process(delta):
	# If up is pressed..
	if Input.is_action_pressed("Up"):
		# Go up!
		velocity = Vector2.UP.rotated(rotation) * speed
		print("moved up")
# 
	
	

	position += velocity * delta
# If left is pressed..
	if Input.is_action_pressed("Left"):
		# Go left!
		velocity = Vector2.LEFT.rotated(rotation) * speed

		print("moved left")
	# if the keys aren't actively pressed down dont turn
	
		
		# If Right is pressed...
	elif Input.is_action_pressed("Right"):
		# Go right!
		velocity = Vector2.RIGHT.rotated(rotation) * speed
		print("moved right")

		
		
	elif Input.is_action_pressed("Down"):
	# Go down!
		
		velocity = Vector2.DOWN.rotated(rotation) * speed
		print("moved down")
		#var is_moving = true
		#If a movement key isn't pressed, nothing happens
	else:

		velocity= Vector2.ZERO
			
			
#If <dodgekey> is pressed...

	# Dodge! ( Snap the player forwards in the current direction they're moving in)
	
#If <enemysword> touches player..
	# How much momentum was the enemysword going by?
	# What's the enemysword's damage stat? ( based on a swords weight/size)
	# Multiply momentum x damage and apply damage to health!
	
# function that, while on the choosing worde scene, takes the players inputs into a list
# After taking them into a list, merge these into a single string to form a word.
# Pass this onto the word node.


