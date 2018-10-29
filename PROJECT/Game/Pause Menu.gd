extends Control

func _input(event):
	if event.is_action_pressed("pause"):
		get_tree().paused = !get_tree().paused
		visible = true if get_tree().paused else false

func _on_BTM_pressed():
	get_tree().change_scene("res://Title/Title.tscn")
	get_tree().paused = false
	visible = false
