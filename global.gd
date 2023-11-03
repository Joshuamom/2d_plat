extends Node

var Score = 0

func Update_Score(s):
	Score += s
	var hud = get_node_or_null("/root/game/can")
	if hud != null:
		hud.Update_Score()
	

func _process(_delta):
	if Input.is_action_just_pressed("pause"):
			var menu = get_node_or_null("/root/game/UI/pause")
			if menu == null:
				get_tree().quit()
			else:
				if menu.visible:
					get_tree().paused = false
					menu.hide()
				else:
					get_tree().paused = true
					menu.show()
