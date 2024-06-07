extends CharacterBody2D
# Player variables
# Speed
const Maxspeed = 500 # 500 default, this should change with swordsize
#acceleration
const accel = 1800
# friction; stopping power
const friction = 400
# Health variable
var health = 100
# Mass/Weight(?) For knockback when hit.
var mass = 20
var weight = 20
# 'Wins' Variable
var wins = 0
# "UsedWords" List that stores the previously used valid word.
var UsedWords = []
# DodgeTimer variable. This will go up or down depending on the wielded swords weight/size.
var dodgecooldown = 3 #  10 seconds by default. * SwordWeight?
# Dodge is available by default
var dodgeready = true
var dodgeDist = 20 # 20 default affected by swordWeight.
# Add a new velocity just for dodging
var dodgeVelocity: Vector2
# Equivalent of "Draw" Function. Delta is telling it to process from the last complete frame
func _physics_process(delta):
	move(delta)
	
	#If the dodge button is pressed AND the cooldown has expired..
	if Input.is_action_pressed("Dodge") && dodgeready == true:
		# This will depend on the sword the player is wielding. The larger and heavier it is, the less distance and higher cooldown.
		# Dodge!
		Dodge(input,dodgeDist, delta)
		# Dodge goes on cooldown
		$dodgecooldowntimer.set_wait_time(dodgecooldown)
		$dodgecooldowntimer.start()
		dodgeready = false
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
	# If the player isn't pressing anything (stopped moving)
	if input == Vector2.ZERO:
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
		# To dodge past max speed, add dodgevelocity ( so dodging isn't capped)
		velocity = velocity.limit_length(Maxspeed) + dodgeVelocity
		dodgeVelocity = Vector2.ZERO
	move_and_slide()
func wordChoose():
	pass
	# function that, while on the choosing worde scene, takes the players inputs into a list
	# After taking them into a list, merge these into a single string to form a word.
	# Pass this onto the word node.
func Dodge(Pinput,distance, delta):
	# jump forwards
	print("Dodged!")
	dodgeVelocity = ( Pinput * accel *  distance *  delta)
#If <enemysword> touches player..
	# How much momentum was the enemysword going by?
	# What's the enemysword's damage stat? ( based on a swords weight/size)
	# Multiply momentum x damage and apply damage to health!





	#When the tiemr is done
func _on_dodgecooldowntimer_timeout():
	# Set dodge ready to true
	print("Dodge Ready! for keyboard!")
	dodgeready = true
	# stop the timer
	$dodgecooldowntimer.stop()
