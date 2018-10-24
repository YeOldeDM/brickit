extends TileMap

func _ready():
	for cell in get_used_cells():
		var brick = load("res://Brick/%s.tscn" % tile_set.tile_get_name( get_cellv( cell ) ) )
#		var brick = preload("res://Brick/Brick.tscn").instance()
		if brick:
			brick = brick.instance()#eww
			get_parent().call_deferred("add_child", brick)
			brick.position = map_to_world(cell) - position
		
		
	queue_free()
