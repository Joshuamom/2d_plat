extends Node2D




func _on_springy_body_entered(body):
	if body.name == "Player":
		body.bounce()
		
