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
#Sword momentum stat(0 default) increasees as the sword is swung (But negatively multiplied by the swords size?
#Sword damage stat(0 default) Scales with size of sword
# variable to set whether or not sword is visible or not
var clearcheck = false
# Equivalent of "Draw Function"
#Detects if something collided with something
var collided = false
# var for storing mouse velocity
var mouseVel : Vector2
func _process(delta):
	# Event to grab mouses velocity
	_input(InputEventMouse)
	
func _physics_process(delta):
# applies the rotational force from MouseVelocity
	apply_torque(mouseVel.x * 100) 
	apply_torque(mouseVel.y * 100) 
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
	if event is InputEventMouseMotion:
		mouseVel = event.get_velocity()
		print("MouseVelocity ", mouseVel)
	else:
		mouseVel = Vector2.ZERO
