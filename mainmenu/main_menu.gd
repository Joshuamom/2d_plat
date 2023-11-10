extends Control


func _ready():
	$menu.play()

func _on_play_pressed():
	$button.play()
	get_tree().change_scene_to_file("res://game.tscn")

func _on_quit_pressed():
	$button.play()
	get_tree().quit()
