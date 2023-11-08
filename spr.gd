extends CharacterBody2D


func _on_boing_body_shape_entered(body_rid, body, body_shape_index, local_shape_index):
	if body.name == "Player":
		body.bounce()
