extends Node

const BRICK_VALUE = 50
const FILE_PATH = "user://highscore.data"

signal score_changed(to)
signal high_score_changed(to)

var score = 0 setget _set_score
var high_score = 0 setget _set_high_score

func _ready():
	load_highscore()

func load_highscore():
	var file = File.new()
	if !file.file_exists(FILE_PATH):
		return
	file.open(FILE_PATH, file.READ)
	high_score = file.get_var()
	file.close()
	
func save_highscore():
	var file = File.new()
	file.open(FILE_PATH, file.WRITE)
	file.store_var(high_score)
	file.close()

func _set_score( to ):
	score = to
	print(score)
	emit_signal( "score_changed", score )
	if score > high_score:
		self.high_score = score


func _set_high_score(to):
	high_score = to
	emit_signal("high_score_changed", to)
	save_highscore()