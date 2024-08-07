extends Node2D

@onready var all_actors: Array = [
	%Actor,
	%Actor2
]

@onready var hud = %HUD
@onready var camera = %Camera
@onready var np_selection = %NP_Selection
@onready var main_map = %MainMap


@onready var states: Dictionary = {
	"StateIdle": %StateIdle,
	"StateSelected": %StateSelected
}


var current_state_name: String = ""
var current_state: StateBase = null

var is_dragging_map: bool = false

var selection_started: bool = false
var start_selection: Vector2 = Vector2.ZERO
var rect_selection: Rect2 = Rect2()
var current_actors_selection = []

func _ready():
	# Visibility
	np_selection.visible = false

	change_state("StateIdle")


func change_state(new_state_name: String, param_object = null):
	current_state_name = new_state_name
	hud.label_state_name.text = new_state_name
	if current_state != null:
		current_state.exit_state()
	current_state = states[new_state_name]
	current_state.enter_state(param_object)


func _process(delta):
	current_state.process(delta)


func _physics_process(delta):
	current_state.physics_process(delta)


func _unhandled_input(event):
	current_state.unhandled_input(event)


func check_for_actor(pos: Vector2):
	# Transform pos to world space
	var view_to_world = get_canvas_transform().affine_inverse()
	var world_position = view_to_world * pos

	# Find actor under this position
	for actor in all_actors:
		var rect = actor.collision_shape.shape.get_rect()
		rect.position += actor.position

		if rect.has_point(world_position):
			return actor
	return null


func check_for_actors(rect: Rect2) -> Array:
	var actors_found = []
	for actor in all_actors:
		actor.set_pre_selected(false)
		var rect_actor = actor.collision_shape.shape.get_rect() as Rect2
		rect_actor.position += actor.position

		if rect_actor.intersects(rect):
			actors_found.append(actor)
			actor.set_pre_selected(true)
	return actors_found


func update_selection_rect(curr_pos: Vector2) -> Array:
	var view_to_world = get_canvas_transform().affine_inverse()

	var curr_pos_world = view_to_world * curr_pos
	var start_pos_world = view_to_world * start_selection

	var max_x = max(curr_pos_world.x, start_pos_world.x)
	var max_y = max(curr_pos_world.y, start_pos_world.y)
	var min_x = min(curr_pos_world.x, start_pos_world.x)
	var min_y = min(curr_pos_world.y, start_pos_world.y)

	var rect_pos = Vector2(min_x, min_y)

	# Sprite
	np_selection.position = rect_pos
	np_selection.size = Vector2(max_x - min_x, max_y - min_y)

	# Rectangle
	rect_selection.position = rect_pos
	rect_selection.size = np_selection.size

	var actors_under_rect = check_for_actors(rect_selection)
	
	return actors_under_rect
