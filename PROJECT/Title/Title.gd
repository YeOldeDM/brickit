extends Control

func _on_start_pressed():
	get_tree().change_scene( "res://Game/Game.tscn" )

func _on_shop_pressed():
	get_tree().change_scene( "res://shop/Shop.tscn" )
