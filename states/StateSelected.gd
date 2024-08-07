extends StateBase
class_name StateSelected

var selected_actors = []


func enter_state(param_object: Variant):
	# Shift pressed
	if Input.is_action_pressed("shift"):
		for new_actor in param_object:
			if not selected_actors.has(new_actor):
				selected_actors.append(new_actor)
	# Shift not pressed
	else:
		# Deselect former selection
		for actor in selected_actors:
			actor.set_selected(false)
			
		selected_actors = param_object
	# Set all actors in array to selected
	for actor in selected_actors:
		actor.set_selected(true)


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
	handle_right_click(event)
	handle_mouse_motion(event)





