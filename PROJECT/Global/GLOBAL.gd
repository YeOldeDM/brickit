extends Node

const BRICK_VALUE = 50




signal score_changed(to)
signal high_score_changed(to)

var score = 0 setget _set_score

var high_score = 5000 setget _set_high_score

func _set_score( to ):
	score = to
	emit_signal( "score_changed", to )
	if score > high_score:
		self.high_score = score


func _set_high_score(to):
	high_score = to
	emit_signal("high_score_changed", to)