extends Node

var Score = 0


func Update_Score(s):
	Score += s
	var hud = get_node_or_null("/root/Game/can/Score")
	if hud != null:
		hud.text = "Score: " + str(Global.Score)
		print("i")
	else:
		print("0")
	

func _process(_delta):
	if Input.is_action_just_pressed("pause"):
			var menu = get_node_or_null("/root/Game/UI/pause")
			if menu == null:
				get_tree().quit()
			else:
				if menu.visible:
					get_tree().paused = false
					menu.hide()
				else:
					get_tree().paused = true
					menu.show()

