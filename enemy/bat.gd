extends CharacterBody2D

var player = null
@onready var ray = $See
@export var speed = 800
@export var looking_speed = 100
var nav_ready = false
var initial_position = Vector2.ZERO
var mode = ""
var move = 200


var points = []
const margin = 1.5

func _ready():
	$AnimatedSprite2D.play("moving")
	call_deferred("nav_setup")
	initial_position = global_position

func nav_setup():
	# Wait for the first physics frame so the NavigationServer can sync.
	await get_tree().physics_frame
	$NavigationAgent2D.target_position = global_position
	nav_ready = true

func _physics_process(_delta):
	velocity.x = move
	move_and_slide()
	
	if is_on_wall():
		move = -move
		
	if move < 0:
		$AnimatedSprite2D.flip_h = false
	elif move > 0:
		$AnimatedSprite2D.flip_h = true
		


func _on_attack_body_entered(body):
	if body.name == "Player":
		get_tree().reload_current_scene()




func _on_bonk_body_entered(body):
	if body.name == "Player":
		body.bounce()
		$AnimatedSprite2D.play("death")
		queue_free()
		$Death_sound.play()


		



func _on_animated_sprite_2d_animation_finished():
	queue_free()
