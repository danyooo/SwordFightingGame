extends Area2D
var health = 100


func _on_body_shape_entered(body_rid, body, body_shape_index, local_shape_index):
	health - 100
	
