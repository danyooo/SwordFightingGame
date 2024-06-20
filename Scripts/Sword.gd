extends RigidBody2D
#Sword Stats
#Sword's Length (Changes with WordTyped by player)
var length = 0
#Sword's Width(Changes with WordTyped by player)
var width = 0
#Sword's Weight Stat
var weight = 0
#Sword's Durability Stat
var durability = 100
# This should have phyiscs. A mass, and a weight. It needs to lag behind the larger the sword is to be semi realistic.
#Sword damage stat(0 default) Scales with size of sword
# variable to set whether or not sword is visible or not
var clearcheck = false
# Equivalent of "Draw Function"
#Detects if something collided with something
var collided = false
# var for storing mouse velocity
var mouseVel : Vector2
# var for mouse Position
var mousePos
# Rotational Offset ( From Mouse)
var RotOffset
# PIDController Variables. 
# These are the forces behind the 'error' correction. These need to be tuned to work properly
const kP = 1.03125
const kD = 1
# Error in this case refers to the current point of the sword ( and how far it is from the desired pos)
# This is an error because.. it's not where it should be.
var lastError = 0
func _process(delta):
	# Event to grab mouses velocity
	_input(InputEventMouse)
func _physics_process(delta):
	# Error is the offset from point
	# Get mouse postion // difference from sword to mouse
	mousePos = get_global_mouse_position()
	RotOffset = rad_to_deg(get_angle_to(mousePos))
	var error = RotOffset
	# the "push" force.
	# This applies the static "power" and multiplies them depending on the error
	# In this equation, the force is applied..
	# KP * error is essentially giving 'moving power'. since error is the distance from sword -> cursor, it applies some force there
	# kD * ((error - lastError) / delta) is something like dampening power. kD is a default dampening, and it  should
	# decrease as the error gets close to the desired postition, and as it does it should go in the negatives,
	#leading to a velocity decreaste (as it offsets the positive movement)
	var force = kP * mass * error + kD * ((error - lastError) / delta)
	# keep track of the error for next time
	lastError = error
# Look at cursor
	point_to_cursor(RotOffset,force)
 #applies the rotational force from MouseVelocity
	#apply_torque(mouseVel.x * 100) 
	#apply_torque(mouseVel.y * 100) 
	#If collided;
	if collided == true:
		#Subtract durability
		durability = durability - 99
		print(durability)
		print("collided with ",get_colliding_bodies())
		print(clearcheck)
		#If health is less then 1, print game over
		if durability < 1:
				print("game over")
				var clearcheck = true
				print(clearcheck)
				

# This should pass along its mass/weight to the player in order to change the player's dash cooldown/distance to be more realistic.


#Sword's math for physics/momentum(if u can find any)

#When letter typed, Sword Length/width++

#otherwise length --, width --

#Weight stat slows down momentum

#Momentum increase as sword is swinging

#Sword's weight increases damaage
# Draw function party
# This should move with the players mouse // left joystick. Sword is weighed down by its size.
#Collision check  on other swords, players, arena.
# Detection for amount of momentum behind enemy sword when hitting player's sword, deals certain amount of damage	
	#Detection for setting Sword's durability lower when hit
func _on_hitbox_area_entered(area):
	print("HEEE")
	collided = true


func _on_hit_box_area_exited(area):
	collided = false



 # func to grab mouse velocity
func _input(event):
	# if the input is a mousemovement
	if event is InputEventMouseMotion:
		# get mouse velocity
		mouseVel = event.get_velocity()
	else:
		# otherwise mouse velocity is zero
		mouseVel = Vector2.ZERO



# set max velocity to that of the mouse --> when mouse reaches zero velocity so does this!!
func point_to_cursor(offset,force):
	# if rotation is larger/smaller than zero redirect back to zero (pointing to cursor)
	#use a PID controller to disable the fluctuations of the sword
	if offset > 0:
		apply_torque(500 * force)
	elif offset < 0:
		apply_torque(500 * force)
