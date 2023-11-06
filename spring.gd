extends CharacterBody2D




func _on_boing_body_entered(body):
	if body.name == "player":
		print("fuck")
		body.bounce()
