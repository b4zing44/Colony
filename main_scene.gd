extends Node2D

@onready var all_actors: Array = [
	%Actor
]

@onready var hud = %HUD
@onready var camera = %Camera

@onready var states: Dictionary = {
	"StateIdle": %StateIdle,
	"StateSelected": %StateSelected
}


var current_state_name: String = ""
var current_state: StateBase = null

var is_dragging_map: bool = false

var start_selection: Vector2 = Vector2.ZERO
var rect_selection: Rect2 = Rect2()

func _ready():
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
