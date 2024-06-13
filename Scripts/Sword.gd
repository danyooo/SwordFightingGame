extends Area2D
class_name EnemyHurtbox
var health = 100
var clearcheck = false
#Detects if something collided with the tester's body
func _on_hurtbox_area_entered(area):
	var body_entered = true
	#If collided;
	if body_entered:
		#Subtract health
		health = health - 99
		print(health)
		print(clearcheck)
		#If health is less then 1, print game over
		if health < 1:
				print("game over")
				var clearcheck = true
				print(clearcheck)
			


