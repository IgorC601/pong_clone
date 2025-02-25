extends CharacterBody2D

# Defines the Speed of the ball
const SPEED = 750.0
# Defines a random angle to start
var rand_angle := randf_range(0.0, 30.0)
# Defines a random direction based on a vector with the random angle
var direction := Vector2.RIGHT.rotated(rand_angle)
# Defines the initial position
@export var start_position: Vector2

func _ready() -> void:
	position = start_position

func _physics_process(delta: float) -> void:
	# Assigns the vector based on direction and spd
	velocity = direction * SPEED
	# Checks if everyframe the obj collides in the given vector
	var collision = move_and_collide(velocity * delta)
	# If it collides it bounces
	if collision:
		direction = direction.bounce(collision.get_normal())
		

func reset_position() -> void:
	position = start_position 
	rand_angle = randf_range(0.0, 30.0)  
	direction = Vector2.RIGHT.rotated(rand_angle)
	
	
