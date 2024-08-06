extends StateBase
class_name StateIdle



func enter_state(param_object: Variant):
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

	# Left click
	if event.is_action("click_left"):
		# Button down
		if event.is_pressed():
			print("left down")
			main_scene.start_selection = event.global_position
			main_scene.selection_started = true
			return
		# Button up
		else:
			print("left up")
			# Selection ended
			if main_scene.selection_started:
				main_scene.selection_started = false
				main_scene.np_selection.visible = false
				return
			# Normal click, check if actor under mouse pointer
			var clicked_actor = main_scene.check_for_actor(event.global_position)
			
			pass
				
				
			return
	elif event is InputEventMouseMotion:
		if main_scene.selection_started:
			main_scene.np_selection.visible = true
			main_scene.update_selection_rect(event.global_position)

		


