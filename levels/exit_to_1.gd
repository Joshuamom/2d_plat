extends StaticBody2D





func _on_tree_entered():
	if name == "Exit_to_1":
		var _target = get_tree().change_scene_to_file("res://Levels/Level2.tscn")
	if name == "Exit_to_3":
		var _target = get_tree().change_scene_to_file("res://Levels/Game_Over.tscn")
