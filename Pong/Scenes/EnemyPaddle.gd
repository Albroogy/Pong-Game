extends KinematicBody2D

var speed = 250

onready var ball = get_parent().find_node("Ball")

func _physics_process(delta):
	move_and_slide(Vector2(0, opponent_direction()) * speed)
	
func opponent_direction():
	if ball.position.y - position.y > 30:
		return 1
	elif ball.position.y - position.y < -30:
		return -1
	else: return 0

	
