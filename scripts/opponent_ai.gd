extends CharacterBody2D

const SPEED = 500.0
const BUFFER = 65.0
@onready var ball: CharacterBody2D = %Ball

		
func _physics_process(delta: float) -> void:
	var target_y = ball.position.y
	var distance = target_y - position.y
	
	if abs(distance) > BUFFER:
		var direction = sign(distance)
		velocity = Vector2(0, direction * SPEED)
		move_and_collide(velocity * delta)
