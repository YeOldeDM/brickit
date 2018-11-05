extends Area2D

var SPEED = 420
var spin_rate = 2.5
var AIM_TIME = 0.3

var spin_time = 2.5

enum STATE {
	SPIN,
	AIM,
	STRIKE,
}
var state = STATE.SPIN
var aiming = false

func die():
	queue_free()



func _physics_process(delta):
	match state:
		STATE.SPIN:
			rotation = fmod(rotation + (spin_rate * delta), 2*PI)
			spin_time -= delta
			spin_rate += delta * 5
			if spin_time <= 0:
				state = STATE.AIM
		STATE.AIM:
			if GLOBAL.PADDLE and not aiming:
				var aim_angle = ( GLOBAL.PADDLE.global_position - global_position).angle()
				$Tween.interpolate_property(self, "rotation", rotation, aim_angle, AIM_TIME, Tween.TRANS_LINEAR, Tween.EASE_OUT )
				$Tween.start()
				aiming = true

		STATE.STRIKE:
			var motion = transform.x * SPEED * delta
			position += motion


func _on_Spear_body_entered(body):
	if body == GLOBAL.PADDLE:
		body.get_hit(self)
		die()



func _on_Tween_tween_completed(object, key):
	if state == STATE.AIM:
		state = STATE.STRIKE
