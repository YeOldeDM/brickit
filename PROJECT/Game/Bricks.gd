extends TileMap

func _ready():
	for cell in get_used_cells():
		var brick = preload("res://Brick/Brick.tscn").instance()
		add_child(brick)
		brick.position = map_to_world(cell)
	queue_free()
