extends CharacterBody2D

const SPEED = 300.0
const JUMP_VELOCITY = -450.0
var push = 80
var Score = 0
var max_jump = 1


# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")


func _physics_process(delta):
	
	# Add the gravity.
	if not is_on_floor():
		velocity.y += gravity * delta
		$Sprite.animation = "fall"
	elif abs(velocity.x) > 0:
		$Sprite.play("walk")
	else:
		$Sprite.animation = "idle"
	
	

	# Handle Jump.
	if Input.is_action_just_pressed("jump") and is_on_floor():
		$jump_sound.play()
		$Sprite.play("jump")
		velocity.y = JUMP_VELOCITY
		
	if Input.is_action_just_pressed("pause"):
		get_tree().change_scene_to_file("res://mainmenu/pause.tscn")
		

		

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction = Input.get_axis("left", "right")
	if direction:
		velocity.x = direction * SPEED
		if direction < 0:
			$Sprite.flip_h = true
		else:
			$Sprite.flip_h = false
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		
	

	move_and_slide()
	
func bounce():
	velocity.y = JUMP_VELOCITY * 3
	$bounce.play()


func _on_coin_collector_body_entered(body):
	if body.name == "Coins":
		$coin.play()
		body.get_coin(global_position)
		Global.Update_Score(1)
		
			



func _on_level_1_body_entered(body):
	$tele.play()
	get_tree().change_scene_to_file("res://levels/level1.tscn")
	
func _on_to_3_body_entered(body):
	$tele.play()
	get_tree().change_scene_to_file("res://levels/fin.tscn")






func _on_coin_collector_area_entered(area):
	queue_free()





	
