extends CharacterBody2D

# Defines the Speed of the ball
const SPEED = 750.0
# Defines a random angle to start
var rand_angle := randf_range(0, 2*PI)
# Defines a random direction based on a vector with the random angle
var direction := Vector2.RIGHT.rotated(rand_angle)
# Defines the initial position
@export var start_position: Vector2
@onready var hit_sound: AudioStreamPlayer2D = $HitSound


func _ready() -> void:
	position = start_position

func _physics_process(delta: float) -> void:
	# Assigns the vector based on direction and spd
	velocity = direction * SPEED
	# Checks if everyframe the obj collides in the given vector
	var collision = move_and_collide(velocity * delta)
	
	# If it collides it bounces
	if collision:
		hit_sound.play()
		direction = direction.bounce(collision.get_normal())
		
		var min_angle = PI / 3
		if abs(direction.angle()) < min_angle or abs(direction.angle()) > PI - min_angle:
			direction = Vector2(direction.x, sign(direction.y) * sin(min_angle)).normalized()
		

func reset_position() -> void:
	position = start_position 
	rand_angle = randf_range(0, 2*PI)  
	direction = Vector2.RIGHT.rotated(rand_angle)
	
	
