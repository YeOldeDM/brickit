extends KinematicBody2D

var SPEED = 200

var _y

signal send_paddle_pos()

func _ready():
	_y = position.y

func _physics_process(delta):
	var LEFT = Input.is_action_pressed("ui_left")
	var RIGHT = Input.is_action_pressed("ui_right")
	
	var input = int(RIGHT)-int(LEFT)
	
	move_and_collide( Vector2( input*SPEED,0 )*delta )

	if position.y != _y:
		position.y = _y

func _on_Ball_get_paddle_pos():
	emit_signal("send_paddle_pos", position)