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
var DodgeTime = 10 # seconds. * SwordWeight?
# Equivalent of "Draw" Function. Delta is telling it to process from the last complete frame
func _physics_process(delta):
	move(delta)
	DodgeTime -=1 # - 1 a second
	#If the dodge button is pressed..
	if Input.is_action_pressed("Dodge"):
		# Dodge! ( Snap the player forwards in the current direction they're moving in)
		# This will depend on the sword the player is wielding. The larger and heavier it is, the less distance and higher cooldown.
		Dodge(DodgeTime, delta)
#If <enemysword> touches player..
	# How much momentum was the enemysword going by?
	# What's the enemysword's damage stat? ( based on a swords weight/size)
	# Multiply momentum x damage and apply damage to health!

var input = Vector2.ZERO
# Detect which way the player is moving (in number format)
func getinput():
	# Use VECTOR2 to support Diagonal Movement
	# x value inputs
	# If "RIGHT" is pressed, bool returns 1. Subracted by "left" is zero. That means we're going right
	# Otherwise, it'll equal -1, going left.
	# Int makes "true" or "false" into a number
	# Get strength is reserved by joysticks, because joysticks can't exactly be pressed left or right.
	input.x =Input.get_axis("GPLeft","GPRight")
	# y value inputs
	input.y =Input.get_axis("GPUp","GPDown")
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
		velocity = velocity.limit_length(Maxspeed)
	move_and_slide()
func wordChoose():
	pass
	# function that, while on the choosing worde scene, takes the players inputs into a list
	# After taking them into a list, merge these into a single string to form a word.
	# Pass this onto the word node.
func Dodge(dodgetime, delta):
	print("Dodge queued")
	## If you can dodge
	await get_tree().create_timer(dodgetime).timeout
	# jump forwards
	print("jumped!")
	velocity += (input * delta)
	# dodgetime

