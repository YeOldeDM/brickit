extends KinematicBody2D

# Minimum absolute speed limits
# Keep the balls moving well
const XLIMIT = 500
const YLIMIT = 260



var damage = 5

var deflects = [
	-250,
	-150,
	-50,
	0,
	50,
	150,
	250,
]


var velocity = Vector2(180,600) #must begin with some Y velocity!

signal get_paddle_pos()
signal brick_broke()


func _ready():
	GLOBAL.BALL = self # Subscribe to global BALL ref


func _physics_process(delta):
	var motion = move_and_collide(velocity * delta)
	if motion:
		if position.y >= 744: #768-16(the top of the floor)-8(the size of the ball)
			velocity = Vector2(0,0)
			$Particles2D.emitting = true
			$ParticleTimer.start()
		var col = motion.collider
		if col: #bounce off of solids
			velocity = velocity.bounce( motion.normal )
			if col.is_in_group("paddle"): # Deflect when hitting the paddle.
				var x_diff =  position.x - col.position.x # Should be -32|32
				assert col.has_method("get_width")
				var a = col.get_width() / 6		#length of a section
				var deflection_section = round(x_diff/a) #will be -3|3
				var def_x = deflects[3+deflection_section] #Convert to 0|6
				velocity.x += def_x
				
			# if we hit a brick
			if col.is_in_group("brick"):
#				col.queue_free()
#				yield(col, "tree_exited")
				if col.has_method("take_damage"):
					col.take_damage(self.damage)
				emit_signal("brick_broke")  # Emit even when it doesn't break?  Why not..
				
		
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


func _on_Particle_Timer_timeout():
	$Particles2D.emitting = false
