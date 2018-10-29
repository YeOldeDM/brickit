extends Node2D

signal acquired_upgrade()

const UPGRADE_1_PRICE = 50
const UPGRADE_2_PRICE = 100
const UPGRADE_3_PRICE = 150

func _ready():
	$points.set_text("Your Points: " + str(GLOBAL.points))
	connect("acquired_upgrade" , GLOBAL , "update_upgrades")
	connect("acquired_upgrade", self , "display_acquired_upgrade")


func _on_Upgrade_1_pressed():
	var Name = 1
	if GLOBAL.points - UPGRADE_1_PRICE >= 0:
		GLOBAL.points -= UPGRADE_1_PRICE
		emit_signal("acquired_upgrade", Name)
	else: print("you dont have enough points to purchase this upgrade")

func _on_Upgrade_2_pressed():
	var Name = 2
	if GLOBAL.points - UPGRADE_1_PRICE >= 0:
		GLOBAL.points -= UPGRADE_1_PRICE
		emit_signal("acquired_upgrade", Name)
	else: print("you dont have enough points to purchase this upgrade")

func _on_Upgrade_3_pressed():
	var Name = 3
	if GLOBAL.points - UPGRADE_1_PRICE >= 0:
		GLOBAL.points -= UPGRADE_1_PRICE
		emit_signal("acquired_upgrade", Name)
	else: print("you dont have enough points to purchase this upgrade")
	
func display_acquired_upgrade(upgrade):
	$Upgrade_Acquired_Panel/Upgrade_Acquired.set_text("You Acquired upgrade " + str(upgrade))
	$Upgrade_Acquired_Panel.show()
	$Upgrade_Acquired_Panel/Upgrade_Acquired_Timer.start()

func _on_Upgrade_Acquired_Timer_timeout():
	$Upgrade_Acquired_Panel.hide()

func _on_BTM_pressed():
	get_tree().change_scene("res://Title/Title.tscn")