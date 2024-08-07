extends StateBase
class_name StateIdle

var selected_actors: Array = []

func enter_state(_param_object: Variant):
	pass


func exit_state():
	pass


func process(_delta: float):
	pass


func physics_process(_delta):
	pass


func unhandled_input(event: InputEvent):
	handle_camera_drag(event)
	handle_camera_zoom(event)
	handle_left_click(event)
	handle_mouse_motion(event)

	# Left click
	
			
			

		


