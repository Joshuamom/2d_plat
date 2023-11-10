extends Control

func _ready():
	$win.play()


func _on_retry_pressed():
	$button.play()
	get_tree().change_scene_to_file("res://game.tscn")


func _on_quit_pressed():
	$button.play()
	get_tree().quit()
