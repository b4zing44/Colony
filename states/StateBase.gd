extends Node
class_name StateBase

@export var main_scene: Node

var pre_selected_actors: Array = []

func enter_state(param_object: Variant):
	pass


func exit_state():
	pass


func process(_delta: float):
	pass


func physics_process(_delta):
	pass


func unhandled_input(event: InputEvent):
	pass


func handle_camera_drag(event: InputEvent):
	if event.is_action_pressed("click_middle"):
		main_scene.is_dragging_map = true
	elif event.is_action_released("click_middle"):
		main_scene.is_dragging_map = false
	if main_scene.is_dragging_map and event is InputEventMouseMotion:
		event = event as InputEventMouseMotion
		main_scene.camera.translate(-event.relative * (main_scene.camera.zoom * 2))


func handle_camera_zoom(event: InputEvent):
	if event.is_action("scroll_down"):
		main_scene.camera.zoom -= Vector2(0.1, 0.1)
	elif event.is_action("scroll_up"):
		main_scene.camera.zoom += Vector2(0.1, 0.1)


func handle_left_click(event: InputEvent):
	if event.is_action("click_left"):
		# Button down
		if event.is_pressed():
			print("left down")
			main_scene.start_selection = event.global_position
			main_scene.selection_started = true
			pre_selected_actors = main_scene.update_selection_rect(event.global_position)
			return
		# Button up
		else:
			print("left up")
			# Selection ended
			if main_scene.selection_started:
				# Remove pre selection
				for actor in pre_selected_actors:
					actor.set_pre_selected(false)

				# Stop selection
				main_scene.selection_started = false
				main_scene.np_selection.visible = false

				# Change state
				main_scene.change_state("StateSelected", pre_selected_actors)
				return


func handle_right_click(event: InputEvent):
	if event.is_action("click_right"):
		if not event.is_pressed():
			# Check if clicked on free cell in map
			var view_to_world = main_scene.get_canvas_transform().affine_inverse()
			var event_global_position = view_to_world * event.position
			var cell_clicked = (main_scene.main_map as TileMap).local_to_map(event_global_position)
			
			var current_cell = 
			
			pass
	pass

func handle_mouse_motion(event: InputEvent):
	if event is InputEventMouseMotion:
		if main_scene.selection_started:
			main_scene.np_selection.visible = true
			pre_selected_actors = main_scene.update_selection_rect(event.global_position)
