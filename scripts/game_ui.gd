extends Node

@onready var score_player: Label = $ScorePlayer
@onready var score_opponent: Label = $ScoreOpponent

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	# Connect with the signal from Manager
	GameManager.score_updated.connect(update_scores)
	# Updates the scores based on Signal values
	update_scores(GameManager.player1_score, GameManager.player2_score)


func update_scores(p1_score: int, p2_score: int):
	score_player.text = str(p1_score)
	score_opponent.text = str(p2_score)
