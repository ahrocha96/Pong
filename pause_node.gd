extends Node

var tree

func _ready():
	tree = get_tree()

func _input(event: InputEvent) -> void:
	if tree.paused and Input.is_action_just_pressed("pause"):
		get_viewport().set_input_as_handled()
		tree.paused = false
		%PauseMenu.visible = false
	if tree.paused and Input.is_action_just_pressed("reset_game"):
		%OpponentPoints.text = "0"
		%PlayerPoints.text = "0"
		%Ball.global_position = %BallStartingPoint.global_position
