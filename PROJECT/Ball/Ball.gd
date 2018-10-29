extends KinematicBody2D

# Minimum absolute speed limits
# Keep the balls moving well
const XLIMIT = 260
const YLIMIT = 260
# How much ball is deflected left/right when hitting the edge of the paddle
const PADDLE_DEFLECT = 120

var deflects = [
	-150,
	-75,
	-32,
	0,
	32,
	75,
	150,
]


var velocity = Vector2(180,600) #must begin with some Y velocity!

signal get_paddle_pos()
signal brick_broke()

func _physics_process(delta):
	var motion = move_and_collide(velocity * delta)
	if motion:
		if position.y >= 584: #if ball touches floor set its velocity to 0
			velocity = Vector2(0,0)
		var col = motion.collider
		if col: #bounce off of solids
			velocity = velocity.bounce( motion.normal )
			if col.is_in_group("paddle"): # Deflect when hitting the paddle.
				var x_diff =  position.x - col.position.x # Should be -32|32
				var a = 64/6	#length of a section
				var deflection_section = round(x_diff/a) #will be -3|3
				var def_x = deflects[3+deflection_section] #Convert to 0|6
#				print(def_x)
				velocity.x = def_x
				
				
#				velocity.x = x_diff * PADDLE_DEFLECT
			# if we hit a brick
			if col.is_in_group("brick"):
				col.queue_free()
				yield(col, "tree_exited")
				emit_signal("brick_broke")
				
		
	#while the ball is not moving - aka velocity = 0 - get the position of the paddle
	while velocity == Vector2(0,0):
		emit_signal("get_paddle_pos")
		break
	
	#if player pressed space bar while the ball isnt moving then give ball velocity
	if Input.is_action_just_pressed("launch_ball") and velocity == Vector2(0,0):
		velocity = -Vector2(0,600)

	# maintain a constant vertical speed
	velocity.y = YLIMIT * sign(velocity.y)
	if abs( velocity.x ) > XLIMIT:
		velocity.x = XLIMIT * sign(velocity.x)

func _on_Paddle_send_paddle_pos(paddle_pos):
	position.x = paddle_pos.x
	position.y = paddle_pos.y - 8

#func _on_Paddle_ll():
#	velocity = Vector2(-150,-150)
#	print("ll")
#
#func _on_Paddle_lr():
#	velocity = Vector2(-75,-75)
#	print("lr")
#
#func _on_Paddle_ml():
#	velocity = Vector2(-32,-32)
#	print("ml")
#
#func _on_Paddle_mr():
#	velocity = Vector2(32,-32)
#	print("mr")
#
#func _on_Paddle_rl():
#	velocity = Vector2(75,-75)
#	print("rl")
#
#func _on_Paddle_rr():
#	velocity = Vector2(150,-150)
#	print("rr")
