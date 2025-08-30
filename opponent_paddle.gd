extends CharacterBody2D

var direction
var target_position

func _physics_process(delta: float) -> void:
	direction = global_position.direction_to(Vector2(global_position.x, target_position.y))
	velocity = direction * 400
	move_and_collide(velocity*delta)

func set_target_position(target_pos):
	target_position = target_pos
	
	
