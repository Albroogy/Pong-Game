extends KinematicBody2D

var direction = Vector2.ZERO

export var speed = 250

func _physics_process(delta):
	direction.y = Input.get_axis("ui_up", "ui_down")
	move_and_slide(direction * speed)



