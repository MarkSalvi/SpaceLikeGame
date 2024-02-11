class_name Enemy
extends CharacterBody2D



var fire_rate := 0.8
var can_shoot = true
var shoot_timer = 0.0

func _ready():
	add_to_group("enemy")

func _process(delta):
	if can_shoot:
		shoot()
		can_shoot = false
		shoot_timer = 0.0
	elif !can_shoot:
		shoot_timer += delta
		if shoot_timer >= 1.0 / fire_rate:
			can_shoot = true

func shoot():
	var bullet_scene = preload("res://scenes/bullet.tscn").instantiate()
	bullet_scene.velocity = Vector2(0,1)
	bullet_scene.global_position = global_position + Vector2(0,30)
	bullet_scene.rotation_degrees = 180
	get_tree().root.add_child(bullet_scene)

func _physics_process(delta):
	move_and_slide()

func _on_area_2d_area_entered(area):
	if area.is_in_group("bullet"):
		queue_free()
