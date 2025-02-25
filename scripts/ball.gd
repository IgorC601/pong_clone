extends CharacterBody2D

# Defines the Speed of the ball
const SPEED = 750.0
# Defines a random angle to start
var rand_angle := randf_range(0.0, 30.0)
# Defines a random direction based on a vector with the random angle
var direction := Vector2.RIGHT.rotated(rand_angle)

func _physics_process(delta: float) -> void:
	# Assigns the vector based on direction and spd
	velocity = direction * SPEED
	# Checks if everyframe the obj collides in the given vector
	var collision = move_and_collide(velocity * delta)
	# If it collides it bounces
	if collision:
		direction = direction.bounce(collision.get_normal())
	
	
