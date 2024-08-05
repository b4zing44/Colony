extends StateBase
class_name StateSelected

var selected_actors = []


func enter_state(param_object: Variant):
	# Init selection array
	if param_object is Array:
		selected_actors = param_object
	else:
		selected_actors = []
		selected_actors.append(param_object)
		
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

	## Left click
	if event.is_action_pressed("click_left"):
		event = event as InputEventMouseButton

		# Check for actor under click
		var actor = main_scene.check_for_actor(event.global_position)
		if actor != null:
			main_scene.change_state("StateSelected", actor)
			return
			
		# Click on 
			
			
			
