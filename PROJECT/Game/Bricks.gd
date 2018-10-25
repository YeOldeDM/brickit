extends TileMap







"""
LEVEL BUILDER TEMPLATE

Paint your level tiles onto this node, and save this branch as its own scene
as "res://Game/Levels/Level x.tscn" where x is the level number.

This node has no other use. It will get freed by the game on startup!
"""


















#func _ready():
#	for cell in get_used_cells():
#		var brick = load("res://Brick/%s.tscn" % tile_set.tile_get_name( get_cellv( cell ) ) )
#		if brick:
#			brick = brick.instance()
#			get_parent().call_deferred("add_child", brick)
#			brick.position = map_to_world(cell) - position
#
#
#	queue_free()
