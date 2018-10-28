extends Node2D

signal acquired_upgrade()

func _ready():
	$points.set_text("Your Points: " + str(GLOBAL.points))
	connect("acquired_upgrade" , GLOBAL , "update_upgrades")


func _on_Upgrade_1_pressed():
	var Name = 1
	emit_signal("acquired_upgrade", Name)

func _on_Upgrade_2_pressed():
	var Name = 2
	emit_signal("acquired_upgrade", Name)

func _on_Upgrade_3_pressed():
	var Name = 3
	emit_signal("acquired_upgrade", Name)

func _on_BTM_pressed():
	get_tree().change_scene("res://Title/Title.tscn")
