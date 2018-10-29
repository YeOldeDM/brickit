extends KinematicBody2D

var SPEED = 280
var _y
var JOY_DEADZONE = 0.1

signal send_paddle_pos()
signal ll()
signal lr()
signal ml()
signal mr()
signal rl()
signal rr()


func _ready():
	_y = position.y 
	

func _physics_process(delta):
	var LEFT = Input.is_action_pressed("ui_left")
	var RIGHT = Input.is_action_pressed("ui_right")
	
	var input = int(RIGHT)-int(LEFT)
	var joy_x = Input.get_joy_axis(0,0)
	if abs(joy_x) > JOY_DEADZONE:
		input = joy_x
	
	var movement =  move_and_collide( Vector2( input*SPEED,0 )*delta )
#	if	movement: # here im supposed to get through if there is a collider
#		var col = movement.collider
#		if col and col.is_in_group("balls"): #here if the collision is with the ball
#			print("works")
#			#from here on out  i check which section of the paddle the ball hit
#			#there are six sections, the letter 'l' represents left, 'r' right and 'm' middle.
#			#then it emits signals to ball, and there depending on which section was hit, 
#			#the ball gets different velocity vector to go in a different direction
#			if movement.position.x > position.x - 24 and movement.position.x <= position.x - 16:
#				emit_signal("ll")
#
#			elif movement.position.x > position.x - 16 and movement.position.x <= position.x - 8:
#				emit_signal("lr")
#
#			elif movement.position.x > position.x - 8 and movement.position.x <= position.x:
#				emit_signal("ml")
#
#			elif movement.position.x > position.x and movement.position.x <= position.x + 8:
#				emit_signal("mr")
#
#			elif movement.position.x > position.x + 8 and movement.position.x <= position.x + 16:
#				emit_signal("rl")
#
#			elif movement.position.x > position.x + 16 and movement.position.x <= position.x + 24:
#				emit_signal("rr")
		

	if position.y != _y:
		position.y = _y

func _on_Ball_get_paddle_pos():
	emit_signal("send_paddle_pos", position)