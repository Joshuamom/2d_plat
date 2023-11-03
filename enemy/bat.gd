extends CharacterBody2D

var player = null
@onready var ray = $See
@export var speed = 800
@export var looking_speed = 100
var nav_ready = false
var initial_position = Vector2.ZERO
var mode = ""


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
		move_and_slide()


func _on_attack_body_entered(body):
	if body.name == "Player":
		get_tree().reload_current_scene()
		queue_free()



func _on_bonk_body_entered(body):
	if body.name == "Player":
		$AnimatedSprite2D.play("death")
		



func _on_animated_sprite_2d_animation_finished():
	queue_free()
