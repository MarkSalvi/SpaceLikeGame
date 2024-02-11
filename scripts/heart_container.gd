extends VBoxContainer

@onready var HeartClass = preload("res://scenes/heart.tscn")

func setMaxHearts(max: int):
	for i in range(max):
		var heart = HeartClass.instantiate()
		add_child(heart)

func updateHearts(currentHealth: int):
	var hearts = get_children()
	hearts[currentHealth].queue_free()
