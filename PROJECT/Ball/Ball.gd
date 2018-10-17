extends KinematicBody2D

const YSPEED = 600

var velocity = Vector2(180,600) #must begin with some Y velocity!

func _physics_process(delta):
	var motion = move_and_collide(velocity * delta)
	if motion:
		var col = motion.collider
		if col: #bounce off of solids
			velocity = velocity.bounce( motion.normal )

	# maintain a constant vertical speed
	velocity.y = YSPEED * sign(velocity.y)
