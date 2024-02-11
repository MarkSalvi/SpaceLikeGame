extends Area2D

var speed := 200
var velocity: Vector2 = Vector2()

var max_distance = 2000

var current_distance = 0.0

func _process(delta) -> void:
	add_to_group("bullet")
	position += velocity * delta * speed
	current_distance += velocity.length() * delta * speed
	if current_distance >= max_distance:
		queue_free()



func _on_area_entered(area):
	if area.is_in_group("bullet"):
		pass
	else:	
		queue_free()

func remove_bullets():
	queue_free()
