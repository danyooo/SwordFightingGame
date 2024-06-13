extends RigidBody2D
#Sword Stats
#Sword's Length (Changes with WordTyped by player)
#Sword's Width(Changes with WordTyped by player)
#Sword's Weight Stat
#Sword's Durability Stat
# This should have phyiscs. A mass, and a weight. It needs to lag behind the larger the sword is to be semi realistic.
#Sword momentum stat(0 default) increasees as the sword is swung (But negatively multiplied by the swords size?
#Sword damage stat(0 default) Scales with size of sword
var durability = 100
# variable to set whether or not sword is visible or not
var clearcheck = false
# Equivalent of "Draw Function"
#Detects if something collided with something
var collided = false
func _physics_process(delta):
	#If collided;
	if collided == true:
		#Subtract durability
		durability = durability - 99
		print(durability)
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

func _on_hurtbox_area_entered(area):
	print("HEEE")
	collided = true

