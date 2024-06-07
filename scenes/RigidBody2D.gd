extends RigidBody2D




class_name sword

#Sword variables
#Sword's Length
var length = 0
#Sword's Width
var Width = 0
#Sword's Weight Stat
var Weight = 0
#Sword's Durability Stat
var Durability = 0
#Sword momentum stat(0 default)
var momentum = 0
#Sword damage stat(0 default)
var damage = 0

# Calculate hitboxes
func hitbox():
	collision_layer = 2
	collision_mask = 0
#Sword's math for physics/momentum(if u can find any)

#When letter typed, Sword Length/width++

#otherwise length --, width --

#Detection for setting Sword's durability lower when hit

# Detection for amount of momentum behind enemy sword when hitting player's sword, deals certain amount of damage

#Collision for hitting wall(?)

#Detection for mouse movement/joystick movement, sword moves with where it is aimed

#Weight stat slows down momentum

#Momentum increase as sword is swinging

#Sword's weight increases damaage

#Makes sword look at mouse
func _process(delta):
	rotate(get_angle_to(get_global_mouse_position()))
