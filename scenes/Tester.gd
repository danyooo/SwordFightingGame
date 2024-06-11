class_name TesterHurtbox
extends RigidBody2D


var EnemyHurtboxy = EnemyHurtbox.new()

func clear():
	if EnemyHurtboxy.clearcheck == true:
		print("a")
		queue_free()
