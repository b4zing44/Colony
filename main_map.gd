extends TileMap


var astar: AStarGrid2D

func _ready():
	init_astar()


func init_astar():
	var used_rect = get_used_rect()
	astar = AStarGrid2D.new()
	astar.region = used_rect
	astar.cell_size = Vector2(16, 16)
	astar.update()

	# Set solid
	var ground_cells = get_used_cells(0)
	for x in range(used_rect.position.x, used_rect.end.x):
		for y in range(used_rect.position.y, used_rect.end.y):
			var cell = Vector2i(x, y)
			if cell in ground_cells:
				astar.set_point_solid(cell, false)
			else:
				astar.set_point_solid(cell, true)


func get_point_path(start_cell: Vector2i, target_cell: Vector2i):
	
	return astar.get_point_path(start_cell, target_cell)
	
