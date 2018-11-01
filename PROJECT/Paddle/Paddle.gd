extends KinematicBody2D

var SPEED = 280
var _y
var JOY_DEADZONE = 0.1

signal send_paddle_pos()

onready var poly = $Poly

func get_width():
	var v = poly.polygon
	return abs(v[0].x) + abs(v[1].x)


func _ready():
	GLOBAL.PADDLE = self # Subscribe to global PADDLE ref
	_y = position.y 

func _physics_process(delta):
	var LEFT = Input.is_action_pressed("ui_left")
	var RIGHT = Input.is_action_pressed("ui_right")
	
	var input = int(RIGHT)-int(LEFT)
	var joy_x = Input.get_joy_axis(0,0)
	if abs(joy_x) > JOY_DEADZONE:
		input = joy_x
	
	var movement =  move_and_collide( Vector2( input*SPEED,0 )*delta )

	if position.y != _y:
		position.y = _y

func _on_Ball_get_paddle_pos():
	emit_signal("send_paddle_pos", position)