extends CharacterBody2D
# Player variables
# Speed
const Maxspeed = 300
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
func _physics_process(delta):
	move(delta)
	
#If <dodgekey> is pressed...

	# Dodge! ( Snap the player forwards in the current direction they're moving in)
	
#If <enemysword> touches player..
	# How much momentum was the enemysword going by?
	# What's the enemysword's damage stat? ( based on a swords weight/size)
	# Multiply momentum x damage and apply damage to health!
	# Input is zero
var input = Vector2.ZERO
# Detect which way the player is moving (in number format)
func getinput():
	# x value inputs
	# If "RIGHT" is pressed, bool returns 1. Subracted by "left" is zero. That means we're going right
	# Otherwise, it'll equal -1, going left.
	# Int makes "true" or "false" into a number
	input.x = int(Input.is_action_pressed("Right")) - int(Input.is_action_pressed("Left"))
	# y value inputs
	input.y = int(Input.is_action_pressed("Down")) - int(Input.is_action_pressed("Up"))
	return input.normalized()

func move(delta):
	input = getinput()
	## makes diagonal movement not go so fast (doesn't add left and up movement together to go faster, for example)
	position += velocity.normalized() * Maxspeed * delta 
	# If the player isn't pressing anything (stopped moving)
	if(input == Vector2.ZERO):
		print("player stopped pressing keys")
		#apply friction!
		if velocity.length() >(friction * delta):
			# Decrease the players speed slowly
			velocity -=velocity.normalized() * (friction * delta)
		else:
			#once friction can't be applied, player stops moving entirely.
			velocity = Vector2.ZERO
	 # Otherwise the player *is* moving
	else:
		# Move in the direction the player wants to move
		velocity += (input * accel * delta)
		velocity = velocity.limit_length(Maxspeed)
	move_and_slide()

#func applyfriction(amount):
	#if velocity.length() > (amount):
		#print("friction")
		##normalized means it gets rid of speed, and only uses direction
		#velocity -= velocity.normalized() * amount
#func applymovement(amount):
	#print("what's happenin")
	#velocity += (amount)
	#velocity = velocity.limit_length(Maxspeed)
# function that, while on the choosing worde scene, takes the players inputs into a list
# After taking them into a list, merge these into a single string to form a word.
# Pass this onto the word node.


