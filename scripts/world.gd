extends Node2D

@onready var heartContainer = $CanvasLayer/heartContainer
@onready var player = $Player

func _ready():
	heartContainer.setMaxHearts(player.MAX_HEALTH)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
