extends Control

var playerScore = 0
var enemyScore = 0

onready var score = $Score
onready var score2 = $Score2

func _on_Ball_score(side):
	if side == "Player":
		enemyScore += 1
		score2.text = str(enemyScore)
	else:
		playerScore += 1
		score.text = str(playerScore)
	if enemyScore >= 5 or playerScore >= 5:
		get_tree().reload_current_scene()
