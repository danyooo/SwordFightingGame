class_name TesterHurtbox
extends RigidBody2D

var test = 100
#var EnemyHurtboxy = EnemyHurtbox.new()
#
#func clear():
	#if EnemyHurtboxy.clearcheck == true:
		#print("a")
		#queue_free()
func funytest():
	test - 1
	if test < 100:
		hide()
	
