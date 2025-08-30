extends Area2D

signal point_scored

func _on_body_exited(body: Node2D) -> void:
	point_scored.emit(body)
	
