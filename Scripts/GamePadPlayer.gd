extends CharacterBody2D
# Export the character's file for use in other scripts
@export_file() var GamePadPlayer
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
var dodgecooldown = 3 #  10 seconds by defa lt. * SwordWeight?
 #Dodge is available by default
var dodgeready = true
var dodgeDist = 20 # 20 default affected by swordWeight.
# Add a new velocity just for dodging
var dodgeVelocity: Vector2
# collision variable
var being_collided :bool
#knockback variable. added this so that the players dont both knock each other back at the same time
var knockback = Vector2.ZERO
# Equivalent of "Draw" Function. Delta is telling it to process from the last complete frame
func _physics_process(delta):
	var knockback = knockback.move_toward(Vector2.ZERO, 200 * delta)
	#if a collision occurs
	if being_collided == true:
		# What did you collide with?
		for i in get_slide_collision_count():
			var collision = get_slide_collision(i)
			print("Collided with: ", collision.get_collider().name)
			# How fast was the collider moving?
			collision.get_collider_velocity() # Get the colliders velocity
			print("Collider velocity is.. ", collision.get_collider_velocity())
			# Get pushed back (within the bounds of max speed)
			knockback = collision.get_collider_velocity()
			velocity = knockback
			
			#velocity.limit_length(Maxspeed)
			#velocity += collision.get_collider_velocity()
	move(delta)
	#If the dodge button is pressed..
	if Input.is_action_pressed("GPDodge") && dodgeready == true:
		# This will depend on the sword the player is wielding. The larger and heavier it is, the less distance and higher cooldown.
		# Dodge!
		Dodge(input,dodgeDist, delta)
		# Dodge goes on cooldown
		$dodgecooldowntimer2.set_wait_time(dodgecooldown)
		$dodgecooldowntimer2.start()
		dodgeready = false
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
func _on_dodgecooldowntimer_2_timeout():
# Set dodge ready to true
	print("Dodge Ready! for GamePad!")
	dodgeready = true
	$dodgecooldowntimer2.stop()



func _on_area_2d_area_entered(area):
	being_collided = true
	print("Player 2 collission!")


func _on_collision_detector_area_exited(area):
	being_collided = false
