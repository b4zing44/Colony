extends TileMap



var astar: AStarGrid2D

func _ready():
	init_astar()
	
	
func init_astar():
	var used_rect = get_used_rect()
	astar.region = used_rect
	pass
