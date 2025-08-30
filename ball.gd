extends CharacterBody2D

var direction = Vector2(1,0)

func _ready():
	velocity = Vector2(700, 0).rotated(0.8)

func _physics_process(delta: float) -> void:
	var collision = move_and_collide(velocity * delta)
	if collision:
		%CollisionSound.play()
		velocity = velocity.bounce(collision.get_normal())
	
