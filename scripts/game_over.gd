extends Control

@onready var exitButton = $exitButton
@onready var playAgain = $playAgain
@onready var gameOver = $gameOver

func _ready():
	var screenSize = DisplayServer.screen_get_size()
	#get_viewport().size = screenSize
	exitButton.position = Vector2(((screenSize.x)-(exitButton.size.x * exitButton.scale.x)), (exitButton.size.y))
	playAgain.position = Vector2(((screenSize.x/2)-playAgain.size.x), ((screenSize.y/2)-playAgain.size.y))
	gameOver.position = Vector2(((screenSize.x/2)), ((screenSize.y/2)-gameOver.size.y-playAgain.size.y-10))

func _on_play_again_button_down():
	get_tree().change_scene_to_file("res://scenes/world.tscn")

func _on_exit_button_button_down():
	get_tree().quit()
