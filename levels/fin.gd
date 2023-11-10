extends Node2D
func _ready():
	$tele.play()
	$forest.play()


func _on_the_end_body_shape_entered(body_rid, body, body_shape_index, local_shape_index):
	if body.name == "Player":
		get_tree().change_scene_to_file("res://end_menu.tscn")
