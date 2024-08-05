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
			return
		# Button up
		else:
			print("left up")


		 #Check for actor under click
		#var actor = main_scene.check_for_actor(event.global_position)
		#if actor != null:
			#main_scene.change_state("StateSelected", actor)
			#return


