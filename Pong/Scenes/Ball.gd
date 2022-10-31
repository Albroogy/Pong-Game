extends KinematicBody2D

var speed = 400
var velocity = Vector2.ZERO
var window_size = Vector2(1280, 720)

onready var timer = $Timer

signal score(side)

func _ready():
	randomize()
	move()
func _physics_process(delta):
	var collision = move_and_collide(velocity * speed * delta)
	if collision:
		velocity = velocity.bounce(collision.normal)
	elif position.x > window_size.x or position.x < 0: 
		if position.x < 0:
			emit_signal("score", "Player")
		else:
			emit_signal("score", "Enemy")
		position = Vector2(640, 360)
		velocity = Vector2(0,0)
		timer.start()
			

func _on_Timer_timeout():
	move()
	
func move():
	velocity.x = [-1,1][randi() % 2]
	velocity.y = rand_range(-1,1)
