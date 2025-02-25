extends Node

# Signal definition
signal score_updated(p1_score: int, p2_score: int)

var player1_score = 0
var player2_score = 0


func add_point_p1():
	# Score update
	player1_score += 1
	# Emit Signal to UI
	score_updated.emit(player1_score, player2_score)

func add_point_p2():
	player2_score += 1
	score_updated.emit(player1_score, player2_score)
