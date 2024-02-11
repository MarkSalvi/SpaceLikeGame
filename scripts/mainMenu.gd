extends Control

@onready var exitButton = $exitButton
@onready var playButton = $playButton

# Called when the node enters the scene tree for the first time.
func _ready():
	var screenSize = DisplayServer.screen_get_size()
	get_viewport().size = screenSize
	exitButton.position = Vector2(((screenSize.x)-(exitButton.size.x * exitButton.scale.x)), (exitButton.size.y))
	playButton.position = Vector2(((screenSize.x/2)-playButton.size.x), ((screenSize.y/2)-playButton.size.y))

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_exit_button_button_down():
	get_tree().quit()

func _on_play_button_button_down():
	get_tree().change_scene_to_file("res://scenes/world.tscn")

#todo make everything scaled based on the screen size X(
