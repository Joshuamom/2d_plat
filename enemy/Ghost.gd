extends CharacterBody2D


var speed = 80
var face_right = false
var move = 100

func _ready():
	$AnimatedSprite2D.play("idle")


func _physics_process(delta):
	velocity.x = move
	move_and_slide()
	
	if is_on_wall():
		move = -move
		
	if move > 0:
		$AnimatedSprite2D.flip_h = false
	else:
		$AnimatedSprite2D.flip_h = true
	
	
func _on_attack_body_entered(body):
	if body.name == "Player":
		get_tree().reload_current_scene()
		queue_free()
		
