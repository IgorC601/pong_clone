extends Area2D

@onready var timer: Timer = $Timer
@onready var game_manager: Node = %GameManager

func _on_body_entered(body: Node2D) -> void:
	if name == "ScoreArea":
		GameManager.add_point_p2()
	elif name == "ScoreArea2":
		GameManager.add_point_p1()
		
	timer.start()

func _on_timer_timeout() -> void:
	Engine.time_scale = 1
	get_tree().reload_current_scene()
