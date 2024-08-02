extends Node2D

@onready var all_actors: Array = [
	%Actor
]

@onready var hud = %HUD
@onready var camera = %Camera

@onready var states: Dictionary = {
	"StateIdle": %StateIdle
}


var current_state_name: String = ""
var current_state: StateBase = null

var is_dragging_map: bool = false

func _ready():
	change_state("StateIdle")


func change_state(new_state_name: String):
	current_state_name = new_state_name
	hud.label_state_name.text = new_state_name
	if current_state != null:
		current_state.exit_state()
	current_state = states[new_state_name]
	current_state.enter_state()


func _process(delta):
	current_state.process(delta)


func _physics_process(delta):
	current_state.physics_process(delta)
	

func _unhandled_input(event):
	current_state.unhandled_input(event)
	

func get_actor_under_pos(pos: Vector2):
	pass
