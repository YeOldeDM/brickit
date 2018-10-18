extends KinematicBody2D

# Minimum absolute speed limits
# Keep the balls moving well
const XLIMIT = 60
const YLIMIT = 300
# How much ball is deflected left/right when hitting the edge of the paddle
const PADDLE_DEFLECT = 130

var velocity = Vector2(180,600) #must begin with some Y velocity!

func _physics_process(delta):
	var motion = move_and_collide(velocity * delta)
	if motion:
		var col = motion.collider
		if col: #bounce off of solids
			velocity = velocity.bounce( motion.normal )
			if col.is_in_group("paddle"): # Deflect when hitting the paddle.
				var x_diff = col.position.x - position.x
				velocity.x -= x_diff * PADDLE_DEFLECT
				

	# maintain a constant vertical speed
	velocity.y = YLIMIT * sign(velocity.y)
	if abs( velocity.x ) > XLIMIT:
		velocity.x = XLIMIT * sign(velocity.x)