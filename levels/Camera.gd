extends Camera2D

var player = null

func _ready():
	pass

func _physics_process(_delta):
	player = get_node_or_null("/root/Game/Player_Container/Player")
	if player != null:
		zoom = Vector2(2.0,2.0)
		global_position = player.global_position
	else:
		zoom = Vector2(1,1)
		position = Vector2(0,0)
		
