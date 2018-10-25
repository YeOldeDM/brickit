extends Control

var levels = []

func _ready():
	for i in range(1,11):
		levels[i] = load("res://Game/Levels/Level " + str(i) + ".tscn")
		add_child(levels[i])
		
	
	
	