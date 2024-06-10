extends Area2D
var health := 100;

#Detects if something collided with the tester's body
func _on_body_shape_entered(body_rid, body, body_shape_index, local_shape_index):
	#If collided;
	if body_entered:
		#Subtract health
		health = health - 99
		print(health)
		#If health is less then 1, print game over
		if health < 1:
				print("game over")
				hide()
				queue_free()
