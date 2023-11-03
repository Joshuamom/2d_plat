extends Node
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
