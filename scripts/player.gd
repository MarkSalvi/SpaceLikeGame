class_name Player
extends CharacterBody2D

const MAX_HEALTH = 3
const SPEED = 200.0
var fire_rate := 2
var can_shoot = true
var shoot_timer = 0.0
var health = MAX_HEALTH
var current_dir = "none"
var first = true
@onready var heartContainer = $"../CanvasLayer/heartContainer"

func _process(delta):
	if can_shoot and Input.is_action_pressed("fire"):
		shoot()
		can_shoot = false
		shoot_timer = 0.0
	elif !can_shoot:
		shoot_timer += delta
		if shoot_timer >= 1.0 / fire_rate:
			can_shoot = true

func shoot():
	var bullet_scene = preload("res://scenes/bullet.tscn").instantiate()
	bullet_scene.velocity = Vector2(0,-1)
	bullet_scene.global_position = global_position + Vector2(0,-30)
	get_tree().root.add_child(bullet_scene)
 
func _physics_process(delta):
	player_movement()

func player_movement():
	if Input.is_action_pressed("move_right"):
		play_anim()
		current_dir = "right"
		velocity.x = SPEED
	elif Input.is_action_pressed("move_left"):
		play_anim()
		current_dir = "left"
		velocity.x = -SPEED
	else: 
		play_anim()
		current_dir = "none"
		velocity.x = 0
	move_and_slide()

func play_anim():
	
	var dir = current_dir
	var anim = $AnimatedSprite2D
	
	match dir:
		"right":
			anim.play("roll_right")
		"left":
			anim.play("roll_left")
		"none":
			anim.play("idle")
		_:
			print("Error while animating")

func game_over():
	get_tree().change_scene_to_file("res://scenes/game_over.tscn")

func _on_area_2d_area_entered(area):
	if area.is_in_group("bullet"):
		health -= 1
		heartContainer.updateHearts(health)
		if health <= 0:
			get_tree().call_group("bullet", "remove_bullets")
			game_over()
