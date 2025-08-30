extends Node2D

var tree

func _ready():
	tree = get_tree()
	
func _input(event: InputEvent) -> void:
	if Input.is_action_just_pressed("pause"):
		tree.paused = true
		%PauseMenu.visible = true
	
func _physics_process(delta: float) -> void:
	%OpponentPaddle.set_target_position(%Ball.global_position)

func _on_court_point_scored(body) -> void:
	%PointScoredSound.play()
	if body.global_position.distance_to(%PlayerPaddle.global_position) < body.global_position.distance_to(%OpponentPaddle.global_position):
		increment_points(%OpponentPoints)
	else:
		increment_points(%PlayerPoints)

	reset_ball()
	
func reset_game():
	%OpponentPoints.text = 0
	%PlayerPoints.text = 0
	reset_ball()

func increment_points(player_score_label):
	var new_score = int(player_score_label.text) + 1
	player_score_label.text = str(new_score)

func reset_ball():
	%Ball.global_position = %BallStartingPoint.global_position
	
