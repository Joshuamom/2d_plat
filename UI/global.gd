extends Node

var Score = 0

func Update_Score(s):
	Score += s
	var hud = get_node_or_null("/root/game/UI/HUD")
	if hud != null:
		hud.Update_Score()
