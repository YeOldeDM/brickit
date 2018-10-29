extends PanelContainer

onready var score_label = $Box/Score/Value
onready var high_score_label = $Box/HighScore/Value

func _ready():
	GLOBAL.connect("score_changed", self, "_on_score_changed")
	GLOBAL.connect("high_score_changed", self, "_on_high_score_changed")
	# Boots
	GLOBAL.score = GLOBAL.score
	GLOBAL.high_score = GLOBAL.high_score


func _on_score_changed( to ):
	score_label.text = str(to)

func _on_high_score_changed(to):
	high_score_label.text = str(to)